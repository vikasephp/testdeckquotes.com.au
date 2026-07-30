// JavaScript Document

//<!--
function showTop()
{
	//Show the background overlay and topbox...
document.getElementById('screenoverlay').style.visibility='visible';
document.getElementById('topbox').style.visibility='visible';
document.body.style.overflow = "hidden";
//document.body.scrollTop = oTop;
}

function closeTop()
{
	//Hide the overlay and tobox...
	document.getElementById('screenoverlay').style.visibility='hidden';
	document.getElementById('topbox').style.visibility='hidden';
	 document.body.scroll = "";
     document.body.style.overflow = "";
}
//-->