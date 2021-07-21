package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.CsVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.CsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cs/*")
@Log4j
@AllArgsConstructor
public class CsController {
	
	private CsService service;	
	HttpSession session;

	// 페이지 리스트 
	@GetMapping("/list")
	public void list(@ModelAttribute("criteria") Criteria cri, Model model, CsVO vo) {
		
		log.info("board/list method.....");
		int total = service.getTotal(cri);
		
		// service getList() 실행 결과를
		List<CsVO> list = service.getList(cri);
		// model에 attribute로 넣고
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));		
	}

	
	@GetMapping("/register")
	public String register(@ModelAttribute("criteria") Criteria cri) {
		// 세션에 로그인이 되어있지 않은 상태로 url에 우회로 접속시
		if (session.getAttribute("authUser") == null) {
			return "redirect:/cs/writer_error";
		}
		return "/cs/register";
	}
	
	// register 페이지를 세션에 로그인 되어 있지 않은 상태로 url로 접속시
		@GetMapping({"/writer_error"})
		public void writer_error() {
			
	}
		
	// 게시물 작성
	@PostMapping("/register")
	public String register(CsVO board, RedirectAttributes rttr, 
			MultipartFile[] upload, HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("authUser") == null) {
			return "redirect:/cs/writer_error";
		} else {		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		// 제목의 값이 없을때
		if (board.getCs_title().isEmpty() || board.getCs_title() == null) {
			errors.put("noTitle" , Boolean.TRUE);
		} 
		// 공개, 비공개 의 값이 없을때
		if (board.getCs_secret() == null) {
			errors.put("noSecret", Boolean.TRUE);
		} 
		// 분류의 값이 없을떄
		if (board.getCs_category().isEmpty() || board.getCs_category() == null) {
			errors.put("noCategory", Boolean.TRUE);
		} 
		// 내용의 값이 없을때 
		if (board.getCs_content().isEmpty() || board.getCs_content() == null) {
			errors.put("noContent", Boolean.TRUE);
		}
		// 제목의 값이 스페이스만 있을때
		if (board.getCs_title().trim().isEmpty()) {
			errors.put("noSpace_title", Boolean.TRUE);
		}
		// 내용의 값이 스페이스만 있을때
		if (board.getCs_content().trim().isEmpty()) {
			errors.put("noSpace_content", Boolean.TRUE);
		}
		
		
		if(!errors.isEmpty()) {
			rttr.addFlashAttribute("errors", errors);
			rttr.addFlashAttribute("category", board.getCs_category());
			rttr.addFlashAttribute("secret", board.getCs_secret());
			rttr.addFlashAttribute("title",board.getCs_title());
			rttr.addFlashAttribute("content", board.getCs_content());
			rttr.addFlashAttribute("filename", board.getCs_filename());
			
			return "redirect:/cs/register";
		}
		
		// 파일이 업로드 될 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/csboard/upload");
		// 위에서 설정한 경로의 폴더가 없을 경우 생성
		System.out.println(saveDir);
		File dir = new File(saveDir);

		if (!dir.exists()) {
			dir.mkdirs();
			} // 파일 업로드

		List<String> reNames = new ArrayList<String>();

		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int) (Math.random() * 1000);
				// 파일 이름 변경
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				// 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				reNames.add(reName);
					}
				}
				if (!reNames.isEmpty()) { // 파일이 비어있지않을때
					board.setCs_filename(reNames.get(0));
				} else { // 파일이 비어있을때
					board.setCs_filename("");
				}
				// list를 string 쉼표구분으로 만들기
				String filenames = String.join(",", reNames);
				board.setCs_filename(filenames);
				System.out.println(filenames);
			
		
		service.register(board);				
		rttr.addFlashAttribute("result", board.getCs_seq());
		return "redirect:/cs/list";
		}
	}
	
	// 게시물 가져오기
	@GetMapping({"/get"})
	public String get(@RequestParam("cs_seq") int cs_seq, MemberVO member,
			@ModelAttribute("criteria") Criteria cri, Model model,
			HttpSession session, RedirectAttributes rttr) {
		
		CsVO vo = service.get(cs_seq);
		// 게시물의 cs_secret값이 공개 일경우
		if("공개".equals(vo.getCs_secret())) {
			service.addCnt(cs_seq);
			model.addAttribute("board", vo);
			if (vo.getCs_filename() != null && !vo.getCs_filename().isEmpty()) {
				@SuppressWarnings("unchecked")
				List<String> fileNamesList = Arrays.asList(vo.getCs_filename().split(","));
				model.addAttribute("getCsfileNameList", fileNamesList);
				
				return "/cs/get";
			}
		} else { // 게시물의 cs_secret값이 비공개일 경우
			if(session.getAttribute("authUser") == null) { // 세션에 authUser의 값이 없을경우
				System.out.println("세션 없음");				
				return "redirect:/cs/read_error";
			} else { // 세션에 authUser의 값이 있을경우
				MemberVO memberVO = (MemberVO) session.getAttribute("authUser");		
				String memberNickname = memberVO.getMember_nickName();				
				int memberGrade = memberVO.getMember_grade();				
				System.out.println("세션 곧 로그인은 되어있음");
				// 세션의 값이 있는 상태에서 글 작성자와 세션에 로그인된 닉네임이 동일한 경우 혹은 관리자인경우(user_grade == 0) 
				if(memberNickname.equals(vo.getCs_writer()) || memberGrade == 0) {	 									
					//	작성자와 세션에서 가져온 userNickname이 같은 경우
					//	get 페이지로 이동
					service.addCnt(cs_seq);
					model.addAttribute("board", vo);
					if (vo.getCs_filename() != null && !vo.getCs_filename().isEmpty()) {
						@SuppressWarnings("unchecked")
						List<String> fileNamesList = Arrays.asList(vo.getCs_filename().split(","));
						model.addAttribute("getCsfileNameList", fileNamesList);
					} 
					return "/cs/get";

				} else { // 로그인은 되어있지만 일반 유저인경우 (자신의 글이 아닌경우 포함)
					return "redirect:/cs/read_error";
				}
			}
		}
			return null;
	}
	
	// get 페이지에서 세션에 없거나 자신의 글이 아닌경우 보내지는 페이지
	@GetMapping({"/read_error"})
	public void read_error() {
		
	}
		
	
	// 게시물 삭제 후 리스트페이지로 이동
	@RequestMapping("/remove")
	public String remove(@RequestParam("cs_seq") int cs_seq) {
		service.remove(cs_seq);		
		return "redirect:/cs/list";
	}
	
	// 게시물 수정시 값을 가져옴
	@GetMapping({"/modify"})
	public void get(@RequestParam("cs_seq") int cs_seq,
			@ModelAttribute("criteria") Criteria cri, Model model) {
				
		CsVO vo = service.get(cs_seq);		
		model.addAttribute("board", vo);
		
		String preFileNames = vo.getCs_filename();
		if (vo.getCs_filename() != null && !vo.getCs_filename().isEmpty()) {
			@SuppressWarnings("unchecked")
			List<String> fileNamesList = Arrays.asList(vo.getCs_filename().split(","));
			model.addAttribute("preFileNames", preFileNames);
			model.addAttribute("csfileNameList", fileNamesList);
		}
	}
	
	// 게시물 수정 포스트 폼
	@PostMapping("/modify")
	public String modify(CsVO board, Criteria cri, RedirectAttributes rttr, 
			MultipartFile[] upload, HttpServletRequest request) {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		
		if (board.getCs_title().isEmpty() || board.getCs_title() == null) {
			errors.put("noTitle" , Boolean.TRUE);
		} 
		if (board.getCs_secret() == null) {
			errors.put("noSecret", Boolean.TRUE);
		} 
		if (board.getCs_category().isEmpty() || board.getCs_category() == null) {
			errors.put("noCategory", Boolean.TRUE);
		} 
		if (board.getCs_content().isEmpty() || board.getCs_content() == null) {
			errors.put("noContent", Boolean.TRUE);
		}
		// 제목의 값이 스페이스만 있을때
		if (board.getCs_title().trim().isEmpty()) {
			errors.put("noSpace_title", Boolean.TRUE);
		}
		// 내용의 값이 스페이스만 있을때
		if (board.getCs_content().trim().isEmpty()) {
			errors.put("noSpace_content", Boolean.TRUE);
		}
		
		// 파일이 업로드 될 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/csboard/upload");
		// 위에서 설정한 경로의 폴더가 없을 경우 생성
		System.out.println(saveDir);
		File dir = new File(saveDir);

		if (!dir.exists()) {
			dir.mkdirs();
		} // 파일 업로드

		List<String> reNames = new ArrayList<String>();
		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int) (Math.random() * 1000);
				// 파일 이름 변경
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				// 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}

				reNames.add(reName);
			}
		}
		if (!reNames.isEmpty()) {
			board.setCs_filename(reNames.get(0));
		} else {
			board.setCs_filename("");
		}

		if (!errors.isEmpty()) {
			rttr.addFlashAttribute("errors", errors);
			rttr.addFlashAttribute("board", board);
			rttr.addFlashAttribute("secret", board.getCs_secret());
			rttr.addFlashAttribute("title",board.getCs_title());
			rttr.addFlashAttribute("content", board.getCs_content());
			rttr.addFlashAttribute("filename", board.getCs_filename());

			return "redirect:/cs/modify?cs_seq=" + board.getCs_seq();
		}

		// list를 string 쉼표구분으로 만들기
		String filenames = String.join(",", reNames);
		board.setCs_filename(filenames);
		System.out.println(filenames);

		if (reNames.size() == 0) { //
			board.setCs_filename(request.getParameter("preFileNames"));
		} else {
			/* 변동있다면 이전그림지우기 */
			String oldFileNames = request.getParameter("preFileNames");
			@SuppressWarnings("unchecked")
			List<String> fileNamesList = Arrays.asList(oldFileNames.split(","));
			System.out.println(fileNamesList);

			String saveDir2 = request.getSession().getServletContext().getRealPath("/resources/csboard/upload");

			/* 그림파일삭제 */
			for (String f : fileNamesList) {
				if (!f.isEmpty()) {
					File file = new File(saveDir2 + "/" + f);
					file.delete();
				}
			}

		}
		rttr.addAttribute("pageNum", cri.getPageNum()); // request가 아니라 redirect해줬기때문에
		rttr.addAttribute("amount", cri.getAmount());	// RedirectAttributes에 넣어줘야함
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
				
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", board.getCs_seq() + "번 글이 수정 됐습니다.");
		}

		return "redirect:/cs/list";
	}

}
