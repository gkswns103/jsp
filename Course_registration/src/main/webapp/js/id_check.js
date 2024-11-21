let registerBtn = false;
window.registerBtn = registerBtn;

function id_check() {
	let id = document.getElementById("id").value;

	if (id == "") {
		alert("아이디를 입력해주세요");
		return;
	}
	let url = "id_check.do";
	let param = "stuid=" + id;
	sendRequest(url, param, id_chFn, "POST");
}

function id_chFn() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		let data = xhr.responseText.trim();
		if (data === 'no') {
			if (!confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
				return;
			}
			let id = document.getElementById("id");
			id.style.backgroundColor = "#f0f0f0"; // 회색
			id.readOnly = true;
			registerBtn = true;
		}
		else if (data === 'yes') {
			alert("중복된 아이디입니다.");
			return;
		}
	}
}
