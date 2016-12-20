package com.khbiz.chat;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.member.MemberDTO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO cdao;

	// 채팅방 생성하기
	public String createchat(ChatDTO c, String[] codes, String[] names, Model model, RedirectAttributes rt) {
		//System.out.println("service names");
		/*for (String s : names) {
			System.out.println(s);
		}*/

		int result = cdao.createchat(c, codes);

		String path = null;
		// 채팅방 생성에 성공 - 채팅방으로 이동
		String resultName = names[0];
		for (int i = 1; i < names.length; i++) {
			resultName = resultName + ", " + names[i];
		}

		if (result > 0) {
			model.addAttribute("resultName", resultName);
			model.addAttribute("cname", c.getCname());
			path = "/chatting/chat";
		}
		// 채팅방 생성에 실패 - 전 페이지로 이동 (chat)
		else {
			// redirect에 실패 메시지 넣기
			rt.addFlashAttribute("message", "채팅방 생성에 실패하였습니다.");
			path = "redirect:/chatting/chat";
		}
		return path;
	}

	//회원 채팅방에 더 초대하기
	public String moreInvite(String cname, String[] codes,Model model){
		//이름으로 채팅방 기본 정보 조회해오기 
		
		int result = cdao.moreInvite(cname, codes);
		if(result>0){
			//model.addAttribute("moreInviteResult",result);
			model.addAttribute("cname",cname);
		}
		
		return "/chatting/chat";
	}
	
	// 회원의 채팅방 리스트 가져오기
	public void getCname(String code, Model model) {
		//System.out.println("chat service code : " + code);
		List<String> cList = cdao.getCname(code);
		model.addAttribute("cList", cList);
		model.addAttribute("csize", cList.size());
	}

	public void updateReg_date(String cname, Model model,HttpSession session) {
		//System.out.println("cname : " + cname);
		String result = cdao.getReg_date(cname);
		//System.out.println("reg_date 존재여부 " + result);
		String result2 = "";
		String todate = "";
		Calendar oCalendar = Calendar.getInstance(); // 현재 날짜/시간 등의 각종 정보 얻기
		todate = oCalendar.get(Calendar.YEAR) + "년 " + (oCalendar.get(Calendar.MONTH) + 1) + "월 "
				+ oCalendar.get(Calendar.DAY_OF_MONTH) + "일";

		int day = oCalendar.get(Calendar.DAY_OF_WEEK);
		String dayName = "";
		switch (day) {
		case 1:
			dayName = " 일요일";
			break;
		case 2:
			dayName = " 월요일";
			break;
		case 3:
			dayName = " 화요일";
			break;
		case 4:
			dayName = " 수요일";
			break;
		case 5:
			dayName = " 목요일";
			break;
		case 6:
			dayName = " 금요일";
			break;
		case 7:
			dayName = " 토요일";
			break;
		}
		todate = todate + dayName;
		if (result == null) {
			// reg_date 존재하지 않을 경우 - 오늘날짜로 업데이트

			//System.out.println("todate : " + todate);
			result2 = cdao.updateReg_date(cname, todate) + ":" + todate;
			PrintWriter pw2 = null;
			try {
				String savePath = session.getServletContext().getRealPath("/resources/chatDB/");
				pw2 = new PrintWriter(new FileWriter(savePath+ cname + ".txt", true));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String data = "@" + todate + ";";
			pw2.println(data);
			pw2.close();

		} else {
			// reg_date 존재할 경우 - 오늘날짜와 db에 저장되어있는 값 비교 (다를경우 db 업데이트), 다를 경우에만 파일에 써주기
			if (!todate.equals(result)) {
				result2 = cdao.updateReg_date(cname, todate) + ":" + todate;

				PrintWriter pw2 = null;
				try {
					String savePath = session.getServletContext().getRealPath("/resources/chatDB/");
					pw2 = new PrintWriter(new FileWriter(savePath+ cname + ".txt", true));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String data = "@" + todate + ";";
				pw2.println(data);
				pw2.close();
			}
		}
		if(result==null){
			result ="no";
		}else{
			result = "yes";
		}
		//System.out.println("보내기전 result"+result+"입니다.");
		result2 = result2+":"+result;
		model.addAttribute("result", result2);
	}

	public void checkReg_date(String cname, Model model) {
		String result = cdao.getReg_date(cname);
		//System.out.println("check reg_Date는? " + result);
		model.addAttribute("result", result);
	}
	

	// 채팅방 회원 리스트 조회 (code를 조회해옴)
	public List<String> getMembers(String cname) {
		return cdao.getMembers(cname);
	}
	
	//채팅방 파일 경로 조회
	public String getContents2(String cname){
		return cdao.getContents2(cname);
	}
	
	public void getCnames(String cname,Model model){
		List<String> list = cdao.getCnames(cname);
		//System.out.println("cname : "+cname);
		//System.out.println("chat Service list 결과 ? "+list.size()+"입니다.");
		/*if(list != null ){
			for(String s : list){
				System.out.println("결과 list : "+s);
			}
		}*/
		int result = 0;
		//중복안됨 
		if(list.size()==0){
			result = 1;
		}
		//중복됨 
		else{
			result = 0;
		}
		model.addAttribute("result",result);
	}
	
	//채팅방 정보가져오기
	public void getInfo(String cname,Model model){
		List<ChatDTO> list = cdao.getInfo(cname);
		model.addAttribute("cdto",list.get(0));
	}
	
	//채팅방 정보 수정하기 
	public void updateInfo(HashMap<String,String> info,Model model,String savePath){
		int result = cdao.updateInfo(info);
		//채팅방 수정 결과가 성공이면 파일의 이름 변경해주기 
		String message = "";
		if(result>0){
			
			File f = new File(savePath+ info.get("oldcname")+".txt");
	        File t = new File(savePath+ info.get("cname")+".txt");
	        if(f.exists()){
	            f.renameTo(t);
	        }else{
	            System.out.println(f.getName() + " 파일이 존재하지 않습니다.");
	        }
	        message = "정보변경에 성공하였습니다.";
		}else{
			message = "정보변경에 실패하였습니다.";
		}
		model.addAttribute("message",message);
	}
	
	//채팅방 나가기 
	public void chatout(String cname,String code){
		int result = cdao.checkout(cname, code);
		//System.out.println("채팅방 나가기 결과 "+result);
	}
	
	//참여 멤버 리스트
	public void joinMemberList(String cname, Model model){
		List<MemberDTO> names = cdao.joinMemberList(cname);
		//참여 멤버 리스트 
		
		List<String> codeList = new ArrayList<String>();
		
		//System.out.println("참여 멤버 리스트");
		for(MemberDTO m : names){
			//System.out.println("이름: "+m.getName());
			//System.out.println("code: "+m.getCode());
			
			codeList.add(m.getCode());
			
		}
		//참여 멤버 리스트 name, code 배열 넣어주기 
		
		model.addAttribute("joinMember",names);
		model.addAttribute("joinMemberCode",codeList);
		//참여 멤버리스트 count
		model.addAttribute("joinMemberCount",names.size());
	}
	
	//채팅방 count 받아오기
	public void getCount(String code,String cname,Model model){
		//받아온 cname으로 cname과 이름이 같으면 0으로 초기화 
		model.addAttribute("counts",cdao.getCount(code,cname));
	}
	
	//채팅방 count 업데이트 하기 
	public void updateCount(String cname,String code){
		int result = cdao.updateCount(cname,code);
		System.out.println("채팅방 count 업데이트 결과"+result+"입니다.");
	}
	
	
	
}
