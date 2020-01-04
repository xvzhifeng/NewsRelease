package com.situ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.situ.entity.User;
import com.situ.utils.SearchInfo;

@Repository
public interface UserDao {

	@Select("select *  from user"
			+ " ${where} ${sort} ${limit}")
	public List<User> select(SearchInfo info);
	
	@Select("select * from user where id =#{id}")
	public User getById(int id);
	
	@Select("select * from user where userName =#{userName} and userPass=#{userPass}")
	public User login(User u);
	
	@Delete("delete from user where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into user (userName,userPass,userEmail,userBirthday,userSex,userTell,userRegister) "
			+ " values(#{userName},#{userPass},#{userEmail},#{userBirthday},#{userSex},#{userTell},#{userRegister})")
	public void insert(User u);
	
	@Insert("update user set userName=#{userName},userPass=#{userPass},userEmail=#{userEmail},userBirthday=#{userBirthday},"
			+ " userSex=#{userSex},userTell=#{userTell}"
			+ "  where id=#{id}")
	public void update(User u);
	
	@Insert("update user set userPass=#{userPass} "
			+ "  where id=#{id}")
	public void alterPass(User u);
	
}
