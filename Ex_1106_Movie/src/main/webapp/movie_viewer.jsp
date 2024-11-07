<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="js/httpRequest.js"></script>
    <script>
        window.onload = function(){
            let url = "movie_list_json.jsp";
            sendRequest(url, null, movieRes, "get");
        }

        function movieRes() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let data = xhr.responseText;
                let json = JSON.parse(data);
                let movie_select = document.getElementById("movie_select");
                
                for (let i = 0; i < json.length; i++) {
                    let option = document.createElement("option");
                    option.innerHTML = json[i].title;
                    option.value = json[i].path;
                    
                    movie_select.appendChild(option);
                }
            }
        }

        function movie_play(){
            let path = document.getElementById("movie_select").value;
            let my_video = document.getElementById("my_video");

            // 유튜브 URL 삽입
            if (path.includes("youtube.com") || path.includes("youtu.be")) {
                let videoId = path.split("v=")[1] || path.split("/").pop();
                my_video.src = "https://www.youtube.com/embed/" + videoId;
            } else {
                my_video.src = path;  // 일반 동영상 파일의 경로인 경우
            }
        }
    </script>
</head>
<body>
    <select id="movie_select" onchange="movie_play()">
        <option value="">:::재생을 위한 영상을 선택:::</option>
    </select>
    
    <br>

    <!-- iframe으로 변경 -->
    <iframe id="my_video" src="" width="320" height="240" frameborder="0" allowfullscreen></iframe>
</body>
</html>
