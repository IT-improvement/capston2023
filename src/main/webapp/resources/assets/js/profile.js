/**
 * 
 */
	var dom = document.getElementById('container');
		var myChart = echarts.init(dom, null, {
			renderer : 'canvas',
			useDirtyRect : false
		});
		var app = {};

		var option;

		option = {
			title : {
				text : '일주일 공부 차트'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '그 외', 'C#', 'MYSql', 'JAVA', '전체 공부량' ]
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '월', '화', '수', '목', '금', '토', '일' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '그 외',
				type : 'line',
				stack : 'Total',
				data : [ 5, 7, 2, 3, 1 ]
			}, {
				name : 'C#',
				type : 'line',
				stack : 'Total',
				data : [ 2, 10, 15, 23, 21 ]
			}, {
				name : 'MYSql',
				type : 'line',
				stack : 'Total',
				data : [ 10, 5, 23, 35, 56 ]
			}, {
				name : 'JAVA',
				type : 'line',
				stack : 'Total',
				data : [ 12, 35, 67, 78, 23 ]
			}, {
				name : '전체 공부량',
				type : 'line',
				stack : 'Total',
				data : [ 45, 67, 87, 96, 123 ]
			} ]
		};

		if (option && typeof option === 'object') {
			myChart.setOption(option);
		}

		window.addEventListener('resize', myChart.resize);

function openIconSelection() {
			var iconWindow = window.open('', '메달 부여 조건', 'width=400,height=300');

			iconWindow.document.write(`
			  <html>
			  <head>
				<style>
				  img {
					width: 50px;
				  }
				</style>
			  </head>
			  <body>
				<h2>아이콘 선택</h2>
				
				<div class="bronze-font">브론즈 메달 : <img src="../assets/img/bronze-medal.png" alt="브론즈 메달" onclick="selectIcon(iconType)"></div>
				<style>.bronze-font{font-size: 25px;}</style> 기본 메달</br> 
				<div class="silver-font">실버 메달 : <img src="../assets/img/silver-medal.png" alt="실버 메달" onclick="selectIcon(iconType)"></div>
				<style>.silver-font{font-size: 25px;}</style> 10문제 이상</br>
				<div class="gold-font">골드 메달 : <img src="../assets/img/gold-medal.png" alt="골드 메달" onclick="selectIcon(iconType)"></div>
				<style>.gold-font{font-size: 25px;}</style> 30문제 이상</br>
				<div class="platinum-font">플래티넘 메달 : <img src="../assets/img/platinum-medal.png" alt="플래티넘 메달" onclick="selectIcon(iconType)"></div>
				<style>.platinum-font{font-size: 25px;}</style> 70문제 이상</br>
				<div class="diamond-font">다이아몬드 메달 : <img src="../assets/img/diamond-medal.png" alt="다이아몬드 메달" onclick="selectIcon(iconType)"></div>
				<style>.diamond-font{font-size: 25px;}</style> 150문제 이상
			  </body>
			  </html>
			`);

		  
			iconWindow.document.close();
		  }
		  
		  
function openButtonClick() {
  // 작은 창을 열기 위한 코드 작성
  window.open("PwdChangeform.jsp", "Password Change", "width=400,height=300");
  }
  
 