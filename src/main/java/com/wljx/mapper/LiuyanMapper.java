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

import com.wljx.bean.Liuyan;
import com.wljx.bean.Pinglun;
import com.wljx.bean.Pinglun2;

public interface LiuyanMapper {

	@Results({
		@Result(column="stuId",property="student",one=@One(select="com.wljx.mapper.StudentMapper.getStuById"))
	})
	@Select("select * from liuyan")
	List<Liuyan> getAllLiuyans();

	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@Select("select * from pinglun where liuyanId=#{liuyanId}")
	List<Pinglun> getTeacherPingluns(int liuyanId);

	@Results({
		@Result(column="stuId",property="student",one=@One(select="com.wljx.mapper.StudentMapper.getStuById"))
	})
	@Select("select * from pinglun2 where liuyanId=#{liuyanId}")
	List<Pinglun2> getStuPingluns(int liuyanId);

	@Results({
		@Result(column="stuId",property="student",one=@One(select="com.wljx.mapper.StudentMapper.getStuById"))
	})
	@Select("select * from liuyan where id=#{id}")
	Liuyan getLiuyanById(int id);

	@Insert("insert into liuyan (title,content,liuyanTime,state,answer,stuId) values (#{title},#{content},#{liuyanTime},#{state},#{answer},#{stuId})")
	void addLiuyan(@Param("title") String title,@Param("content") String content,@Param("liuyanTime") String liuyanTime
			,@Param("state") int state,@Param("answer") int answer,@Param("stuId") String stuId);

	@Insert("insert into pinglun2 (content,liuyanId,stuId,plTime) values (#{content},#{liuyanId},#{stuId},#{plTime})")
	void addPinglun2(@Param("content") String content,@Param("liuyanId") int liuyanId,@Param("stuId") String stuId,@Param("plTime") String plTime);


	@Insert("insert into pinglun (content,liuyanId,teacherId,plTime) values (#{content},#{liuyanId},#{teacherId},#{plTime})")
	void addPinglun(@Param("content") String content,@Param("liuyanId") int liuyanId,@Param("teacherId") String teacherId,@Param("plTime") String plTime);

	@Select("select answer from liuyan where id=#{id}")
	int getAnswerById(int id);

	@Update("update liuyan set answer=#{answer} where id=#{id}")
	void updateAnswer(@Param("id") int id,@Param("answer") int answer);

	@Delete("delete from liuyan where id=#{id}")
	void deleteLiuyan(Integer id);

}
