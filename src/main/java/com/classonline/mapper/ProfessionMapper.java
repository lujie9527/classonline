package com.classonline.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.classonline.bean.Profession;

public interface ProfessionMapper {

	@Select("select * from profession")
	List<Profession> getProfessions();

	@Select("select * from profession where id=#{id}")
	Profession getProfessionById(int id);

	@Insert("insert into profession (name) values (#{name})")
	void addProfession(@Param("name")String name);

	@Delete("delete from profession where id=#{id}")
	void deleteProfession(int id);

	@Update("update profession set name=#{name} where id=#{id}")
	void updateProfession(@Param("id")int id,@Param("name") String name);
}
