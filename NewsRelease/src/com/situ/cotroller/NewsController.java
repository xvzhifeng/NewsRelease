package com.situ.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.dao.ClassifyDao;
import com.situ.dao.NewsDao;
import com.situ.entity.News;
import com.situ.utils.JsonInfo;
import com.situ.utils.SearchInfo;

@Controller
@RequestMapping("News")
public class NewsController {
	
	@Autowired
	NewsDao dao;
	
	@Autowired
	ClassifyDao cdao;
	
	
	@RequestMapping("index")
	public String index(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where news.newsName like '%"+t+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "News/index";
	}
	
	@RequestMapping("indexID")
	public String indexID(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where news.id like '"+t+"' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "BeginNews";
	}
	
	@RequestMapping("indexall")
	public String indexall(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
		if(t.length()>0)
			info.setWhere(" where news.id like '"+t+"' "+"or news.newsName like '%"+t+"%' "+"or news.newsText like '%"+t+"%' ");
		m.put("list", dao.select(info));
		m.put("search", info);
		m.put("txt",t);
		return "BeginNews";
	}
	
	@RequestMapping("context")
	public String context(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
			if(t.length()>0)
				info.setWhere(" where news.id like '"+t+"' ");
			m.put("list", dao.select(info));
			m.put("search", info);
			m.put("txt",t);
			return "News/context";
		}
	
	@RequestMapping("ClassifyFunction")
	public String ClassifyFunction(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
			if(t.length()>0)
				info.setWhere(" where news.classifyID like '%"+t+"%' ");
			m.put("list", dao.select(info));
			m.put("search", info);
			m.put("txt",t);
			return "BeginNews";
		}
		
	@RequestMapping("begin")
	public String begin(@RequestParam(defaultValue="",value="txt") String t,SearchInfo info,ModelMap m) {
			if(t.length()>0)
				info.setWhere(" where news.newsName like '%"+t+"%' ");
			m.put("list", dao.select(info));
			m.put("search", info);
			m.put("txt",t);
			m.put("listdesc",dao.order(info));
			return "BeginNews";
		}
	
	@RequestMapping("delete")
	public String delete(int id,ModelMap m) {
		dao.delete(id);
		return index("",new SearchInfo() ,m);
	}
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(News u,ModelMap m) {//string name= News u
		
		dao.insert(u);
		return new JsonInfo(1);
	}
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(News u,ModelMap m) {//string name= News u
		dao.update(u);
		return new JsonInfo(1);
	}
	
	@RequestMapping("add")
	public String add(ModelMap m) {//string name= News u
		m.put("classifylist",cdao.select());
		return "News/edit";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {//string name= News u
		m.put("info", dao.getById(id));
		return add(m);
	}
	
	
}
 