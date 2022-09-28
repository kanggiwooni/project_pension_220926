$(function(){
	
	/* //////////////////////// 약관 동의 페이지 (/member/joinAgreement.jsp) 시작 //////////////////////// */
	
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
				alert("[필수] 이용약관에 동의해주세요");
			} else {
				alert("[필수] 개인정보 수집 및 이용에 동의해주세요");
			}
		}
	});
	
	/* //////////////////////// 약관 동의 페이지 (/member/joinAgreement.jsp) 끝 //////////////////////// */
	
	
	
	
	
	/* //////////////////////// 회원가입 페이지 (/member/join.jsp) 시작 //////////////////////// */
	
	/* 이메일 직접입력/선택입력 처리 */
	$("select#selectEmail").change(function(){
		let email = $(this).val();
		$("input#uEmail2").val(email);
	});
	
	/* 회원가입 버튼 submit 처리 */
	$("button#joinSubmitBtn").click(function(){
		
		/* 이메일 문자 합치기 */
		let uEmail1 = $("input#uEmail1").val().trim();
		let uEmail2 = $("input#uEmail2").val().trim();
		let uEmail = uEmail1 + "@" + uEmail2;
		$("input[name=uEmail]").val(uEmail);
		
		$("form#joinFrm").submit();
	});
	
	/* 비밀번호 확인 처리 (작업중) */
	$("input#upw2").text().change(function(){
		/*if ($(this).text() != $("input[name=upw]").text()) {
			$("span#upw2ChkTxt").text("비밀번호가 다릅니다");
		} else {
			$("span#upw2ChkTxt").text("");
		}*/
	});
	
	
	/* //////////////////////// 회원가입 페이지 (/member/join.jsp) 끝 //////////////////////// */
	
});