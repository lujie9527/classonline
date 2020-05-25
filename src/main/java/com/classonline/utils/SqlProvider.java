package com.classonline.utils;

import org.apache.commons.lang.StringUtils;

/**
 * 该类主要是用来生成sql语句给mapper用的
 */
public class SqlProvider {
	
	public String getSqlforFindNotices(String keyWord) {
		StringBuffer sb=new StringBuffer("select * from notice where 1=1");
		if(keyWord!=null && !"".equals(keyWord)) {
			sb.append(" and title like '%"+keyWord+"%'");
			//append方法的作用是在StringBuffer对象后面追加字符串。
		}
		sb.append(" order by noticeTime desc");
		return sb.toString();
	}
	
	public String getSqlForfindJobsByTeacherId(String teacherId,String name, int professionId, int banjiId) {
		StringBuffer sb=new StringBuffer("select * from job where state=0");
		sb.append(" and teacherId="+teacherId);

		if(professionId!=-1) {
			sb.append(" and professionId="+professionId);
		}
		if(banjiId!=-1) {
			sb.append(" and banjiId="+banjiId);
		}
		if(name!=null && !"".equals(name)) {
			sb.append(" and name like '%"+name+"%'");
		}
		System.out.println("条件查询语句"+sb.toString());
		return sb.toString();
	}
	
	public String getSqlForGetVideos(String keyword) {
		StringBuffer sb=new StringBuffer("select * from video where 1=1");
		if(keyword!=null && !"".equals(keyword)) {
			sb.append(" and name like '%"+keyword+"%'");
		}
		sb.append(" order by uploadTime desc");
		return sb.toString();
	}


	public String getSqlForAllDocs(String keyword) {
		StringBuffer sb=new StringBuffer("select * from doc where 1=1");
		if(keyword!=null && !"".equals(keyword)) {
			sb.append(" and name like '%"+keyword+"%'");
		}
		sb.append(" order by createTime desc");
		return sb.toString();
	}
	
	public String getSqlForUpdateStudent(String id, String name, String password, String sex, Integer age, String ruxueTime, String url,
			Integer banjiId, Integer professionId) {
		StringBuffer sb=new StringBuffer("update student");
		if(!StringUtils.isBlank(name)) {
			sb.append(" name='"+name+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(password)) {
			sb.append(" password='"+password+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(sex)) {
			sb.append(" sex='"+sex+"'");
			sb.append(" , ");
		}
		if(age!=null) {
			sb.append(" age="+age);
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(ruxueTime)) {
			sb.append(" ruxueTime='"+ruxueTime+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(url)) {
			sb.append(" url='"+url+"'");
			sb.append(" , ");
		}
		if(banjiId!=null) {
			sb.append(" banjiId="+banjiId);
			sb.append(" , ");
		}
		if(professionId!=null) {
			sb.append(" professionId="+professionId);
			sb.append(" , ");
		}
		sb.append(" where id='"+id+"'");
		
		int index=sb.toString().indexOf("student");
		 sb.insert(index+7," set ");
		 
		 int lastIndex=sb.lastIndexOf(",");
		sb.setCharAt(lastIndex, ' ');
	
		System.out.println(sb.toString());
		return sb.toString();
	}
	
	public String getSqlForUpdateTeacher(String id,String name,String password,String sex,Integer age,String url) {
		StringBuffer sb=new StringBuffer("update teacher");
		if(!StringUtils.isBlank(name)) {
			sb.append(" name='"+name+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(password)) {
			sb.append(" password='"+password+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(sex)) {
			sb.append(" sex='"+sex+"'");
			sb.append(" , ");
		}
		if(age!=null) {
			sb.append(" age="+age);
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(url)) {
			sb.append(" url='"+url+"'");
			sb.append(" , ");
		}
		sb.append(" where id='"+id+"'");
		
		int index=sb.toString().indexOf("teacher");
		 sb.insert(index+7," set ");
		 
		 int lastIndex=sb.lastIndexOf(",");
		sb.setCharAt(lastIndex, ' ');
		System.out.println(sb.toString());
		return sb.toString();
	}
	public String getSqlForUpdateBanji(Integer id, String name, String description, String professionId) {
		StringBuffer sb=new StringBuffer("update banji");
		if(!StringUtils.isBlank(name)) {
			sb.append(" name='"+name+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(description)) {
			sb.append(" description='"+description+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(professionId)) {
			sb.append(" professionId='"+professionId+"'");
			sb.append(" , ");
		}
		
		sb.append(" where id="+id);
		
		int index=sb.toString().indexOf("banji");
		 sb.insert(index+5," set ");
		 
		 int lastIndex=sb.lastIndexOf(",");
		sb.setCharAt(lastIndex, ' ');
		System.out.println(sb.toString());
		return sb.toString();
		
	}
	
	public String getSqlForUpdateLink(Integer id, String name, String url, String imgUrl) {
		StringBuffer sb=new StringBuffer("update link");
		if(!StringUtils.isBlank(name)) {
			sb.append(" name='"+name+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(url)) {
			sb.append(" url='"+url+"'");
			sb.append(" , ");
		}
		if(!StringUtils.isBlank(imgUrl)) {
			sb.append(" imgUrl='"+imgUrl+"'");
			sb.append(" , ");
		}
		
		sb.append(" where id="+id);
		
		int index=sb.toString().indexOf("link");
		 sb.insert(index+4," set ");
		 
		 int lastIndex=sb.lastIndexOf(",");
		sb.setCharAt(lastIndex, ' ');
		System.out.println(sb.toString());
		return sb.toString();
		
	}


	public String getSqlForUpdateSubject(int subjectId,String subjectTitle,String subjectOptionA,String subjectOptionB,
										 String subjectOptionC, String subjectOptionD,String subjectAnswer,String subjectParse){

		StringBuffer sb = new StringBuffer("update subject");
		if(!StringUtils.isBlank(subjectTitle)){
			sb.append("subjectTitle='"+subjectTitle+"'");
			sb.append(",");
		}

		if(!StringUtils.isBlank(subjectOptionA)){
			sb.append("subjectOptionA='"+subjectOptionA+"'");
			sb.append(".");
		}

		if (!StringUtils.isBlank(subjectOptionB)){
			sb.append("subjectOptionB='"+subjectOptionB+"'");
			sb.append(",");
		}

		if (!StringUtils.isBlank(subjectOptionC)){
			sb.append("subjectOptionC='"+subjectOptionC+"'");
			sb.append(",");

		}if (!StringUtils.isBlank(subjectOptionD)){
			sb.append("subjectOptionD='"+subjectOptionD+"'");
			sb.append(",");

		}if (!StringUtils.isBlank(subjectAnswer)){
			sb.append("subjectAnswer='"+subjectAnswer+"'");
			sb.append(",");

		}if (!StringUtils.isBlank(subjectParse)){
			sb.append("subjectParse='"+subjectParse+"'");
			sb.append(",");

		}

		sb.append("where subjectId="+subjectId);

		int index = sb.toString().indexOf("subject");
		sb.insert(index+8,"set");

		int lastIndex = sb.lastIndexOf(",");
		sb.setCharAt(lastIndex,' ');
		System.out.println(sb.toString());
		return sb.toString();
	}


	public String getSqlForRandomSubject(int number){
		StringBuffer sb = new StringBuffer("select * from subject");
		if (number!=-1){
			sb.append("order by rand() limit 0,20");
		}
		return sb.toString();
	}

}
