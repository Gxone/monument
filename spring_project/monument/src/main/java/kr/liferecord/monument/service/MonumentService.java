package kr.liferecord.monument.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.liferecord.monument.domain.MarkDownTableDto;
import kr.liferecord.monument.domain.TestTableDto;
import kr.liferecord.monument.service.mapper.MonumentMapper;

@Service
public class MonumentService {

	@Autowired private MonumentMapper monumentMapper;
	
	public void createContent(MarkDownTableDto markDownTableDto) {
		monumentMapper.insertMarkdownContent(markDownTableDto);
	}
	
	public List<MarkDownTableDto> getContent() {
		return monumentMapper.findAllMarkDownTable();
	}

 	public MarkDownTableDto getDetails(int idx) {
 		return monumentMapper.findBoardDetails(idx);
 	}
}