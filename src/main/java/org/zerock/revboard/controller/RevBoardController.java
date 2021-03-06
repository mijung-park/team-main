package org.zerock.revboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.revboard.domain.Criteria;
import org.zerock.revboard.domain.GoodCheck;
import org.zerock.revboard.domain.HateCheck;
import org.zerock.revboard.domain.PageDTO;
import org.zerock.revboard.domain.RevVO;
import org.zerock.revboard.service.RevBoardService;
import org.zerock.user.domain.UserVO;
import org.zerock.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rev/*")
@AllArgsConstructor
@Log4j
public class RevBoardController {

	private RevBoardService service;
	private UserService UserSvc;
	
	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(RevVO revVo, Model model, RedirectAttributes rttr, MultipartFile[] upload,
			HttpServletRequest request, HttpSession session) {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		if (revVo.getRev_title().isEmpty() || revVo.getRev_title() == null) {
			errors.put("noTitle", Boolean.TRUE);
		}
		if (revVo.getRev_category().isEmpty() || revVo.getRev_category() == null) {
			errors.put("noCategory", Boolean.TRUE);
		}
		if (revVo.getRev_content().isEmpty() || revVo.getRev_content() == null) {
			errors.put("noContent", Boolean.TRUE);
		}
		if (revVo.getRev_writer().isEmpty() || revVo.getRev_writer() == null) {
			errors.put("noWriter", Boolean.TRUE);
		}

		// ????????? ????????? ??? ?????? ??????
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload");
		// ????????? ????????? ????????? ????????? ?????? ?????? ??????
		System.out.println(saveDir);
		File dir = new File(saveDir);

		if (!dir.exists()) {
			dir.mkdirs();
		} // ?????? ?????????

		List<String> reNames = new ArrayList<String>();

		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {
				// ?????? ?????? ????????? ?????? ????????? ??????
				String orifileName = f.getOriginalFilename();
//				String ext = orifileName.substring(orifileName.lastIndexOf("."));
//				// ?????? ??? ????????? ?????? ??????
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
//				int rand = (int) (Math.random() * 1000);
//				// ?????? ?????? ??????
//				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
//				// ?????? ??????
				try {
					f.transferTo(new File(saveDir + "/" + orifileName));
				} catch (IOException e) {
					e.printStackTrace();
				}

				reNames.add(orifileName);
			}
		}
		if (!reNames.isEmpty()) { // ????????? ?????????????????????
			revVo.setRev_filename(reNames.get(0));
		} else { // ????????? ???????????????
			revVo.setRev_filename("");
		}
		// list??? string ?????????????????? ?????????
		String filenames = String.join(",", reNames);
		revVo.setRev_filename(filenames);
		System.out.println(filenames);
		
		if (!errors.isEmpty()) {
			rttr.addFlashAttribute("errors", errors);
			rttr.addFlashAttribute("category", revVo.getRev_category());
			rttr.addFlashAttribute("title", revVo.getRev_title());
			rttr.addFlashAttribute("content", revVo.getRev_content());
			rttr.addFlashAttribute("writer", revVo.getRev_writer());

			return "redirect:/rev/register";
		}
		
		UserVO user = (UserVO) session.getAttribute("authUser");
		UserVO vo = UserSvc.getUser(user.getUser_id());
		int eventcnt = vo.getEventCheck();
		
		revVo.setRev_writer(user.getUser_nickname());

		service.register(revVo);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addFlashAttribute("message", revVo.getRev_writer() + "??? " + revVo.getRev_seq() + "??? ?????? ?????????????????????.");
		
		int cnt = service.boardSelect(revVo.getRev_writer());
		session.setAttribute("authUser", vo);
		if (cnt == 5 && eventcnt == 0) {
			service.pointUpdate(user.getUser_id());
			UserVO vo1 = UserSvc.getUser(user.getUser_id());
			session.setAttribute("authUser", vo1);
			rttr.addFlashAttribute("result", revVo.getRev_writer()); // ????????? ?????????.
			rttr.addFlashAttribute("message", revVo.getRev_writer() + "??? ????????? 500000?????? ??????????????????.");
			return "redirect:/rev/list";
		} 
			System.out.println("141:" + eventcnt);
		if (cnt == 5 && eventcnt == 1) {
			  	rttr.addFlashAttribute("result", revVo.getRev_writer()); // ????????? ?????????.
			  	rttr.addFlashAttribute("message", revVo.getRev_writer() + "?????? ?????? ????????? ???????????? ?????????????????????.");
			  }
		return "redirect:/rev/list";
	}

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request) {
		List<RevVO> list = service.getListWithPaging(cri);

		int total = service.getTotal(cri);

		PageDTO dto = new PageDTO(cri, total);

		UserVO user = (UserVO) request.getSession().getAttribute("authUser");

		model.addAttribute("authUser", user);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}

	@GetMapping({ "/get" })
	public ModelAndView get(@RequestParam int rev_seq, @ModelAttribute("cri") Criteria cri, Model model,
			HttpServletRequest req, HttpServletResponse res) {
		UserVO user = (UserVO) req.getSession().getAttribute("authUser");

		// ?????? ????????? ????????? ?????? ?????? ?????????????????? ?????????
		RevVO rev = service.get(rev_seq);

		// ?????? ????????????????????? list??? ???????????? ?????????
		if (rev.getRev_filename() != null && !rev.getRev_filename().isEmpty()) {
			List<String> fileNamesList = Arrays.asList(rev.getRev_filename().split(","));
			model.addAttribute("RevfileNameList", fileNamesList);
		}
		ModelAndView view = new ModelAndView();

		Cookie[] cookies = req.getCookies();
		
		// ???????????? ?????? ????????? ??????
		Cookie viewCookie = null;
		

		// ????????? ?????? ??????
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie??? name??? cookie + rev_seq??? ???????????? ????????? viewCookie??? ?????????
				if (user != null) {
					if (cookies[i].getName().equals("cookie" + user.getUser_id())) {
						System.out.println("?????? ????????? ????????? ??? ?????????.");
						viewCookie = cookies[i];
						viewCookie.setMaxAge(5*1*1);
					}
				} else {
					if (cookies[i].getName().equals("cookie" + rev_seq)) {
						System.out.println("?????? ????????? ????????? ??? ?????????.");
						viewCookie = cookies[i];
						viewCookie.setMaxAge(5*1*1);
					}
				}
			}
		}
		if (rev != null) {
			System.out.println("System - ?????? ?????? ?????????????????? ?????????");

			view.addObject("review", rev);

			// ?????? viewCookie??? null??? ?????? ????????? ???????????? ????????? ?????? ????????? ?????????
			if (viewCookie == null) {
				System.out.println("cookie ??????");

				// ?????? ??????(??????, ???)
				if (user != null) {
					Cookie newCookie = new Cookie("cookie" + user.getUser_id(), "|" + user.getUser_id() + "|");
					newCookie.setMaxAge(5*1*1);
					res.addCookie(newCookie);
				} else {
					Cookie newCookie = new Cookie("cookie" + rev_seq, "|" + rev_seq + "|");
					newCookie.setMaxAge(5*1*1);
					res.addCookie(newCookie);
				}

				// ?????? ??????

				// ????????? ?????? ????????? ????????? ????????????
				int result = service.addReadCnt(rev_seq);
				
				
				
				if (result > 0) {
					System.out.println("????????? ??????");
				} else {
					System.out.println("????????? ?????? ??????");
				}
			} // viewCokkie??? null??? ???????????? ????????? ???????????? ????????? ?????? ????????? ???????????? ??????.
			else {
				System.out.println("cookie ??????");

				// ?????? ??? ?????????
				viewCookie.setMaxAge(5*1*1);
				String value = viewCookie.getValue();
				
				System.out.println("cookie ??? : " + value);
			}
			model.addAttribute("RevBoard", rev);
			view.setViewName("/rev/get");
			return view;
		} else {
			// ??????????????? ??????
			view.setViewName("error/reviewError");
			return view;
		}

		/*
		 * RevVO vo = service.get(rev.getRev_seq());
		 * 
		 * if (rev.getRev_title() != null && !rev.getRev_title().isEmpty()) {
		 * service.addReadCnt(rev.getRev_seq()); }
		 * 
		 * 
		 * ;
		 */
		
	}

	@GetMapping("/modify")
	public void modify(@RequestParam int rev_seq, @ModelAttribute("cri") Criteria cri, Model model) {

		RevVO rev = service.get(rev_seq);

		model.addAttribute("RevBoard", rev);

		String preFileNames = rev.getRev_filename();
		if (rev.getRev_filename() != null && !rev.getRev_filename().isEmpty()) {
			List<String> fileNamesList = Arrays.asList(rev.getRev_filename().split(","));
			model.addAttribute("preFileNames", preFileNames);
			model.addAttribute("fileNamesList", fileNamesList);
		}
	}

	@PostMapping("/modify")
	public String modify(RevVO revVo, Criteria cri, RedirectAttributes rttr, MultipartFile[] upload,
			HttpServletRequest request) {
		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		if (revVo.getRev_title().isEmpty() || revVo.getRev_title() == null) {
			errors.put("noTitle", Boolean.TRUE);
		}
		if (revVo.getRev_category().isEmpty() || revVo.getRev_category() == null) {
			errors.put("noCategory", Boolean.TRUE);
		}
		if (revVo.getRev_content().isEmpty() || revVo.getRev_content() == null) {
			errors.put("noContent", Boolean.TRUE);
		}

		// ????????? ????????? ??? ?????? ??????
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload");
		// ????????? ????????? ????????? ????????? ?????? ?????? ??????
		System.out.println(saveDir);
		File dir = new File(saveDir);

		if (!dir.exists()) {
			dir.mkdirs();
		} // ?????? ?????????

		List<String> reNames = new ArrayList<String>();
		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {
				// ?????? ?????? ????????? ?????? ????????? ??????
				String orifileName = f.getOriginalFilename();
//				String ext = orifileName.substring(orifileName.lastIndexOf("."));
//				// ?????? ??? ????????? ?????? ??????
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
//				int rand = (int) (Math.random() * 1000);
//				// ?????? ?????? ??????
//				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
//				// ?????? ??????
				try {
					f.transferTo(new File(saveDir + "/" + orifileName));
				} catch (IOException e) {
					e.printStackTrace();
				}

				reNames.add(orifileName);
			}
		}
		if (!reNames.isEmpty()) {
			revVo.setRev_filename(reNames.get(0));
		} else {
			revVo.setRev_filename("");
		}

		if (!errors.isEmpty()) {
			rttr.addFlashAttribute("errors", errors);
			rttr.addFlashAttribute("RevBoard", revVo);

			return "redirect:/rev/modify?rev_seq=" + revVo.getRev_seq();
		}

		// list??? string ?????????????????? ?????????
		String filenames = String.join(",", reNames);
		revVo.setRev_filename(filenames);
		System.out.println(filenames);

		if (reNames.size() == 0) { //
			revVo.setRev_filename(request.getParameter("preFileNames"));
		} else {
			/* ??????????????? ????????????????????? */
			String oldFileNames = request.getParameter("preFileNames");
			List<String> fileNamesList = Arrays.asList(oldFileNames.split(","));
			System.out.println(fileNamesList);

			String saveDir2 = request.getSession().getServletContext().getRealPath("/resources/upload");

			/* ?????????????????? */
			for (String f : fileNamesList) {
				if (!f.isEmpty()) {
					File file = new File(saveDir2 + "/" + f);
					file.delete();
				}
			}

		}
		
		rttr.addAttribute("pageNum", cri.getPageNum()); // request??? ????????? redirect??????????????????
		rttr.addAttribute("amount", cri.getAmount());	// RedirectAttributes??? ???????????????
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		if (service.moidfy(revVo)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", revVo.getRev_seq() + "??? ?????? ?????? ????????????.");
		}

		return "redirect:/rev/list";

	}

	@PostMapping("/remove")
	public String remove(@RequestParam("rev_seq") int rev_seq, Criteria cri, RedirectAttributes rttr) {
		service.goodCheckremove(rev_seq);
		service.hateCheckremove(rev_seq);
		if (service.remove(rev_seq)) {
			
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", rev_seq + "??? ?????? ?????????????????????.");
		}

		return "redirect:/rev/list";
	}
//	@GetMapping(value = "/get/like",
//				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public String addGood(int rev_seq) {
//		log.info("rev_seq");
//		service.addGood(rev_seq);
//		
//		/* return new ResponseEntity<RevVO>(HttpStatus.OK); */
//		return "redirect:/rev/get?rev_seq=" + rev_seq;
//		
//	}

	@GetMapping("/like")
	public @ResponseBody int goodAdd(GoodCheck check, HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes rttr) {
		int cnt = 1;
		System.out.println(check.getRev_seq());
		System.out.println(check.getUser_seq());
		cnt = service.checkread(check.getUser_seq(), check.getRev_seq());
		System.out.println(cnt);
		if (cnt == 0) {
			service.insertCheck(check); // ???????????? ????????????.
			service.addGood(check.getRev_seq()); // ???????????? 1?????????
			service.goodCheck(check.getUser_seq(), check.getRev_seq()); // ???????????? ????????? ?????? + 1 ( ???????????? ?????? 0 )
			System.out.println("395:" + cnt);
			return cnt;
		}
		if (cnt == 1){
			service.goodCheck_cancel(check.getUser_seq(), check.getRev_seq());
			service.goodCancel(check.getRev_seq());
			return cnt;
		}
		return cnt;
	}

	

	@GetMapping("/hate")
	public @ResponseBody int addHate(HateCheck hateCheck) {
		int cnt = 1;
		System.out.println(hateCheck.getRev_seq());
		System.out.println(hateCheck.getUser_seq());
		cnt = service.hatecheckread(hateCheck.getUser_seq(), hateCheck.getRev_seq());
		System.out.println("414:" + cnt);
		if (cnt == 0) {
			System.out.println("415:" + cnt);
			service.hateinsertCheck(hateCheck);
			service.addHate(hateCheck.getRev_seq());
			service.hateCheck(hateCheck.getUser_seq(), hateCheck.getRev_seq());
			return cnt;
		}
		
		if (cnt == 1) {
			service.hateCheck_cancel(hateCheck.getUser_seq(), hateCheck.getRev_seq());
			service.hateCancel(hateCheck.getRev_seq());
			return cnt;
		}
		return cnt;
	}

}