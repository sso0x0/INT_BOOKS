/* ===== member.js ===== */

// 로그인 성공 시 호출
function onLoginSuccess(memberName) {
    alert(memberName + "님 환영합니다!");
    location.href = "../home.jsp";
}

// 로그인 실패 시 호출
function onLoginFail() {
    alert("아이디나 비밀번호가 올바르지 않습니다.");
    history.back();
}

// 회원가입 성공 시 호출
function onJoinSuccess() {
    alert("회원가입이 정상적으로 완료되었습니다! 로그인해 주세요.");
    location.href = "login.jsp";
}

// 회원가입 실패 시 호출
function onJoinFail() {
    alert("회원가입에 실패했습니다. 이미 존재하는 아이디일 수 있습니다.");
    history.back();
}