package com.situ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import com.situ.entity.News;
import com.situ.utils.SearchInfo;

@Repository
public interface NewsDao {
	@Select("select news.*,classify.classifyName classifyName "
			+ "from news inner join classify on news.classifyID=classify.id  ${where} ${sort} ${limit}")
	public List<News> select(SearchInfo info);
	
	@Select("select * from news where id=#{id}")
	public News getById(int id);
	
	@Delete("delete from news where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into news (newsName,newsText,newsTime,newsReleaseID,classifyID,newsStatu)"+
			" values(#{newsName},#{newsText},#{newsTime},#{newsReleaseID},#{classifyID},#{newsStatu})")
	public void insert(News u);
	
	@Insert("update news set newsName=#{newsName},newsText=#{newsText},newsTime=#{newsTime},newsReleaseID=#{newsReleaseID} "
			+ " ,classifyID=#{classifyID},newsStatu=#{newsStatu} where id=#{id}")
	public void update(News u);
	
	@Select("select news.*,classify.classifyName classifyName "
			+ "from news inner join classify on news.classifyID=classify.id  order by newsTime desc  ${where} ${sort} ${limit}"
			)
	public List<News> order(SearchInfo info);
	
}
