document.addEventListener("DOMContentLoaded", function() {
	let time = 30 * 60 //1시간

	const timerInterval = setInterval(function() {
		let minutes = Math.floor(time / 60);
		let seconds = time % 60;

		// 초 단위가 한 자리일 경우 앞에 '0'을 추가
		seconds = seconds < 10 ? '0' + seconds : seconds;
		document.getElementById("timer").innerText = minutes + ":" + seconds;
 	
		time--;

		// 시간이 0이 되면 타이머를 멈추고 알림 표시
		if (time < 0) {
			clearInterval(timerInterval);
			alert("페이지가 만료되었습니다.");
			location.href = "logout.do";
		}
	}, 1000); // 1초마다 업데이트
});