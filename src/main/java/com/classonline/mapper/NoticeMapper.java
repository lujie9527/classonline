package com.classonline.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.classonline.bean.Notice;
import com.classonline.utils.SqlProvider;

public interface NoticeMapper {

	@Results({
		@Result(column="adminId",property="admin",one=@One(select="com.classonline.mapper.AdminMapper.getAdminById"))
	})
	@Select("select * from notice  order by noticeTime desc limit 0,8")
	//取出第第1条至第8条记录，共8条记录。
	List<Notice> get4Notices();


	@Results({
		@Result(column="adminId",property="admin",one=@One(select="com.classonline.mapper.AdminMapper.getAdminById"))
	})
	@Select("select * from notice where id=#{id}")
	Notice getNoticeById(Integer id);


	@Results({
		@Result(column="adminId",property="admin",one=@One(select="com.classonline.mapper.AdminMapper.getAdminById"))
	})
	@SelectProvider(type=SqlProvider.class,method="getSqlforFindNotices")
	List<Notice> findNoticeByKeyword(String keyWord);


	@Insert("insert into notice (title,content,noticeTime,adminId) values (#{title},#{content},#{noticeTime},#{adminId})")
	void addNotice(@Param("title")String title,@Param("content") String content,@Param("noticeTime") String noticeTime,@Param("adminId") int adminId);


	@Delete("delete from notice where id=#{id}")
	void deleteNotice(Integer id);


	@Update("update notice set title=#{title},content=#{content} where id=#{id}")
	void updateNotice(@Param("id")String id,@Param("title") String title, @Param("content")String content);
}
