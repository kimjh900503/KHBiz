package com.khbiz.erp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbiz.chat.ChatDAO;

import com.khbiz.chat.ChatService;
import com.khbiz.member.MemberDTO;
import com.khbiz.member.MemberService;

@Controller
public class BroadCastController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ChatService cservice;

	@Autowired
	private ChatDAO cdao;


	// chat 시작페이지 (memberList가져오기)
	@RequestMapping(value = "/chat")
	public String chat(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "str", required = false) String str, @RequestParam(value = "cname", required = false) String cname,Model model, HttpSession session) {
		
		
		String returnpath = "";
		MemberDTO m = (MemberDTO) session.getAttribute("member");
		
		if(m!=null){
			// 1. 회원 리스트 가져오기
			memberService.memberList(type, str, model, m.getCode());
			// 2. 채팅방 리스트 가져오기
			cservice.getCname(m.getCode(), model);

			// 3. 채팅명 하나 가져오기 
			if(cname==null){
				//cname이 null 일경우 default 값 초기화 0
				if(cdao.getCname(m.getCode()).size()>0){
					cname = cdao.getCname(m.getCode()).get(0);
					cservice.getInfo(cname, model);
				}
			}else{
				//4. 채팅방 정보 가져오기 
				if (cdao.getCname(m.getCode()).size() > 0) {
					cservice.getInfo(cname, model);	
				}
			}
			
			//5. 파일 내용 가져오기 
			ArrayList<String> list = null;
			if(cname != null){
			
			BufferedReader br = null;
			list = new ArrayList<String>();
			try {
				String path = cservice.getContents2(cname);
				br = new BufferedReader(new FileReader(path));
				while (true) {
					String line = br.readLine();
					if (line == null)
						break;
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
			returnpath="chatting/chat";
		}else{
			returnpath="redirect:/erp";
		}
		
		return returnpath;
	}

	// ajax로 memberList 가져오기
	@RequestMapping(value = "/memberList")
	public String memberList(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "str", required = false) String str, Model model,
			@RequestParam(value = "codes", required = false) List<String> codes, HttpSession session) {
		
		/*System.out.println("/memberList 결과");
		for(String s : codes){
			System.out.println("code는"+s+"입니다.");
		}*/
		
		MemberDTO m = (MemberDTO) session.getAttribute("member");
		System.out.println("session code : " + m.getCode());
		memberService.memberList2(type, str, model, codes, m.getCode());
		
		return "chatting/result";
	}
}
