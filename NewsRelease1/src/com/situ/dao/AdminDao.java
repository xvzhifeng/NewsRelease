package com.situ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.situ.entity.Admin;
import com.situ.entity.User;
import com.situ.utils.SearchInfo;

@Repository
public interface AdminDao {

	@Select("select *  from admin"
			+ " ${where} ${sort} ${limit}")
	public List<Admin> select(SearchInfo info);
	
	@Select("select * from admin where id =#{id}")
	public Admin getById(int id);
	
	@Select("select * from admin where adminName =#{adminName} and adminPass=#{adminPass}")
	public Admin login(Admin u);
	
	@Delete("delete from admin where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into admin (adminName,adminPass) "
			+ " values(#{adminName},#{adminPass})")
	public void insert(Admin u);
	
	@Insert("update admin set adminName=#{adminName},adminPass=#{adminPass}"
			+ "  where id=#{id}")
	public void update(Admin u);
	
	@Insert("update Admin set adminPass=#{adminPass} "
			+ "  where id=#{id}")
	public void alterPass(Admin u);
	
}
