package com.wljx.mapper;

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

import com.wljx.bean.Video;
import com.wljx.bean.Videoplay;
import com.wljx.utils.SqlProvider;

public interface VideoMapper {

	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@SelectProvider(type=SqlProvider.class,method="getSqlForGetVideos")
	List<Video> getAllVideos(String keyword);
	
	
	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@Select("select * from video where id=#{id}")
	Video getVideoById(int id);


	//判断该用户在当前时间是否点击过了该视频
	@Select("select * from videoplay where videoId=#{videoId} and ip=#{ip} and clickTime=#{clickTime}")
	Videoplay getVideoPlay(@Param("videoId")int videoId,@Param("ip") String ip, @Param("clickTime") String clickTime);


	@Select("select playNum from video where id=#{videoId}")
	int getVideoPlayNum(int videoId);


	@Insert("insert into videoplay (videoId,ip,clickTime) values (#{videoId},#{ip},#{clickTime})")
	void addVideoPlay(@Param("videoId")int videoId,@Param("ip") String ip, @Param("clickTime") String clickTime);


	@Update("update video set playNum=#{playNum} where id=#{videoId}")
	void updatePlayNum(@Param("videoId")int videoId,@Param("playNum") int playNum);


	@Delete("delete from video where id=#{id}")
	void deleteVideo(Integer id);
	

	@Insert("insert into video (name,uploadTime,videoUrl,imageUrl,teacherId,description) values (#{name},#{uploadTime},#{videoUrl},#{imageUrl},#{teacherId},#{description})")
	void addVideo(@Param("name")String name,@Param("uploadTime") String uploadTime,@Param("videoUrl") String videoUrl
			,@Param("imageUrl") String imageUrl,@Param("teacherId") String teacherId,@Param("description")String description);

}
