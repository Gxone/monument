package kr.liferecord.monument.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.liferecord.monument.domain.MarkDownTableDto;
import kr.liferecord.monument.domain.TestTableDto;

public interface MonumentMapper {
	@Insert("INSERT INTO markdown_table (title, content, create_at) VALUES (#{title}, #{content}, NOW())")
	public void insertMarkdownContent (MarkDownTableDto markDownDto);
	
	@Select("SELECT idx, title, content, create_at FROM markdown_table")
	public List<MarkDownTableDto> findAllMarkDownTable();
	
	@Select("SELECT idx, title, content, create_at from markdown_table WHERE idx = #{idx}")
	public MarkDownTableDto findBoardDetails(int idx);
	
}
