package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.wljx.bean.Doc;
import com.wljx.bean.Docdetail;
import com.wljx.utils.SqlProvider;

public interface DocMapper {

	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@SelectProvider(type=SqlProvider.class,method="getSqlForAllDocs")
	List<Doc> getAllDocs(String keyword);

	@Results({
		@Result(column="docId",property="doc",one=@One(select="com.wljx.mapper.DocMapper.getDocById"))
	})
	@Select("select * from doc_detail where docId=#{docId}")
	List<Docdetail> getDocDetailsById(int docId);

	
	//根据文档id查询文档
	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@Select("select * from doc where id=#{id}")
	Doc getDocById(int id);

	@Insert("insert into doc_download (docdetailId,stuId,downTime) values (#{docdetailId},#{stuId},#{downTime})")
	void addDocDetailDownload(@Param("docdetailId")int docdetailId,@Param("stuId") String stuId,@Param("downTime") String downTime);
	
	@Results({
		@Result(column="docId",property="doc",one=@One(select="com.wljx.mapper.DocMapper.getDocById"))
	})
	@Select("select * from doc_detail where id=#{id}")
	Docdetail getDocdetailById(int id);

	@Results({
		@Result(column="docId",property="doc",one=@One(select="com.wljx.mapper.DocMapper.getDocById"))
	})
	@Select("select * from doc_detail")
	List<Docdetail> getAllDocDetails();

	@Delete("delete from doc_detail where id=#{id}")
	void deleteDocDetail(Integer id);

	@Select("select * from doc where teacherId=#{teacherId}")
	List<Doc> getAllDocsByTeacherId(String teacherId);

	/*@Insert("insert into doc(createTime,name,teacherId) values (#{createTime},#{name},#{teacherId})")
	@Options(useGeneratedKeys=true,keyColumn="id")
	int addDoc(@Param("createTime")String createTime,@Param("name") String name,@Param("teacherId") String teacherId);*/

	@Insert("insert into doc_detail (docId,name,url,uploadTime,size,description) values (#{docId},#{name},#{url},#{uploadTime},#{size},#{description})")
	void addDocDetail(@Param("docId")Integer docId, @Param("name")String name, @Param("url")String url
			,@Param("uploadTime") String uploadTime,@Param("size") String size,@Param("description") String description);

	@Insert("insert into doc(createTime,name,teacherId) values (#{doc.createTime},#{doc.name},#{doc.teacher.id})")
	@Options(useGeneratedKeys=true,keyColumn="id",keyProperty="doc.id")
	void addDoc(@Param("doc")Doc doc);
}
