/**
 * datepicker
 *
 * @author sui <suibege@gmail.com>
 * @date   2015.1.26
 */
jQuery.fn.extend({
	/**
	 * datepicker
	 *
	 * @desc 샘플 
	 * 
	 * $("#date").datepicker(); //옵션은 선택, 지정하지 않으면 기본값 
 	 * $("#date").datepicker({
 	 *     position: "bottom", //달력이 노출될 포지션, right는 우측에, bottom은 아래쪽에 노출됨
 	 *     dateSpliter: '-', //날짜 포맷 구분기호, 기본값은 '-' (예:2015-01-20)
 	 *     futureOnly: true, //과거 날짜에 색상 입히고 선택 불가 처리, 기본값은 false
 	 * 	   style: [{ //특정 날짜에 스타일 입히고 툴팁 텍스트 띄우기, 기본값 null
 	 *         date: "20150301",
 	 *         color: "#FFF",
 	 *         background_color: "red",
 	 *         tooltip: "삼일절"
 	 *     }, {
 	 * 	       date: "20150505",
 	 *         color: "red"
 	 *     }]
 	 * });
	 */
	datepicker: function(option) {
		var setting = {
			position: "right",
			dateSpliter: '-', 
			style: null,
			futureOnly: false
		};

		if (option && typeof(option.position) != "undefined") {
			setting.position = option.position;
		}
		if (option && typeof(option.dateSpliter) != "undefined") {
			setting.dateSpliter = option.dateSpliter;
		}
		if (option && typeof(option.futureOnly) != "undefined") {
			setting.futureOnly = option.futureOnly;
		}
		if (option && typeof(option.style) != "undefined") {
			setting.style = option.style;
		}
		
		$("body").click(function() {
			$(".datepicker").remove();
		});

		//클릭 이벤트
		$(this).click(function(e) {
			e.stopPropagation();

			var p = $(this).position();

			if (setting.position == "right") {
				setting.top = p.top + parseInt($(this).css("margin-top").replace("px", ""));
				setting.left = p.left + $(this).outerWidth() + 5;
			}
			else {
				setting.top = p.top + parseInt($(this).css("margin-top").replace("px", "")) + $(this).outerHeight() + 5;
				setting.left = p.left;
			}
			
			drawCalendar(this);	
		});
		
		//달력 그리기
		function drawCalendar(obj, view_date) {
			//전에 그려진 달력 지움
			$(".datepicker").remove();
			
			var table =	$("<table>").append(
				$("<thead>").append(
					$("<tr>")
						.append($("<th>").text("일"))
						.append($("<th>").text("월"))
						.append($("<th>").text("화"))
						.append($("<th>").text("수"))
						.append($("<th>").text("목"))
						.append($("<th>").text("금"))
						.append($("<th>").text("토"))
				)
			);
			
			if (!view_date) {
				view_date = new Date();
			}

			//달력의 시작일
			var first_date = new Date(view_date.getFullYear(), view_date.getMonth(), 1);
			var start_date = new Date(first_date.getTime());

			//시작일의 요일
			var first_day = start_date.getDay();

			//시작일이 일요일이 되도록 조정
			start_date.setDate(start_date.getDate() - first_day);

			//달력의 마지막일
			var end_date = new Date(view_date.getFullYear(), view_date.getMonth() + 1, 0);
			
        	//달력에 노출될 날짜 수 (7의 배수)
        	var day_total = end_date.getDate() + first_day;
        	var day_supply = 7 - (end_date.getDate() + first_day) % 7;
        	if (day_supply < 7) {
        		day_total += day_supply;
        	}

	        var tbody = $("<tbody>");
        	
        	//달력 배열 만듬
        	var today = new Date();
			var date = new Date(start_date.getTime());
	        var calendar = [];
	        for (var i = 0; i < day_total; i++) {
	        	calendar[i] = {
	        		date: date.getFullYear() + (date.getMonth() + 1).pad(2) + date.getDate().pad(2),
	        		text: date.getDate()
        		}
        		;
	        	//과거 날짜 처리
	        	if (setting.futureOnly === true && date.toYmdDateString() < today.toYmdDateString()) {
	        		calendar[i].past_day = true;	
	        	} 	

	            date.setDate(date.getDate() + 1);
	        }
	        
    		var str_compare = view_date.getFullYear() + (view_date.getMonth() + 1).pad(2);
    		var idx_calendar;
    		if (setting.style) {
    			if (setting.style.length) {
		        	$.each(setting.style, function(i, b) {
						if (b.date.substring(0, 6) == str_compare) {
							idx_calendar = first_day + parseInt(b.date.substring(6, 8)) - 1;
							calendar[idx_calendar].color = b.color;
							calendar[idx_calendar].background_color = b.background_color;
							calendar[idx_calendar].tooltip = b.tooltip;
						}        		
		        	});
    			}
    			else {
					if (setting.style.date.substring(0, 6) == str_compare) {
						idx_calendar = first_day + parseInt(setting.style.date.substring(6, 8)) - 1;
						calendar[idx_calendar].color = setting.style.color;
						calendar[idx_calendar].background_color = setting.style.background_color;
						calendar[idx_calendar].tooltip = setting.style.tooltip;
					}        		
	        	}
			}
			        	
	        //클릭 이벤트를 만들기 위해 배열을 가지고 each문을 돌림
	        var tr, td;
	        $.each(calendar, function(i, c) {
	        	if (i % 7 == 0) {
	        		tr = $("<tr>");
	        	}
	        	
	        	td = $("<td>").text(c.text);
    			
    			if (c.past_day === true) {
    				td.addClass("past_day");
    			}
    			else {
		        	td.click(function() {
	    				$(obj).val(c.date.datespliter(setting.dateSpliter));
	    				$(".datepicker").remove();
	    			});    				
    			}
    			
    			if (c.color) {
    				td.css("color", c.color);
				}

    			if (c.background_color) {
    				td.css("background-color", c.background_color);
				}
				
				if (c.tooltip) {
					td.attr("title", c.tooltip);
    			}
    			
	        	tr.append(td);
	        	
	        	if (i % 7 == 6) {
	        		tbody.append(tr);
	        	}
	        });
			table.append(tbody);

			var div = $("<div>").addClass("datepicker").css({
				top: setting.top,
				left: setting.left			
			}).append(
				$("<div>").append(
					$("<span>").text(view_date.getFullYear() + "년 ")
				).append(
					$("<a>").text("<").attr("href", "#").click(function() {
						var move_date = new Date(view_date.getTime());
						move_date.setMonth(move_date.getMonth() - 1);
						drawCalendar(obj, move_date);
						
						return false;
					})
				).append(
					$("<span>").text(" " + (view_date.getMonth() + 1) + "월 ")
				).append(
					$("<a>").text(">").attr("href", "#").click(function() {
						var move_date = new Date(view_date.getTime());
						move_date.setMonth(move_date.getMonth() + 1);
						drawCalendar(obj, move_date);
						
						return false;
					})
				)
			).append(table);

			$(obj).after(div);
			
			$(".datepicker").click(function(e) {
				e.stopPropagation();
			});
		}
	}
});

Number.prototype.pad = function(len) {
	return ('0' + this).slice(-len);
};

//YYYYMMDD -> YYYY-MM-DD
String.prototype.datespliter = function(datespliter) {
	return this.substring(0, 4) + datespliter + this.substring(4, 6) + datespliter + this.substring(6, 8);
};

//Date 오브젝트를 YYYY.MM.DD 형태로 반환
Date.prototype.toYmdDateString = function() {
	return this.getFullYear().toString() + (this.getMonth() + 1).pad(2) + this.getDate().pad(2);
};