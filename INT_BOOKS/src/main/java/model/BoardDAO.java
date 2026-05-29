package model;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {

	// 1. 글 목록 전체 조회
	public ArrayList<BoardDTO> getAllBoard() {
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> list = new ArrayList<>();

		try {
			String sql = "SELECT b.*, m.MEMBER_NAME " + "FROM BOARD b, MEMBER m " + "WHERE b.MEMBER_ID = m.MEMBER_ID "
					+ "ORDER BY b.BOARD_ID DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO bean = new BoardDTO();
				bean.setBOARD_ID(rs.getInt("BOARD_ID"));
				bean.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				bean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				bean.setMEMBER_ID(rs.getString("MEMBER_ID"));
				bean.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				bean.setCREATED_AT(rs.getDate("CREATED_AT"));
				bean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				bean.setREAD_COUNT(rs.getInt("READ_COUNT"));
				bean.setBOOK_TITLE(rs.getString("BOOK_TITLE"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, con);
		}
		return list;
	}

	// 2. 글 상세 조회 (조회수 증가 포함)
	public BoardDTO getOneBoard(int boardNum) {
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO bean = null;

		try {
			// 조회수 증가
			String countSql = "UPDATE BOARD SET READ_COUNT = READ_COUNT + 1 WHERE BOARD_NUM = ?";
			pstmt = con.prepareStatement(countSql);
			pstmt.setInt(1, boardNum);
			pstmt.executeUpdate();
			pstmt.close();

			// 글 상세 + 회원 이름 JOIN
			String sql = "SELECT b.*, m.MEMBER_NAME " + "FROM BOARD b, MEMBER m " + "WHERE b.MEMBER_ID = m.MEMBER_ID "
					+ "AND b.BOARD_NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new BoardDTO();
				bean.setBOARD_ID(rs.getInt("BOARD_ID"));
				bean.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				bean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				bean.setMEMBER_ID(rs.getString("MEMBER_ID"));
				bean.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				bean.setCREATED_AT(rs.getDate("CREATED_AT"));
				bean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				bean.setREAD_COUNT(rs.getInt("READ_COUNT"));
				bean.setBOOK_TITLE(rs.getString("BOOK_TITLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, con);
		}
		return bean;
	}

	// 3. 글 저장 (BOARD_NUM 0 저장 버그 수정)
	public void insertBoard(BoardDTO dto) {
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// ① 시퀀스 값을 먼저 가져옴
			String seqSql = "SELECT BOARD_SEQ.NEXTVAL FROM DUAL";
			pstmt = con.prepareStatement(seqSql);
			rs = pstmt.executeQuery();
			rs.next();
			int nextVal = rs.getInt(1);
			rs.close();
			pstmt.close();

			// ② BOARD_ID, BOARD_NUM 둘 다 동일한 시퀀스 값으로 INSERT
			String sql = "INSERT INTO BOARD (BOARD_ID, BOARD_TITLE, BOARD_NUM, MEMBER_ID, BOARD_CONTENT, READ_COUNT, BOOK_TITLE) "
					+ "VALUES (?, ?, ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nextVal);
			pstmt.setString(2, dto.getBOARD_TITLE());
			pstmt.setInt(3, nextVal);
			pstmt.setString(4, dto.getMEMBER_ID());
			pstmt.setString(5, dto.getBOARD_CONTENT());
			pstmt.setString(6, dto.getBOOK_TITLE());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, con);
		}
	}

	// 4. 글 삭제
	public void deleteBoard(int boardNum) {
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM BOARD WHERE BOARD_NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(null, pstmt, con);
		}
	}
}