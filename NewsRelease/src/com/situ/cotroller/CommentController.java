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

import com.situ.dao.CommentDao;
import com.situ.entity.Comment;
import com.situ.utils.JsonInfo;
import com.situ.utils.SearchInfo;

@Controller
@RequestMapping("Comment")
public class CommentController {
	
	@Autowired
	CommentDao dao;
	
	

	@RequestMapping("index")
	public String index(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where Comment.CommentName like '%"+t+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "Comment/index";
	}
	
	@RequestMapping("indexC")
	public String indexC(int id,SearchInfo info,ModelMap m) {
		if(id!=0)
			info.setWhere(" where Comment.NewsID like '%"+id+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		return "Comment/index";
	}
	
	@RequestMapping("delete")
	public String delete(int id,ModelMap m) {
		dao.delete(id);
		return index("",new SearchInfo(),m);
	}
	@RequestMapping("insert")
	public String  insert(Comment u,ModelMap m) {//string name= Comment u
		dao.insert(u);
		return "Comment/edit";
	}
	
	@RequestMapping("register")
	public String register(Comment u,ModelMap m) {//string name= Comment u
		dao.insert(u);
		
		return "redirect:../login.html";
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(Comment u,ModelMap m) {//string name= Comment u
		dao.update(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {//string name= Comment u
		
		return "Comment/edit";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {//string name= Comment u
		m.put("info", dao.getById(id));
		return add(m);
	}
	
	
	@RequestMapping("outlogin")
	public String outlogin(ModelMap m,HttpServletRequest req) {//string name= User u
			req.getSession().removeAttribute("Comment");
			return "redirect:../login.html";
	}
}
 