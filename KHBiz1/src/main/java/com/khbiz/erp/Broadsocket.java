package com.khbiz.erp;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.springframework.stereotype.Component;

import java.io.*;


@ServerEndpoint("/broadcasting")
@Component
public class Broadsocket {
	
	
	//session set
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		
			String result[] = message.split(":");
			//채팅방 나가기일 경우 
			if(result[0].equals("chatout")){
				//채팅방 나가기 파일에 쓰기 ,전송해주기 
				PrintWriter pw2 = new PrintWriter(new FileWriter("C:/Users/SG Lee/chat/"+result[2]+".txt", true));
				String data = "&"+result[1]+";";
				pw2.println(data);
				pw2.close();
				synchronized (clients) {
					// Iterate over the connected sessions
					// and broadcast the received message
					for (Session client : clients) {
						if (!client.equals(session)) {
							client.getBasicRemote().sendText("chatout"+":"+result[1]+":"+result[2]);
						}
					}
			  }
			}else if(result[0].equals("moreInvite")){
				//채팅방 나가기 파일에 쓰기 ,전송해주기 
				PrintWriter pw2 = new PrintWriter(new FileWriter("C:/Users/SG Lee/chat/"+result[2]+".txt", true));
				String data = "*"+result[1]+";";
				pw2.println(data);
				pw2.close();
				
				//초대하자마자 쓰는 거는 일단 보류 
				synchronized (clients) {
					// Iterate over the connected sessions
					// and broadcast the received message
					for (Session client : clients) {
						if (!client.equals(session)) {
							client.getBasicRemote().sendText("moreInvite"+":"+result[1]+":"+result[2]);
						}
					}
				}
			}
			//이미지 파일일 경우 
			else if(result[0].equals("imgFile")){
				//이미지 파일 파일에 쓰기, 전송해주기 
				PrintWriter pw2 = new PrintWriter(new FileWriter("C:/Users/SG Lee/chat/"+result[4]+".txt", true));
				String data = "i"+result[1]+":"+result[2]+":"+result[3]+";";
				pw2.println(data);
				pw2.close();
				
				//초대하자마자 쓰는 거는 일단 보류 
				synchronized (clients) {
					// Iterate over the connected sessions
					// and broadcast the received message
					for (Session client : clients) {
						if (!client.equals(session)) {
							client.getBasicRemote().sendText("imgFile"+":"+result[1]+":"+result[2]+":"+result[3]+":"+result[4]);
						}
					}
				}
			}
			//문서 파일일 경우 
			else if(result[0].equals("docFile")){
				//문서 파일 파일에 쓰기, 전송해주기 
				PrintWriter pw2 = new PrintWriter(new FileWriter("C:/Users/SG Lee/chat/"+result[4]+".txt", true));
				String data = "d"+result[1]+":"+result[2]+":"+result[3]+";";
				pw2.println(data);
				pw2.close();
				
				//초대하자마자 쓰는 거는 일단 보류 
				synchronized (clients) {
					// Iterate over the connected sessions
					// and broadcast the received message
					for (Session client : clients) {
						if (!client.equals(session)) {
							client.getBasicRemote().sendText("docFile"+":"+result[1]+":"+result[2]+":"+result[3]+":"+result[4]);
						}
					}
				}
			}
			else{
				//채팅방 이름으로 파일 생성 , 쓰기 
				PrintWriter pw2 = new PrintWriter(new FileWriter("C:/Users/SG Lee/chat/"+result[3]+".txt", true));
				String data = result[0]+":"+result[1]+":"+result[2]+";";
				pw2.println(data);
				pw2.close();
				synchronized (clients) {
					// Iterate over the connected sessions
					// and broadcast the received message
					for (Session client : clients) {
						if (!client.equals(session)) {
							client.getBasicRemote().sendText(result[0]+":"+result[1]+":"+result[2]+":"+result[3]);
						}
					}
			  }
			}
			
		
		
		
	}
	@OnOpen
	public void onOpen(Session session) {
		
		System.out.println(session);
		
		//System.out.println("해당 사용자의 이름은?"+m.getName());
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}

}