package com.ict.healim.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.LoginService;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SessionUserVO;

import java.time.Instant;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login&join/login");
        return mv;
    }

    @PostMapping("/login_login")
    public ModelAndView getLoginOK(MemberVO lvo, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("home");

        // 쿠키에서 실패 횟수와 차단 해제 시간 확인
        Cookie[] cookies = request.getCookies();
        int loginFailureCount = 0;
        long lockUntil = 0;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("loginFailureCount".equals(cookie.getName())) {
                    loginFailureCount = Integer.parseInt(cookie.getValue());
                }
                if ("lockUntil".equals(cookie.getName())) {
                    lockUntil = Long.parseLong(cookie.getValue());
                }
            }
        }

        // 로그인 차단 상태인지 확인
        long currentTime = Instant.now().toEpochMilli();
        if (lockUntil > currentTime) {
            mv.setViewName("login&join/login");
            mv.addObject("error", "로그인 실패 횟수 초과로 5분 후 다시 시도하세요.");
            return mv;
        }

        try {
            // 로그인 검증
            MemberVO loginVO = loginService.LoginChk(lvo);
            int result = loginService.updateLastLoginTime(lvo);
            if (loginVO != null && passwordEncoder.matches(lvo.getPassword(), loginVO.getPassword())) {
                // 로그인 성공 시 쿠키 및 세션 설정
                resetLoginFailureCookies(response); // 로그인 성공 시 실패 횟수 초기화
                setSessionUser(request, loginVO); // 세션에 사용자 정보 저장

                // "아이디 기억" 기능 처리
                if ("on".equals(request.getParameter("remember"))) {
                    setCookie(response, "rememberedUserId", loginVO.getMber_id(), 60 * 60 * 24 * 15); // 15일
                } else {
                    setCookie(response, "rememberedUserId", null, 0); // 쿠키 삭제
                }

                mv.setViewName("home");
                return mv;
            } else {
                // 로그인 실패 시 실패 횟수 증가

                loginFailureCount++;
                System.out.println("loginFailureCount : " + loginFailureCount);
                if (loginFailureCount >= 5) {

                    lockUntil = currentTime + 5 * 60 * 1000; // 5분 후 차단 해제
                    setCookie(response, "lockUntil", String.valueOf(lockUntil), 5 * 60);
                    mv.addObject("error", "로그인을 " + loginFailureCount + "회 실패하였으며, 5회 실패 시 5분간 차단됩니다.");
                } else {
                	mv.setViewName("login&join/login");
                    mv.addObject("error", "로그인을 " + loginFailureCount + "회 실패하였으며, 5회 실패 시 5분간 차단됩니다.");
                    // error에 출력 내용이 들어가있는지 확인
                    System.out.println("Error message: " + mv.getModel().get("error"));
                }
                setCookie(response, "loginFailureCount", String.valueOf(loginFailureCount), 5 * 60);
                mv.setViewName("login&join/login");
                return mv;
            }
        } catch (Exception e) {
            mv.setViewName("login&join/login");
            mv.addObject("error", "시스템 오류가 발생했습니다.");
            return mv;
        }
    }

    // 쿠키 설정 메서드
    private void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/"); // 모든 경로에서 접근 가능
        response.addCookie(cookie);
    }

    // 로그인 실패 관련 쿠키 초기화
    private void resetLoginFailureCookies(HttpServletResponse response) {
        setCookie(response, "loginFailureCount", "0", 0);
        setCookie(response, "lockUntil", "0", 0);
    }

    // 세션에 사용자 정보 저장
    private void setSessionUser(HttpServletRequest request, MemberVO loginVO) {
        SessionUserVO sessionUser = new SessionUserVO();
        sessionUser.setUser_id(loginVO.getMber_id());
        sessionUser.setUser_level(loginVO.getMber_level());
        request.getSession().setAttribute("sessionUser", sessionUser);
    }

    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/home?logout";
    }
}