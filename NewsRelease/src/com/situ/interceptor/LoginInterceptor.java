package com.situ.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		String url= req.getRequestURI();
		String c=req.getContextPath();
		//System.out.println(url);
		if(url.equals(c+"/login.html")||url.equals(c+"/")||
				url.equals(c+"/User/login")||
				url.equals("/NewsRelease/User/register")||
				url.equals("/NewsRelease/News/begin")||
				url.equals("/NewsRelease/Admin/login")||
				url.equals("/NewsRelease/loginAdmin.jsp")||
				url.equals("/NewsRelease/News/ClassifyFunction")) {
		//	System.out.println("ok");
			return true;
		}else {
			HttpSession s=req.getSession();
			if(s.getAttribute("user")==null && s.getAttribute("Admin")==null) {
				if(url.lastIndexOf('.')>0) return true;
				resp.sendRedirect(c+"/login.html");
				return false;
			}else {
				return true;
			}
		}
		
	}

}
