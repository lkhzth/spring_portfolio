package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jafa.domain.Criteria;
import com.jafa.domain.ReplyVO;
import com.jafa.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reply")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	// 요청이 /reply/new로 오면,
	// 정보를 조회해서 리턴 하는데, 정보 형태는 json이고, 전달 결과물은
	// 평범한 문자열 형태.

	@PostMapping(value="/new", consumes = "application/json"
			, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		// @RequestBody는 json 형태로 받은 값을 객체로 변환
		log.info("ReplyVO: " + vo);
		int insertCount = service.register(vo);
		log.info("Reply insert count: " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		// ResponseEntity : 웹페이지 생성(상태코드, 헤더, 응답, 데이터)
		// 3항 연산자 이용.
		// HttpStatus 페이지 상태를 전달.
		// 리턴에 코드는 길지만, 풀이하면
		// 정상 처리되면 정상 처리의 status 전달하고, 아니면 오류 status 전달.
	}
	
	@GetMapping(value="/pages/{bno}/{page}",
			produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page,	@PathVariable("bno") Long bno){ // @PathVariable : url로 넘겨받은 값 이용
		log.info("getList");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
		// T<List<ReplyVO>> t = new T<> ();
		// 댓글 목록을 출력하고, 정상 처리 상태를 리턴.
	}
	
	@GetMapping(value="/{rno}",	produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		log.info("get : " + rno);
		return new ResponseEntity<>(
				service.get(rno), HttpStatus.OK);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		// put, patch 둘다 수정 처리 가르킴.
		// 생성되는 정보의 형태는 json에 일반적인 문자열 이용.
		// @RequestBody : json으로 생성된 정보를 객체화.
		vo.setRno(rno);
		log.info("rno:  " + rno);
		log.info("modify:  " + vo);
		
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(
			@PathVariable("rno") Long rno){
		log.info("remove: " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
