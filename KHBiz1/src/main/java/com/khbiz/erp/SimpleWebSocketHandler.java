package com.khbiz.erp;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.*;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 

public class SimpleWebSocketHandler extends TextWebSocketHandler {
 
	// session set
	private static Set<WebSocketSession> clients = Collections.synchronizedSet(new HashSet<WebSocketSession>());
    // 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
    	
    	//chatpath 받기 
    	Map<String, Object> map = session.getAttributes();
  		String chatPath = (String) map.get("chatPath");
  		System.out.println("handler chatPath : "+chatPath);
    	
  		String payloadMessage = (String) message.getPayload();
        System.out.println("서버에 도착한 메시지:"+payloadMessage);
        
     String result[] = payloadMessage.split(":");
		// 채팅방 나가기일 경우
		if (result[0].equals("chatout")) {
			// 채팅방 나가기 파일에 쓰기 ,전송해주기
			PrintWriter pw2 = new PrintWriter(new FileWriter(chatPath+ result[2] + ".txt", true));
			String data = "&" + result[1] + ";";
			pw2.println(data);
			pw2.close();
			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				for (WebSocketSession client : clients) {
					if (!client.equals(session)) {
						client.sendMessage(new TextMessage("chatout" + ":" + result[1] + ":" + result[2]));
					}
				}
			}
		} else if (result[0].equals("moreInvite")) {
			// 채팅방 나가기 파일에 쓰기 ,전송해주기
			PrintWriter pw2 = new PrintWriter(new FileWriter(chatPath+ result[2] + ".txt", true));
			String data = "*" + result[1] + ";";
			pw2.println(data);
			pw2.close();

			// 초대하자마자 쓰는 거는 일단 보류
			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				for (WebSocketSession client : clients) {
					if (!client.equals(session)) {
						client.sendMessage(new TextMessage("moreInvite" + ":" + result[1] + ":" + result[2]));
					}
				}
			}
		}
		// 이미지 파일일 경우
		else if (result[0].equals("imgFile")) {
			// 이미지 파일 파일에 쓰기, 전송해주기
			PrintWriter pw2 = new PrintWriter(new FileWriter(chatPath+ result[4] + ".txt", true));
			String data = "i" + result[1] + ":" + result[2] + ":" + result[3] +":"+result[5]+ ";";
			pw2.println(data);
			pw2.close();

			// 초대하자마자 쓰는 거는 일단 보류
			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				for (WebSocketSession client : clients) {
					if (!client.equals(session)) {
						client.sendMessage(new TextMessage(
								"imgFile" + ":" + result[1] + ":" + result[2] + ":" + result[3] + ":" + result[4]+":"+result[5]));
					}
				}
			}
		}
		// 문서 파일일 경우
		else if (result[0].equals("docFile")) {
			// 문서 파일 파일에 쓰기, 전송해주기
			PrintWriter pw2 = new PrintWriter(new FileWriter(chatPath+ result[4] + ".txt", true));
			String data = "d" + result[1] + ":" + result[2] + ":" + result[3] +":"+result[5]+ ";";
			pw2.println(data);
			pw2.close();

			// 초대하자마자 쓰는 거는 일단 보류
			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				for (WebSocketSession client : clients) {
					if (!client.equals(session)) {
						client.sendMessage(new TextMessage(
								"docFile" + ":" + result[1] + ":" + result[2] + ":" + result[3] + ":" + result[4]+":"+result[5]));
					}
				}
			}
		} else {
			// 채팅방 이름으로 파일 생성 , 쓰기
			PrintWriter pw2 = new PrintWriter(new FileWriter(chatPath+ result[3] + ".txt", true));
			String data = result[0] + ":" + result[1] + ":" + result[2] + ";";
			pw2.println(data);
			pw2.close();
			synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				for (WebSocketSession client : clients) {
					if (!client.equals(session)) {
						client.sendMessage(new TextMessage(result[0] + ":" + result[1] + ":" + result[2] + ":" + result[3]));
					}
				}
			}
		}
      
    }
 
    // 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
         
        super.afterConnectionEstablished(session);
        System.out.println(session);
		clients.add(session);
		System.out.println("클라이언트 접속");
       
    }
 
    // 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        clients.remove(session);
        System.out.println("클라이언트 접속해제");
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생");
    }
}