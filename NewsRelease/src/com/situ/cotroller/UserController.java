package com.situ.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.dao.UserDao;
import com.situ.entity.User;
import com.situ.utils.JsonInfo;
import com.situ.utils.SearchInfo;

@Controller
@RequestMapping("User")
public class UserController {
	
	@Autowired
	UserDao dao;
	
	

	@RequestMapping("index")
	public String index(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where user.userName like '%"+t+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "User/index";
	}
	@RequestMapping("delete")
	public String delete(int id,ModelMap m) {
		dao.delete(id);
		return index("",new SearchInfo(),m);
	}
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(User u,ModelMap m) {//string name= User u
		dao.insert(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("register")
	public String register(User u,ModelMap m) {//string name= User u
		dao.insert(u);
		
		return "redirect:../login.html";
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(User u,ModelMap m) {//string name= User u
		dao.update(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("updatepass")
	public @ResponseBody JsonInfo updatepass(User u,ModelMap m) {//string name= User u
		dao.alterPass(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {//string name= User u
		
		return "User/edit";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {//string name= User u
		m.put("info", dao.getById(id));
		return add(m);
	}
	
	@RequestMapping("alter")
	public String alter(int id,ModelMap m) {//string name= User u
		//dao.alterPass(u);
		m.put("info", dao.getById(id));
		return "User/pass";
	}
	
	@RequestMapping("login")
	public String login(User u,ModelMap m,HttpServletRequest req) {//string name= User u
		User user=dao.login(u);
		if(user==null&&u.getUserPass()!=null) {
			return "redirect:../login.html";
		}else {
			HttpSession s=req.getSession();
			s.setMaxInactiveInterval(100);
			s.setAttribute("user", user);
			return "redirect:../index.jsp";
		}
	}
	
	@RequestMapping("outlogin")
	public String outlogin(ModelMap m,HttpServletRequest req) {//string name= User u
			req.getSession().removeAttribute("user");
			return "redirect:../login.html";
	}
}
 