$(function(){
	
	$("#loginBtn").click(function(){
		idChk();
	});
	$("input").keyup(function(e){
		if (e.keyCode == 13) {
			idChk();
		}
	});
	
});

/* 아이디 / 비밀번호 공백 확인 처리 시작 */
function idChk() {
	
	let uid = $("#uid").val().trim();
	let upw = $("#upw").val().trim();
	
	if (uid == "") {
		alert("아이디를 입력해주세요.");
		$("#uid").focus();
	} else if (upw == "") {
		alert("비밀번호를 입력해주세요.");
		$("#upw").focus();
	} else {
		$("form#loginFrm").submit();
	}
	
}
/* 아이디 / 비밀번호 공백 확인 처리 끝 */