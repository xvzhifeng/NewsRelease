package com.situ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.situ.entity.Comment;
import com.situ.utils.SearchInfo;

@Repository
public interface CommentDao {

	@Select("select *  from Comment"
			+ " ${where} ${sort} ${limit}")
	public List<Comment> select(SearchInfo info);
	
	@Select("select * from Comment where id =#{id}")
	public Comment getById(int id);
	
	@Delete("delete from Comment where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into Comment (NewsID,cContent,cTime,cName) "
			+ " values(#{NewsID},#{cContent},#{cTime},#{cName})")
	public void insert(Comment u);
	
	@Insert("update Comment set cContent=#{cContent},cTime=#{cTime}"
			+ "  where id=#{id}")
	public void update(Comment u);
	
}
