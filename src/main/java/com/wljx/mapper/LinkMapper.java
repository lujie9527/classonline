package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import com.wljx.bean.Link;
import com.wljx.utils.SqlProvider;

public interface LinkMapper {

	@Select("select * from link")
	List<Link> getAllLink();

	@Insert("insert into link (name,url,imgUrl) values (#{name},#{url},#{imgUrl})")
	void addLink(@Param("name")String name,@Param("url") String url,@Param("imgUrl") String imgUrl);

	@Delete("delete from link where id=#{id}")
	void deleteLink(Integer id);

	@UpdateProvider(type=SqlProvider.class,method="getSqlForUpdateLink")
	void updateLink(Integer id, String name, String url, String imgUrl);

}
