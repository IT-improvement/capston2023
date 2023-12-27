function handleButtonClick(vNum, url) {
    increasePlayNum(vNum); // 첫 번째 동작: increasePlayNum 함수 호출
    window.location.href = url; // 두 번째 동작: 해당 URL로 이동
  }

  function increasePlayNum(vNum) {
    var playNumElement = document.getElementById("playNum" + vNum);
    var currentPlayNum = parseInt(playNumElement.innerHTML);
    playNumElement.innerHTML = currentPlayNum + 1;
  }