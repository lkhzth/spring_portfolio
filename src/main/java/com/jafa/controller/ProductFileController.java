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
		File file = new File("c:/file_product",fileName); // 1/상품이이지.jpg
		if (!file.exists()) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND); 
		}
		
		HttpHeaders headers = new HttpHeaders();
		FileNameMap fileNameMap = URLConnection.getFileNameMap();
		headers.add("Content-Type", fileNameMap.getContentTypeFor(fileName));
		return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
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
