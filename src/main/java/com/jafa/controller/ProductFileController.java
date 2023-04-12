package com.jafa.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.FileNameMap;
import java.net.URLConnection;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
public class ProductFileController {

	@GetMapping("/imgProductDisplay")
	public ResponseEntity<byte[]> imgDisplay(String fileName) throws IOException{
		File file = new File("c:/file_product",fileName); // "c:/file_product" 폴더아래에 있는 fileName으로 지정된 파일을 찾음(1/상품이이지.jpg)
		if (!file.exists()) { // 요청받은 fileName으로 지정된 이미지 파일이 존재하지 않을 경우
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND); // 404 상태 코드를 반환하여 이미지 파일이 없음을 알려줌
		}
		HttpHeaders headers = new HttpHeaders(); // 응답헤더 생성
		FileNameMap fileNameMap = URLConnection.getFileNameMap();
		headers.add("Content-Type", fileNameMap.getContentTypeFor(fileName)); // fileName을 통해 이미지 파일의 MIME 타입을 찾아서 응답 헤더에 추가
		return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK); 
		// 이미지 파일을 byte[] 형태로 읽어와서 ResponseEntity<byte[]> 형태로 응답을 반환
	}
	
	@GetMapping(value = "/productDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downLoad(@RequestHeader("User-Agent") String userAgent,
											String fileName) throws UnsupportedEncodingException{
		
		Resource resource = new FileSystemResource("c:/file_product/"+fileName);
		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND); 
		}
		// 다운로드시 파일 이름 처리
		HttpHeaders headers = new HttpHeaders();
		String downFileName = new String(resource.getFilename().getBytes("UTF-8"), "ISO-8859-1");
		headers.add("Content-Disposition", "attach;fileName="+downFileName);
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
}
