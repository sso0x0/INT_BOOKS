package model;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {

	// BOARD 테이블
	private int BOARD_ID;
	private String BOARD_TITLE;
	private int BOARD_NUM;
	private String MEMBER_ID;
	private Date CREATED_AT;
	private String BOARD_CONTENT;
	private int READ_COUNT;
	private String BOOK_TITLE;

	// JOIN용 추가
	private String MEMBER_NAME;
	
}