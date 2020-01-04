package com.situ.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.dao.AdminDao;
import com.situ.entity.Admin;
import com.situ.entity.User;
import com.situ.utils.JsonInfo;
import com.situ.utils.SearchInfo;

@Controller
@RequestMapping("Admin")
public class AdminController {
	
	@Autowired
	AdminDao dao;
	
	

	@RequestMapping("alter")
	public String alter(int id,ModelMap m) {//string name= User u
		//dao.alterPass(u);
		m.put("info", dao.getById(id));
		return "Admin/pass";
	}
	
	@RequestMapping("updatepass")
	public @ResponseBody JsonInfo updatepass(Admin u,ModelMap m) {//string name= User u
		dao.alterPass(u);
		return new JsonInfo(1);
	}
	
	
	@RequestMapping("index")
	public String index(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where Admin.AdminName like '%"+t+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "Admin/index";
	}
	@RequestMapping("delete")
	public String delete(int id,ModelMap m) {
		dao.delete(id);
		return index("",new SearchInfo(),m);
	}
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(Admin u,ModelMap m) {//string name= Admin u
		dao.insert(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("register")
	public String register(Admin u,ModelMap m) {//string name= Admin u
		dao.insert(u);
		
		return "redirect:../login.html";
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(Admin u,ModelMap m) {//string name= Admin u
		dao.update(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {//string name= Admin u
		
		return "Admin/edit";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {//string name= Admin u
		m.put("info", dao.getById(id));
		return add(m);
	}
	
	@RequestMapping("login")
	public String login(Admin u,ModelMap m,HttpServletRequest req) {//string name= Admin u
		Admin Admin=dao.login(u);
		if(Admin==null&&u.getAdminPass()!=null) {
			return "redirect:../loginAdmin.jsp";
		}else {
			HttpSession s=req.getSession();
			s.setMaxInactiveInterval(100);
			s.setAttribute("Admin", Admin);
			return "redirect:../index.jsp";
		}
	}
	
	@RequestMapping("outlogin")
	public String outlogin(ModelMap m,HttpServletRequest req) {//string name= User u
			req.getSession().removeAttribute("Admin");
			return "redirect:../login.html";
	}
}
 