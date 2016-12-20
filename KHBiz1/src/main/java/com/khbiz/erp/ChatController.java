package com.khbiz.erp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.chat.ChatDAO;
import com.khbiz.chat.ChatDTO;
import com.khbiz.chat.ChatFileDTO;
import com.khbiz.chat.ChatFileService;
import com.khbiz.chat.ChatService;
import com.khbiz.member.MemberDTO;
import com.khbiz.member.MemberService;

@Controller
public class ChatController {

	@Autowired
	private ChatService cservice;

	@Autowired
	private MemberService mservice;

	@Autowired
	private ChatDAO cdao;
	
	@Autowired
	private ChatFileService cfservice;

	@RequestMapping(value = "/createchat")
	public String createchat(@RequestParam String group, @RequestParam String name,
			@RequestParam(value = "detail", required = false) String detail,@RequestParam(value="joinCheck",required = false) String joinCheck, HttpServletRequest request, Model model,
			RedirectAttributes rt, HttpSession session) {


		//System.out.println("joinCheck값은"+joinCheck+"입니다.");
		//채팅방 처음으로 대화상대 초대하는 경우 
		if(joinCheck.equals("no")){
			// 초대할 사람의 코드 배열
			String codes[] = request.getParameterValues("codes");
			// 초대할 사람의 이름 배열
			String names[] = request.getParameterValues("names");
			/*for (String s : names) {
			System.out.println("초대할 사람 이름 : " + s);
		}*/

			ChatDTO c = new ChatDTO();
			c.setGroups(group);
			c.setCname(name);
			c.setCdetail(detail);
			String savePath = session.getServletContext().getRealPath("/resources/chatDB/");
			c.setContents(savePath+ name + ".txt");

			String codes2[] = new String[codes.length + 1];
			for (int i = 0; i < codes.length; i++) {
				codes2[i] = codes[i];
			}

			// 본인까지 추가해서 넣어주기
			MemberDTO m = (MemberDTO) session.getAttribute("member");
			codes2[codes.length] = m.getCode();
			String path = cservice.createchat(c, codes2, names, model, rt);

			// chat로 갈 경우
			if (path.equals("/chatting/chat")) {
				//System.out.println("session code : " + m.getCode());
				// 회원 리스트 가져오기
				mservice.memberList(null, null, model, m.getCode());
				// 채팅방 리스트 가져오기
				cservice.getCname(m.getCode(), model);
				// 채팅방 정보 가져오기(필요한가..?)
				cservice.getInfo(name, model);

				//참여 멤버 리스트 가져오기 , 참여 멤버 count 가져오기 
				if(name != null){
					cservice.joinMemberList(name, model);
					//count 받아오기 
					cservice.getCount(m.getCode(),name, model);
				}
			
			}
			return path;
		}
		//채팅방에 추가 초대하는 경우 
		else{
			String codes[] = request.getParameterValues("codes");
			for(int i=0; i<codes.length; i++){
				//System.out.println("code는"+codes[i]+"입니다.");
			}
			String path = cservice.moreInvite(name, codes, model);
			gochat(session, model, name);

			return path;
		}


	}

	// reg_date update 하기
	@RequestMapping(value = "/updateReg_date")
	public String updateReg_date(@RequestParam String cname, Model model,HttpSession session) {
		cservice.updateReg_date(cname, model,session);
		return "chatting/result2";
	}

	// check reg_date
	@RequestMapping(value = "/checkReg_date")
	public String checkReg_date(@RequestParam String cname, Model model) {
		cservice.checkReg_date(cname, model);
		return "/chatting/result2";
	}

	// 파일에 초대되었습니다. text 써주기
	@RequestMapping(value = "/writeInvite")
	public String writeInvite(@RequestParam String cname, @RequestParam String names,HttpSession session) {
		PrintWriter pw2 = null;
		try {
			String savePath = session.getServletContext().getRealPath("/resources/chatDB/");
			pw2 = new PrintWriter(new FileWriter(savePath+ cname + ".txt", true));
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		String data = "#" + names + ";";
		pw2.println(data);
		pw2.close();
		return "/chatting/result2";
	}
	
	@RequestMapping(value = "/checkCname")
	public String checkCname(@RequestParam String cname, Model model) {
		cservice.getCnames(cname, model);
		return "/chatting/result2";
	}

	// 채팅방 정보 수정하기
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(@RequestParam String cname, @RequestParam String oldcname,
			@RequestParam(value = "cdetail", required = false) String cdetail, Model model, HttpSession session) {

		HashMap<String, String> info = new HashMap<String, String>();
		info.put("cname", cname);
		info.put("oldcname", oldcname);
		info.put("cdetail", cdetail);
		String savePath = session.getServletContext().getRealPath("/resources/chatDB/");
		info.put("contents", savePath+ cname + ".txt");
		cservice.updateInfo(info, model,savePath);
		gochat(session, model, cname);
		return "/chatting/chat";
	}

	// 채팅방 나가기
	@RequestMapping(value = "/chatout")
	public String chatout(@RequestParam String cname, @RequestParam String code, HttpSession session, Model model) {
		//System.out.println("controller");
		//System.out.println("cname : " + cname);
		//System.out.println("code : " + code);
		cservice.chatout(cname, code);
		gochat(session, model, null);
		return "/chatting/chat";
	}

	// 채팅방 chat 페이지를 가기위해 필요한 것
	public void gochat(HttpSession session, Model model,String cname) {
		// chat에 필요한 정보들
		MemberDTO m = (MemberDTO) session.getAttribute("member");
		//1. 회원 리스트 가져오기
		mservice.memberList(null, null, model, m.getCode());
		//2. 채팅방 리스트 가져오기
		cservice.getCname(m.getCode(), model);

		//3. 채팅명 하나 가져오기
		if (cname == null) {
			// cname이 null 일경우 default 값 초기화
			if (cdao.getCname(m.getCode()).size() > 0) {
				cname = cdao.getCname(m.getCode()).get(0);
				cservice.getInfo(cname, model);
			}else{
				cname = null;
			}
		} else {
			//4. 채팅방 정보 가져오기
			if (cdao.getCname(m.getCode()).size() > 0) {
				cservice.getInfo(cname, model);	
			}
		}
		//5. 채팅방 파일 내용 가져오기 
		ArrayList<String> list = null;
		if(cname !=null){
			// 파일 내용 읽기
			BufferedReader br = null;
			list = new ArrayList<String>();
			try {
				String path = cservice.getContents2(cname);
				br = new BufferedReader(new FileReader(path));
				while (true) {
					String line = br.readLine();
					if (line == null)
						break;
					//System.out.println(line);
					line = line.replace(";", "");
					list.add(line);
				}
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//파일 내용 넣어주기 
		model.addAttribute("list", list);
		model.addAttribute("cname", cname);

		//참여 멤버 리스트 가져오기 , 참여 멤버 count 가져오기 
		if(cname != null){
			cservice.joinMemberList(cname, model);
			//count 받아오기
			cservice.getCount(m.getCode(),cname, model);
		}
		
		
	}

	//참여 멤버 수 구하기 
	@RequestMapping(value="/memberCount")
	public String memberCount(@RequestParam String cname,Model model){
		List<MemberDTO> names = cdao.joinMemberList(cname);
		model.addAttribute("result",names.size());
		return "/chatting/result2";
	}
	//채팅방 count 업데이트 하기
	@RequestMapping(value="/updateCount")
	public String updateCount(@RequestParam String cname,@RequestParam String code){
		cservice.updateCount(cname,code);
		return "/chatting/result2";
	}

	//채팅방 count 받아오기
	@RequestMapping(value="/getCount")
	public String getCount(@RequestParam String code, @RequestParam String cname,Model model){
		cservice.getCount(code, cname, model);
		return "/chatting/result3";
	}

	//채팅방 file upload 
	@RequestMapping(value="/fileUpload")
	public String fileUpload(MultipartHttpServletRequest mr,Model model,HttpSession session){
		//파일에 저장 
		String savePath = session.getServletContext().getRealPath("/resources/upload");
		System.out.println("savePath : "+savePath);
		MultipartFile mf = mr.getFile("file1");

		UUID uid = UUID.randomUUID();
		String saveName = uid.toString()+"_"+mf.getOriginalFilename();
		File f = new File(savePath,saveName);
		try {
			mf.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("saveName : "+saveName);
		System.out.println("fileName : "+mf.getOriginalFilename());
		model.addAttribute("result",saveName+":"+mf.getOriginalFilename());
		
		String cname = mr.getParameter("cname");
		//db에 저장 
		MemberDTO m = (MemberDTO)session.getAttribute("member");
		String mName = m.getName();
		
		ChatFileDTO cf = new ChatFileDTO();
		cf.setOriginName(saveName);
		cf.setFileName(mf.getOriginalFilename());
		cf.setmName(mName);
		
		cfservice.fileUpload(cf, cname);
		
		return "/chatting/result2";

	}
	
}


