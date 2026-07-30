 function maskInput() {
	 

    var key_code = window.event.keyCode;
    var oElement = window.event.srcElement;
	//var key_code = (event.which) ? event.which : window.event.key_code;
	//var key_code = (evt.which) ? evt.which : event.keyCode;
	//var oElement = (event.target) ? event.target : window.event.srcElement;

    if (!window.event.shiftKey && !window.event.ctrlKey && !window.event.altKey) {
        if ((key_code > 47 && key_code < 58) ||
            (key_code > 95 && key_code < 106)) {

            if (key_code > 95)
                 key_code -= (95-47);
            oElement.value = oElement.value;
        } else if(key_code == 8) {
            oElement.value = oElement.value;
        } else if(key_code == 46) {
            oElement.value = oElement.value;
		} else if(key_code == 110 || key_code == 190 || key_code == 17) {
            oElement.value = oElement.value;
        } else if(key_code != 9) {
            event.returnValue = false;
        }

	if(isNaN(oElement.value.replace("$", "").replace(",", ""))){ oElement.value = ''; event.returnValue = false;}else{
	oElement.value =oElement.value.replace("$", "").replace(",", "");
	}
    }
	
}