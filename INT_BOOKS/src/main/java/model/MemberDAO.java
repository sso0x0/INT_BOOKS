package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MemberDAO {

	// 1. 회원가입
	public int insertMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, ?)";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getMEMBER_ID());
			pstmt.setString(2, member.getMEMBER_NAME());
			pstmt.setString(3, member.getMEMBER_PW());
			pstmt.setString(4, member.getEMAIL());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt, conn);
		}
		return -1;
	}

	// 2. 로그인 체크 기능
	public String loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MEMBER_NAME FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString("MEMBER_NAME");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return null;
	}

	// 3. 모든 회원 조회
	public ArrayList<MemberDTO> allSelectMember() {
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO member = new MemberDTO();

				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setEMAIL(rs.getString("EMAIL"));
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return memberList;
	}

	// 4. 한 회원 상세 조회
	public MemberDTO oneSelectMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setEMAIL(rs.getString("EMAIL"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return member;
	}

	// 5. 비밀번호 조회
	public String getPass(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pw = "";
		String sql = "SELECT MEMBER_PW FROM MEMBER WHERE MEMBER_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pw = rs.getString("MEMBER_PW");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return pw;
	}

	// 6. 회원 정보 수정 (비밀번호, 이메일 변경)
	public int updateMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET MEMBER_PW = ?, EMAIL = ? WHERE MEMBER_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_PW());
			pstmt.setString(2, member.getEMAIL());
			pstmt.setString(3, member.getMEMBER_ID());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt, conn);
		}
		return -1;
	}

	// 7. 회원 삭제 - 추후 추가 예정
//	public int deleteMember(String id) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String sql = "DELETE FROM MEMBER WHERE MEMBER_ID = ?";
//
//		try {
//			conn = DBUtil.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(pstmt, conn);
//		}
//		return -1;
//	}

	// 8. 마이페이지용 회원 정보 조회 (특정 컬럼만 Map 형태로 뽑아 쓸 때 사용)
	public Map<String, String> getMemberMap(String memberId) {
		Map<String, String> map = new HashMap<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MEMBER_ID, MEMBER_NAME, EMAIL FROM MEMBER WHERE MEMBER_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				map.put("memberId", rs.getString("MEMBER_ID"));
				map.put("memberName", rs.getString("MEMBER_NAME"));
				map.put("email", rs.getString("EMAIL"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return map;
	}
}