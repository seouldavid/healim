package com.ict.healim.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.healim.service.SocialLoginMemberService;
import com.ict.healim.vo.KakaoUserResponse;
import com.ict.healim.vo.KakaoVO;
import com.ict.healim.vo.NaverUserResponse;
import com.ict.healim.vo.NaverVO;

@Controller
public class SnSLoginController {

	@Autowired
	private SocialLoginMemberService socialLoginMemberService;
	
   @GetMapping("/sns_login")
   public ModelAndView getSpringSnsGo() {
      return new ModelAndView("sns/loginForm");
   }
   
   @RequestMapping("/kakaologin")
   public ModelAndView kakaoLogin(HttpServletRequest request) {
      String code = request.getParameter("code");
      System.out.println("code : " + code);
      
      String reqURL = "https://kauth.kakao.com/oauth/token";
       try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            
            BufferedWriter bw =  new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuffer sb = new StringBuffer();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=c511457645936818e2db5ecdc890dc9d");
            sb.append("&redirect_uri=http://localhost:8080/kakaologin");
            sb.append("&code="+code);
            sb.append("&client_secret=UK5yf3VgXmUWsbSzwaTLRFVMJNXg6ggL");
            bw.write(sb.toString());
            bw.flush();
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : "+ responseCode);
            
            if (responseCode == HttpURLConnection.HTTP_OK) {
            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            	String line = "";
            	StringBuffer sb2 = new StringBuffer();
            	while((line= br.readLine()) != null) {
            		sb2.append(line);
            	}
            	String result = sb2.toString();
            	System.out.println(result);
            	Gson gson = new Gson();
            	KakaoVO kavo = gson.fromJson(result, KakaoVO.class);
            	
            	
//            	request.getSession().setAttribute("kavo", kavo);          	
            	request.getSession().setAttribute("platform", "kakao");   
            	
            	// whether user has healim account
            	String access_token = kavo.getAccess_token();

        		String apiURL = "https://kapi.kakao.com/v2/user/me";
        		String header = "Bearer " + access_token;
        		Map<String, String> headers = new HashMap<String, String>();
        		headers.put("Authorization", header);
            	
        		HttpURLConnection conn2 = null;
        		BufferedReader br2 = null;
        		InputStreamReader isr = null;
        		try {
        			URL url2 = new URL(apiURL);
        			conn2 = (HttpURLConnection) url2.openConnection();
        			conn2.setRequestMethod("POST");
        			conn2.setDoOutput(true);
        			
        			for (Entry<String,String> k : headers.entrySet()) {
        				conn2.setRequestProperty(k.getKey(), k.getValue());
        			}
        			
        			int responseCode2 = conn2.getResponseCode();
                    System.out.println("responseCode : "+ responseCode2);
                    System.out.println("----------------------------------------------------");
                    
                    if (responseCode2 == HttpURLConnection.HTTP_OK) {
                    	br = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
                    	line = "";
                    	StringBuffer sb3 = new StringBuffer();
                    	while((line= br.readLine()) != null) {
                    		sb3.append(line);
                    	}
                    	Gson gson2 = new Gson();
                    	KakaoUserResponse kakaoUser = gson2.fromJson(sb3.toString(), KakaoUserResponse.class);
                    	System.out.println(kakaoUser.toString());
                    	String nickname = kakaoUser.getProperties().getNickname();
                    	String profileImage = kakaoUser.getProperties().getProfile_image();
                    	String email = kakaoUser.getKakao_account().getEmail();
                    	System.out.println(email);
                    	request.getSession().setAttribute("nickname",nickname);
                    	request.getSession().setAttribute("profileImage",profileImage);
                    	request.getSession().setAttribute("email",email);
                    	System.out.println("db:   " + socialLoginMemberService.getDetail(email));
                    	if(socialLoginMemberService.getDetail(email) != null) {
                    		return new ModelAndView("redirect:/home");
                    	} else {
                    		request.getSession().invalidate();
                    		return new ModelAndView("redirect:/join");
                    	}
                    	
                    	
                    }
        		} catch (Exception e) {
        			// TODO: handle exception
        			System.out.println(e);
        		} finally {
        			try {
        				isr.close();
        				br.close();
        				conn.disconnect();
        			} catch (Exception e2) {
        				// TODO: handle exception
        				System.out.println(e2);
        			}
        		}
        		
        		return new ModelAndView("redirect:/home");
            	
			} else {
				// �삤瑜� 硫붿떆吏� 異쒕젰
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                String line = "";
                StringBuffer sbError = new StringBuffer();
                while ((line = br.readLine()) != null) {
                    sbError.append(line);
                }
        
                System.out.println("Error response: " + sbError.toString());
                return new ModelAndView("sns/error");
			}
            
       } catch (Exception e) {
         // TODO: handle exception
    	   System.out.println(e);
    	   return new ModelAndView("sns/error");
      }
       
   }
   @GetMapping("/kakaologout")
   public ModelAndView kakaoLogout(HttpServletRequest request) {
	   request.getSession().invalidate();
	   return new ModelAndView("home");
   }
   @GetMapping("/naverlogin")
   public ModelAndView naverlogin(HttpServletRequest request) {
	   String code = request.getParameter("code");
	      System.out.println("naver code : " + code);
	      
	      String reqURL = "https://nid.naver.com/oauth2.0/token";
	       try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	            
	            // 蹂몃Ц
	            BufferedWriter bw =  new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuffer sb = new StringBuffer();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=jOeGSWAwUdbzfiBC8hCb");
	            sb.append("&client_secret=4zW6PNY6rJ");
	            sb.append("&redirect_uri=http://localhost:8080/naverlogin");
	            sb.append("&code="+code);
	            bw.write(sb.toString());
	            bw.flush();
	            
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : "+ responseCode);
	            
	            if (responseCode == HttpURLConnection.HTTP_OK) {
	            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            	String line = "";
	            	StringBuffer sb2 = new StringBuffer();
	            	while((line= br.readLine()) != null) {
	            		sb2.append(line);
	            	}
	            	String result = sb2.toString();
	            	System.out.println(result);
	            	Gson gson = new Gson();
	            	NaverVO navo = gson.fromJson(result, NaverVO.class);
	            	
	                System.out.println(navo.getAccess_token());
	                System.out.println(navo.getRefresh_token());
	                System.out.println(navo.getToken_type());
	            	
	                request.getSession().setAttribute("navo", navo);
	                request.getSession().setAttribute("platform", "naver");
	                //start
	                String access_token = navo.getAccess_token();

	        		String apiURL = "https://openapi.naver.com/v1/nid/me";
	        		String header = "Bearer " + access_token;
	        		conn = null;
	        		br = null;
	                
	        		try {
	        			url = new URL(apiURL);
	        			conn = (HttpURLConnection) url.openConnection();
	        			
	        			//POST
	        			conn.setRequestMethod("POST");
	        			conn.setDoOutput(true);

	        			conn.setRequestProperty("Authorization","Bearer " + access_token);
	        			
	        			responseCode = conn.getResponseCode();
	        			System.out.println("responseCode : " + responseCode);
	        			
	        			if (responseCode == HttpURLConnection.HTTP_OK) {
	        				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        				
	        				line ="";
	        				sb = new StringBuffer();
	        				while ((line=br.readLine()) != null) {
	        					sb.append(line);
	        				}
	        			} else {
	        				return new ModelAndView("errorpage");
	        			}
	        			gson = new Gson();
                    	NaverUserResponse naverUser = gson.fromJson(sb.toString(), NaverUserResponse.class);
                    	String email = naverUser.getResponse().getEmail();
                    	System.out.println(email);
                    	
                    	if(socialLoginMemberService.getDetail(email) != null) {
                    		return new ModelAndView("redirect:/home");
                    	} else {
                    		request.getSession().invalidate();
                    		return new ModelAndView("redirect:/join");
                    	}
	        			
	        			
	        		} catch (Exception e) {
	        			System.out.println(e);
	        		} finally {
	        			try {
	        				br.close();
	        				conn.disconnect();
	        			} catch (Exception e2) {
	        				System.out.println(e2);
	        			}
	        		}

	                
	            	return new ModelAndView("redirect:/home");
	            	
	            	
	            	
				} else {
	                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	                String line = "";
	                StringBuffer sbError = new StringBuffer();
	                while ((line = br.readLine()) != null) {
	                    sbError.append(line);
	                }
	        
	                System.out.println("Error response: " + sbError.toString());
	                return new ModelAndView("sns/error");
				}
	       } catch (Exception e) {
	         // TODO: handle exception
	    	   System.out.println(e);
	    	   return new ModelAndView("sns/error");
	      }
   }
   
   @GetMapping("/naverLogout")
   public ModelAndView naverLogout(HttpServletRequest request) {
	   request.getSession().invalidate();
	   return new ModelAndView("home");
   }

 
   
}