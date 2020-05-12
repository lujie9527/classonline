package com.wljx.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wljx.bean.Admin;

public interface AdminMapper {
	@Select("select * from admin where id=#{id}")
	public Admin getAdminById(int id);

	@Select("select * from admin where name=#{name} and password=#{password}")
	public Admin login(@Param("name")String name,@Param("password") String password);

	@Update("update admin set password=#{password} where id=#{id}")
	public void updatePwd(@Param("id")int id,@Param("password") String password);
}
