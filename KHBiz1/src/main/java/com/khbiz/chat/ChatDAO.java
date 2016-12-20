package com.khbiz.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khbiz.member.MemberDTO;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ChatMapper.";

	// 채팅방 생성하기
	public int createchat(ChatDTO c, String[] codes) {
		int maxNum = 0;
		try {
			maxNum = sqlSession.selectOne(namespace + "getMaxnum");
		} catch (Exception e) {
			//테이블에 데이터가 존재하지 않을 경우 0로 초기화
			maxNum = 0;
		}
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("maxNum", maxNum + 1);
		for (int i = 0; i < codes.length; i++) {
			c.setCode(codes[i]);
			map.put("chat",c);
			//System.out.println("cnum");
			result = sqlSession.insert(namespace + "createchat", map);
		}
		return result;
	}
	
	//채팅방에 멤버 더 초대하기
	public int moreInvite(String cname, String[] codes){
		int result = 0;
		//이름으로 채팅방 기본 정보 조회해오기 
		List<ChatDTO> list = this.getInfo(cname);
		ChatDTO c = list.get(0);
		if(c.getCdetail()==null){
			c.setCdetail("");
		}
		//System.out.println("------------chatDAO-----------");
		//System.out.println("deatil : "+c.getCdetail());
		//System.out.println("cname : "+c.getCname());
		
		for(int i=0; i<codes.length; i++){
			c.setCode(codes[i]);
			result = sqlSession.insert(namespace+"moreInvite",c);
		}
		return result;
	}
	
	//채팅방 목록 가져오기
	public List<String> getCname(String code){
		System.out.println("chat dao code : "+code);
		return sqlSession.selectList(namespace+"getCname",code);
	}
	
	//채팅방 contents 경로 존재여부 
	public boolean getContents(String cname){
		boolean result = false;
		List<String> list = null;
		System.out.println("s1"+sqlSession);
		try{
			list = sqlSession.selectList(namespace+"getContents", cname);
		}catch(Exception e){
			list = null;
		}
		System.out.println(list.size());
		for(String s : list){
			System.out.println("list 값은 : "+s);
		}
		if(list.get(0)==null){
			result = false;
		}else{
			result = true;
		}
		return result;
	}
	
	//채팅방 contents 업데이트 
	public int updateContents(String cname,String contents){
		System.out.println("dao cname : "+cname);
		System.out.println("dao contents : "+contents);
		int result =0; 
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cname",cname);
		map.put("contents",contents);
		System.out.println("dao map : "+map);
		System.out.println(sqlSession);
		result = sqlSession.update(namespace+"updateContents", map);
		System.out.println("dao result : "+result);
		return result;
	}
	
	//getReg_date(마지막 등록 날짜)
	public String getReg_date(String cname){
		String result = null;
		List<String> list = null;
		try{
			list = sqlSession.selectList(namespace+"getReg_date", cname);
			System.out.println("dao 결과 list "+list.get(0));
			if(list.get(0)==null){
				result = null;
			}else{
				result = list.get(0);
			}
		}catch(Exception e){
			list = null;
		}
		return result;
	}
	
	//update reg_date
	public int updateReg_date(String cname,String date){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cname",cname);
		map.put("reg_date",date);
		System.out.println("reg_date update cname "+cname);
		System.out.println("updateReg_date reg_date "+date);
		int result = sqlSession.update(namespace+"updateReg_date", map);
		System.out.println("업데이트 결과는..? "+result);
		return result;
	}
	
	//채팅방에서 멤버 리스트 가져오기(code) 조회
	public List<String> getMembers(String cname){
		List<String> members = sqlSession.selectList(namespace+"getMembers",cname);
		return members;
	}
	
		//채팅방 contents 경로 존재여부 
		public String getContents2(String cname){
			String result = "";
			List<String> list = null;
			try{
				list = sqlSession.selectList(namespace+"getContents", cname);
			}catch(Exception e){
				list = null;
			}
			if(list.get(0)==null){
				result = null;
			}else{
				result = list.get(0);
			}
			return result;
		}
		
		//채팅방 리스트  가져오기(중복확인을 위해서) 
		public List<String> getCnames(String cname){
			return sqlSession.selectList(namespace+"getCnames",cname);
		}
		
		//채팅방 정보가져오기
		public List<ChatDTO> getInfo(String cname){
			return sqlSession.selectList(namespace+"getInfo",cname);
		}
		
		//채팅방 정보 수정하기
		public int updateInfo(HashMap<String,String> info){
			return sqlSession.update(namespace+"updateInfo", info);
		}
		
		//채팅방 나가기
		public int checkout(String cname,String code){
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("cname",cname);
			map.put("code",code);
			return sqlSession.delete(namespace+"chatout", map);
		}
		
		//참여 멤버 리스트 
		public List<MemberDTO> joinMemberList(String cname){
			return sqlSession.selectList(namespace+"joinMemberList", cname);
		}
		
		//채팅방 count update 하기 
		public int updateCount(String cname,String code){
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("cname",cname);
			map.put("code",code);
			//자기자신 뺴고 count 업데이트 해주기 
			return sqlSession.update(namespace+"updateCount", map);
		}
		
		//채팅방 count 받아오기
		public ArrayList<Integer> getCount(String code,String cname){
			ArrayList<Integer> counts = new  ArrayList<Integer>();
			
			System.out.println("****************여기보기*************");
			
			//1. 채팅방 목록 가져오기 
			List<String> cnames = this.getCname(code);
			String recname = "";
			for(String s: cnames){
				//2. 현재 받아온 cname과 cname이 같을 경우 
				if(s.equals(cname)){
					recname = s;
				}
			}
			
			System.out.println("rename : "+recname);
			//3. count를 0으로 초기화해주기(cname이 같은 것은 현재 보고 있는 페이지라는 의미) 
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("cname",recname);
			map.put("code",code);
			int result2 = sqlSession.update(namespace+"resetCount", map);
			System.out.println("count 0 초기화 결과"+result2);
			
			//4. 업데이트 후 countList 가져오기 
			for(String c : cnames){
				map.put("cname",c);//다시보기 
				int result = sqlSession.selectOne(namespace+"getCount",map);
				System.out.println("결과 : "+result+"입니다.");
				counts.add(result);
			}
			System.out.println("****************여기보기*************");
			
			return counts;
		}
}
