package com.classonline.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.classonline.bean.Banji;
import com.classonline.utils.SqlProvider;

public interface BanjiMapper {
	
	@Select("select * from banji where professionId=#{pid}")
	List<Banji> getBanjisByPid(int pid);

	@Select("select * from banji where id=#{id}")
	Banji getBanjiById(int id);

	@Results({
		@Result(column="professionId",property="profession",one=@One(select="com.classonline.mapper.ProfessionMapper.getProfessionById"))
	})
	@Select("select * from banji")
	List<Banji> getBanjis();

	@Insert("insert into banji (name,professionId) values (#{name},#{professionId})")
	void addBanji(@Param("name")String name,@Param("professionId") String professionId);

	@UpdateProvider(type=SqlProvider.class,method="getSqlForUpdateBanji")
	void updateBanji( Integer id, String name, String professionId);

	@Delete("delete from banji where id=#{id}")
	void deleteBanji(Integer id);
}
