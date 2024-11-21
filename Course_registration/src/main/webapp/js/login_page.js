const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");

const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
	container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
	container.classList.add("right-panel-active");
});

// URL 파라미터에서 오류 메시지 추출
const urlParams = new URLSearchParams(window.location.search);
const errorMessage = urlParams.get('error');
// 오류 메시지가 있으면 화면에 표시
if (errorMessage == "errid") {
	alert("잘못된 아이디입니다.");
}
else if (errorMessage == "errpwd") {
	alert("잘못된 비밀번호입니다.");
}


function register(f) {
	if (registerBtn) {
		// 아이디 확인함
		
		let url = "register.do";
		let param = "id=" + f.id.value +
					"&pwd=" + f.pwd.value +
					"&name=" + f.name.value +
					"&major=" + f.major.value +
					"&grade=" + f.grade.value;
		
		sendRequest(url,param,registerFn,"POST");
	}
	else {
		alert("아이디중복체크를 해주세요");
		return;
	}
}

function registerFn(){
	if (xhr.readyState == 4 && xhr.status == 200) {
			let data = xhr.responseText.trim();
			if(data == "yes"){
				alert("회원가입이 완료되었습니다.");
				location.href='login_register.jsp';
			}
			else{
				alert("회원가입에 실패하였습니다.");
				return;
			}
		}
}