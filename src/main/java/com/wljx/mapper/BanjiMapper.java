package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import com.wljx.bean.Banji;
import com.wljx.utils.SqlProvider;

public interface BanjiMapper {
	
	@Select("select * from banji where professionId=#{pid}")
	List<Banji> getBanjisByPid(int pid);

	@Select("select * from banji where id=#{id}")
	Banji getBanjiById(int id);

	@Results({
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
	})
	@Select("select * from banji")
	List<Banji> getBanjis();

	@Insert("insert into banji (name,description,professionId) values (#{name},#{description},#{professionId})")
	void addBanji(@Param("name")String name,@Param("description") String description,@Param("professionId") String professionId);

	@UpdateProvider(type=SqlProvider.class,method="getSqlForUpdateBanji")
	void updateBanji( Integer id, String name, String description, String professionId);

	@Delete("delete from banji where id=#{id}")
	void deleteBanji(Integer id);
}
