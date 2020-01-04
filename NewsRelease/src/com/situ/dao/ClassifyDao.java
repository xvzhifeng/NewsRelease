package com.situ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.situ.entity.Classify;
import com.situ.utils.SearchInfo;

@Repository
public interface ClassifyDao {

	@Select("select *  from Classify"
			+ " ${where} ${sort} ${limit}")
	public List<Classify> select();
	
	@Select("select * from Classify where id =#{id}")
	public Classify getById(int id);
	
	@Select("select * from Classify where ClassifyName =#{ClassifyName} and ClassifyPass=#{ClassifyPass}")
	public Classify login(Classify u);
	
	@Delete("delete from Classify where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into Classify (ClassifyName) "
			+ " values(#{ClassifyName})")
	public void insert(Classify u);
	
	@Insert("update Classify set ClassifyName=#{ClassifyName} "
			+ "  where id=#{id}")
	public void update(Classify u);
	
}
