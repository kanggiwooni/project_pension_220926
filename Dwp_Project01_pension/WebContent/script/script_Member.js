$(function(){
	
	/* ////////////////////////////////////////////////////////////////////////////// */
	/* /////////// 약관 동의 페이지 (/member/joinAgreement.jsp) 시작 ////////// */
	/* ////////////////////////////////////////////////////////////////////////////// */

    /* 전체 체크 처리 */
	$("input#chkAllBtn").change(function(){
		let chk = $(this).is(":checked");
		$("input.agreeChk").prop("checked", chk);
	});
	
	$("input.agreeChk").change(function(){
		if ($("input.agreeChk").length == $("input.agreeChk:checked").length) {
			$("input#chkAllBtn").prop("checked", true);
		} else {
			$("input#chkAllBtn").prop("checked", false);
		}
	});
	
	/* 약관동의 후 회원가입 버튼 처리 */
	$("button#agreeSubmitBtn").click(function(){
		if ($("input.required").length == $("input.required:checked").length) {
			$("form#agreeFrm").submit();
		} else {
			if (!$("input[name=usingAgree]").prop("checked")) {
				alert("[필수] 이용약관에 동의해주세요.");
			} else {
				alert("[필수] 개인정보 수집 및 이용에 동의해주세요.");
			}
		}
	});
	
	/* ////////////////////////////////////////////////////////////////////////////// */
	/* /////////// 약관 동의 페이지 (/member/joinAgreement.jsp) 끝 ////////// */
	/* ////////////////////////////////////////////////////////////////////////////// */
	
	
	
	
	/* ////////////////////////////////////////////////////////////////////////////// */
	/* ////////////////// 회원가입 페이지 (/member/join.jsp) 시작 ///////////////// */
	/* ////////////////////////////////////////////////////////////////////////////// */
	
	/* 비밀번호 보기 체크 처리 */
	$("input#showPwChk").change(function(){
		if ($(this).is(":checked")) {
			$("input#upw").attr("type", "text");
		} else {
			$("input#upw").attr("type", "password");
		}
	});
	
	/* 비밀번호 확인 일치여부 확인 */
	upw2.keyup(function(){
		let upw = $("input#upw").val();
		let upw2 = $("input#upw2").val();
		if (upw2 == "") {
			$("span#upw2ChkTxt").text("");
		} else if (upw == upw2) {
			$("span#upw2ChkTxt").text("비밀번호 일치!");
		} else {
			$("span#upw2ChkTxt").text("비밀번호가 다릅니다.");
		}
	});
	
	/* ////////// 아이디 비밀번호 유효성 검사 시작 ////////// */
	$("input#uid").keyup(function(){
		if (idChk()) {
			$("p#idGuideTxt").css("color", "red");
		} else {
			$("p#idGuideTxt").css("color", "black");
		}
	});
	$("input#upw").keyup(function(){
		if (pwChk()) {
			$("p#pwGuideTxt").css("color", "red");
		} else {
			$("p#pwGuideTxt").css("color", "black");
		}
	});
	function idChk() {
		let uid = $("input#uid").val().trim();
		let reg = /[^a-z|A-Z|0-9]/;
		let ToF = reg.test(uid) || $("#uid").val().length < 3;
		return ToF; 
	}
	function pwChk() {
		let upw = $("input#upw").val().trim();
		let reg = /[^a-z|A-Z|0-9|_\-\!@]/;
		let ToF = reg.test(upw) || $("#upw").val().length < 6;
		return ToF;
	}
	/* ////////// 아이디 비밀번호 유효성 검사 끝 ////////// */
	
	/* 이메일 직접입력/선택입력 처리 */
	$("select#selectEmail").change(function(){
		let email = $(this).val();
		$("input#uEmail2").val(email);
	});
	
	/* 회원가입 버튼 submit 처리 */
	$("button#joinSubmitBtn").click(function(){
		
		joinSubmit();
	});
	
	function joinSubmit() {
		
		let uid = $("#uid").val().trim();
		let upw = $("#upw").val().trim();
		let uName = $("#uName").val().trim();
		let uEmail1 = $("#uEmail1").val().trim();
		let uEmail2 = $("#uEmail2").val().trim();
		
		if (uid == "") {
			alert("아이디를 입력해주세요.");
			$("#uid").focus();
		} else if (upw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#upw").focus();
		} else if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
		} else if (uEmail1 == "") {
			alert("이메일을 입력해주세요.");
			$("#uEmail1").focus();
		} else if (uEmail2 == "") {
			alert("이메일을 입력해주세요.");
			$("#uEmail2").focus();
		} else {
			let uEmail = uEmail1 + "@" + uEmail2;
			$("input[name=uEmail]").val(uEmail);
			
			$("form#joinFrm").submit();
			
		}
		
	}
	
	
	/* ////////////////////////////////////////////////////////////////////////////// */
	/* ////////////////// 회원가입 페이지 (/member/join.jsp) 끝 ///////////////// */
	/* ////////////////////////////////////////////////////////////////////////////// */
	
});