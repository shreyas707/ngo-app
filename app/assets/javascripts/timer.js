var seconds = 0; // calcuation variable
var hrs = 0; // calcuation variable
var mins = 0; // calcuation variable
var showHrs = ""; // output variable
var showMins = ""; // output variable
var showSeconds = "";  // output variable
var displayTime = "00:00";


function tick(){
	seconds += 1;

	if(seconds >= 60){ // should be changed to 60
		seconds = 0;
		mins += 1;
	}

	if(mins == 60){ // should be changed to 60
		mins = 0;
		hrs += 1;
	}
	showTime();
}

function showTime(){
	if (hrs < 10){
		showHrs = "0" + hrs;
	} else {
		showHrs = hrs;
	}

	if (mins < 10){
		showMins = "0" + mins;	
	}else{
		showMins = mins;
	}

	if (seconds < 10){
		showSeconds = "0" + seconds;
	}else{
		showSeconds = seconds;
	}

	if ((mins < 60) && (hrs > 0)){  // should be changed to 60
		displayTime = showHrs + ":" + showMins + ":" + showSeconds;
	} else{
		displayTime = showMins + ":" + showSeconds;
	} // for better output of the information
	timerHandle.innerHTML = displayTime;
}
startHandle.onclick = function(){
	if(startedTimer){
		intervalHandle = setInterval(tick,1000);
		startedTimer = false;
	} else{
		endHandle.style.display = "none"; 
	}

	startHandle.style.display = "none";
	stopHandle.style.display = "block";
	if (displayTime !== "00:00"){
		startTime = displayTime;
	}
	timer.className = "";
}
endHandle.onclick = function(){
	var confirmEnd = confirm("Are you sure?")
	if(confirmEnd){
		startHandle.style.display = "none";
		myModalButtonHandle.style.display = "none";
	}
}