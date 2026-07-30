<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<style>
	td {
		font-size: 13px;
	}
</style>
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
	function toggleDiv(divId) {
		$("#" + divId).toggle();
	}
</script>
<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '95%',
			'height': '95%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
			'speedOut': 300,
			'overlayShow': true,
			'hideOnOverlayClick': false,
			'hideOnContentClick': false,
			'type': 'iframe',
			'scrolling': 'yes'
		});
	});
	function target_popup(form) {
		window.open('', 'formpopup', 'width=850,height=600,resizeable,scrollbars');
		form.target = 'formpopup';
	}
	function target_popup_IE() {
		window.open('', 'formpopup', 'width=850,height=600,resizeable,scrollbars');
		document.detail.target = 'formpopup';
		document.detail.action = '{{$BASE_URL}}{{$XFA.buyer_qa_email}}/' + Math.random();
		document.detail.submit();
	}
</script>
<script type="text/javascript">
	animatedcollapse.addDiv('michael', 'fade=1')
	animatedcollapse.addDiv('michael1', 'fade=1')
	animatedcollapse.ontoggle = function ($, divobj, state) { }
	animatedcollapse.init()
	function setvalue(bus_id, bus_name) {
		document.getElementById("txtCustomerId").value = bus_name;
		document.getElementById("txtbusId").value = bus_id;
		document.getElementById('divCustomersInfo').style.visibility = 'hidden';
	}
	function closediv() { document.getElementById('divCustomersInfo').style.visibility = 'hidden'; }
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
	function callBoxFancy(my_href) {
		var j1 = document.getElementById("hiddenclicker");
		j1.href = my_href;
		$('#hiddenclicker').trigger('click');
	}
	function modelview(id) {
		var viewurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'quickView' + '&bcust_id=' + id + "&random=" + Math.random();
		$(document).ready(function () {
			$.fancybox({
				'width': '89%',
				'height': '80%',
				'autoScale': true,
				'type': 'iframe',
				'href': viewurl,
				'transitionIn': 'fade',
				'transitionOut': 'fade',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'hideOnOverlayClick': false,
				'hideOnContentClick': false
			});
		});
	}
	function modelwindow(url, width, hight, scrolling) {
		$(document).ready(function () {
			$.fancybox({
				'width': width,
				'height': hight,
				'autoScale': true,
				'type': 'iframe',
				'href': url,
				'transitionIn': 'elastic',
				'transitionOut': 'elastic',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'hideOnOverlayClick': false,
				'scrolling': 'yes',
				'hideOnContentClick': false
			});
		});
	}
	function seller_tasks_email(bid, id) {
		var viewurl = "{{$BASE_URL}}business.taskemails/bid/" + bid + "/bt_id/" + id + "/random/" + Math.random();
		$(document).ready(function () {
			$.fancybox({
				'width': '80%',
				'height': '80%',
				'autoScale': true,
				'type': 'iframe',
				'href': viewurl,
				'transitionIn': 'fade',
				'transitionOut': 'fade',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'hideOnOverlayClick': false,
				'scrolling': 'yes',
				'hideOnContentClick': false
			});
		});
	}
	function showFancybox(html) {
		$.fancybox('',
			{
				'content': '<h1>Task Instructions:</h1><br><p>' + html + '</p>',
				'autoDimensions': false,
				'width': 550,
				'height': 550,
				'transitionIn': 'elastic',
				'transitionOut': 'elastic',
				'speedIn': 600,
				'speedOut': 200,
				'overlayShow': false,
				'centerOnScroll': true
			}
		);
	}
	//
	function showweb(a) {
		var str = a.substr(0, 3);
		if (str == 'www') {
			a = "http://" + a;
		}
		window.open(a);
	}
</script>
<script type="text/javascript">
	var url = "{{$BASE_URL}}{{$XFA.home}}?bsn_name="; // The server-side script
	var getdateurl = "{{$BASE_URL}}{{$XFA.date}}?b_id=";
	var getlisturl = "{{$BASE_URL}}{{$XFA.listdata}}?bus_id="; // The server-side script
	var getfileslisturl = "{{$BASE_URL}}{{$XFA.fileslistdata}}?bus_id="; // The server-side script
	var getdetailurl = "{{$BASE_URL}}{{$XFA.sellerdeatildata}}?bs_id="; // The server-side script
	var getdeleteurl = "{{$BASE_URL}}{{$XFA.delete_seller}}?bs_id=";
	var getdeletefileurl = "{{$BASE_URL}}{{$XFA.delete_files}}?bf_id=";
	var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
	var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
	function popup(url) {
		params = 'width=' + screen.width / 1.5;
		params += ', height=' + screen.height / 1.5;
		params += ', top=0, left=0'
		params += ', scrolling=yes'
		params += ', scrollbars=yes'
		params += ', fullscreen=no';
		newwin = window.open(url, 'windowname4', params);
		if (window.focus) { newwin.focus() }
		return false;
	}
	function handleHttpResponsewin() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					closeTop();
					popup('{{$BASE_URL}}{{$XFA.taskemail}}');
				}
			}
		}
	}
	function send_email() {
		var sId = document.getElementById("bus_id").value;
		curl2 = commonurl + "send_email" + '&busid=' + escape(sId) + "&random=" + Math.random();
		http.open("GET", curl2, true);
		http.onreadystatechange = handleHttpResponsewin;
		http.send(null);
		showTop();
	}
	function handleHttpResponsedelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestsellerInfo(1);
					toggleLayernew('businesscistenquiry', 'addcust');
					closeTop();
				}
			}
		}
	}
	function requestsellerDelete(b) {
		var sId = b;
		http.open("GET", getdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponsedelete;
		http.send(null);
		showTop();
	}
	var getdocsdeleteurl = "{{$BASE_URL}}{{$XFA.delete_docs}}?bs_id=";
	function handleHttpResponsedocsdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestbusdocsInfo(1);
					closeTop();
				}
			}
		}
	}
	function requestdocsDelete(b) {
		var sId = b;
		http.open("GET", getdocsdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponsedocsdelete;
		http.send(null);
		showTop();
	}
	<!--enquiry delete-->
	//var getenqdeleteurl = "{{$BASE_URL}}{{$XFA.delete_enq}}?buse_id=";
	var getenqdeleteurl = "{{$BASE_URL}}{{$XFA.delete_msteam}}?ms_id=";
	var getalertdeleteurl = "{{$BASE_URL}}{{$XFA.delete_alert}}?buse_id=";
	var getproposalalertdeleteurl = "{{$BASE_URL}}{{$XFA.delete_proposalalert}}?buse_id=";
	var getrmdeleteurl = "{{$BASE_URL}}{{$XFA.delete_recorded_meeting}}?rm_id=";
	function handleHttpResponseenqudelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestbusenquiryInfo(1);
					closeTop();
				}
			}
		}
	}
	function handleHttpResponsermdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestrecordedmeetingInfo(1);
					closeTop();
				}
			}
		}
	}
	function handleHttpResponsealertdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestbusalertInfo(1);
					closeTop();
				}
			}
		}
	}
	function handleHttpResponseproposalalertdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestproposalalertInfo(1);
					closeTop();
				}
			}
		}
	}
	function requestenqDelete(b) {
		var sId = b;
		http.open("GET", getenqdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponseenqudelete;
		http.send(null);
		showTop();
	}
	function requestrmDelete(b) {
		var sId = b;
		http.open("GET", getrmdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponsermdelete;
		http.send(null);
		showTop();
	}
	function requestalertDelete(b) {
		var sId = b;
		http.open("GET", getalertdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponsealertdelete;
		http.send(null);
		showTop();
	}
	function requestproposalalertDelete(b) {
		var sId = b;
		http.open("GET", getproposalalertdeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponseproposalalertdelete;
		http.send(null);
		showTop();
	}
		<!--enquiry delete -->
			<!--QA delete -->
		var getqadeleteurl = "{{$BASE_URL}}{{$XFA.delete_qa}}?bqa_id=";
	function handleHttpResponseqadelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					requestquestionInfo2(1);
					closeTop();
				}
			}
		}
	}
	function requestqaDelete(b) {
		var sId = b;
		http.open("GET", getqadeleteurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponseqadelete;
		http.send(null);
		showTop();
	}
		<!--QA delete -->
		function handleHttpResponsefiledelete() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var results = http.responseText;
					if (results != '') {
						requestbusfilesInfo(1);
						toggleLayernew('divimageadd', 'addfile');
						closeTop();
					}
				}
			}
		}
	function requestfileDelete(b) {
		var sId = b;
		http.open("GET", getdeletefileurl + escape(sId), true);
		http.onreadystatechange = handleHttpResponsefiledelete;
		http.send(null);
		showTop();
	}
	function handleHttpCustResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				document.getElementById('divbusinesscustomreInfoToReturn').innerHTML = results;
				if (results != '') {
					document.getElementById('divbusinesscustomreInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function requestsellerInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var getSuburb = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showSeller' + '&bus_id=' + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", getSuburb, true);
			http.onreadystatechange = handleHttpCustResponselist;
			http.send(null);
			showTop();
		}
	}
	function handleHttpfilesResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				document.getElementById('divbusinessfileInfoToReturn').innerHTML = results;
				if (results != '') {
					document.getElementById('divbusinessfileInfoToReturn').style.visibility = 'visible';
					closeTop(); return false;
				}
			}
		}
	}
	function requestbusfilesInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			curl22 = getfileslisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl22, true);
			http.onreadystatechange = handleHttpfilesResponselist;
			http.send(null);
			showTop();
		}
	}
	var getenquirylisturl = "{{$BASE_URL}}{{$XFA.msteam_list}}?bs_id="; // The server-side script
	var getvideolisturl = "{{$BASE_URL}}{{$XFA.videolinks_list}}?bs_id="; // The server-side script
	var getalertlisturl = "{{$BASE_URL}}{{$XFA.businessalert_list}}?bs_id="; // The server-side script
	var getproposalalertlisturl = "{{$BASE_URL}}{{$XFA.proposalalert_list}}?bs_id="; // The server-side script
	var getrecordedmeeturl = "{{$BASE_URL}}{{$XFA.meeting_recording_list}}?bs_id="; // The server-side script
	function handleHttpenquiryResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					document.getElementById('divbusinessenquiryInfoToReturn').innerHTML = results;
					document.getElementById('divbusinessenquiryInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function handleHttprecordedmeetinglist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					document.getElementById('divrecmeettInfoToReturn').innerHTML = results;
					document.getElementById('divrecmeettInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function handleHttpalertResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					document.getElementById('divbusinessalertInfoToReturn').innerHTML = results;
					document.getElementById('divbusinessalertInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function handleHttpProposalalertResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					document.getElementById('divproposalalertInfoToReturn').innerHTML = results;
					document.getElementById('divproposalalertInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function requestbusenquiryInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var curl24 = getenquirylisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpenquiryResponselist;
			http.send(null);
			showTop();
		}
	}
	function requestrecordedmeetingInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var curl24 = getrecordedmeeturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttprecordedmeetinglist;
			http.send(null);
			showTop();
		}
	}
	function requestbusalertInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var curl24 = getalertlisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpalertResponselist;
			http.send(null);
			showTop();
		}
	}
	function requestproposalalertInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var curl24 = getproposalalertlisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			//alert(curl24);
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpProposalalertResponselist;
			http.send(null);
			showTop();
		}
	}
	var getpms = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getpms' + "&bus_id="; // The server-side script
	function handleHttpmoneyResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {
					document.getElementById('divbusinessmoneyInfoToReturn').innerHTML = results;
					document.getElementById('divbusinessmoneyInfoToReturn').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function requestmoneyInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			var curl24 = getpms + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpmoneyResponselist;
			http.send(null);
			showTop();
		}
	}
< !--E Log function Start-->
var geteloglisturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showelog' + "&bus_id="; // The server-side script
	function handleHttpelogResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results) {
					document.getElementById('divtruelog').innerHTML = results;
					document.getElementById('divtruelog').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function requestbuselogInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			curl24 = geteloglisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpelogResponselist;
			http.send(null);
			showTop();
		}
	}
	function responseElogdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				if (result) {
					requestbuselogInfo(1);
					closeTop();
				}
			}
		}
	}
	function requestelogDelete(id) {
		if (id) {
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showelogdelete' + '&id=' + id + "&random=" + Math.random();
			alert(commonurl);
			http.open('GET', commonurl, true);
			http.onreadystatechange = responseElogdelete;
			http.send(null);
			showTop();
		}
	}
	function responsepmsdelete() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				if (result) {
					requestmoneyInfo(1);
					closeTop();
				}
			}
		}
	}
	function requestpmsDelete(id) {
		if (id) {
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'deletepms' + '&pm_id=' + id + "&random=" + Math.random();
			http.open('GET', commonurl, true);
			http.onreadystatechange = responsepmsdelete;
			http.send(null);
			showTop();
		}
	}		
< !--E Log function End-->
	var getquestionlisturl = "{{$BASE_URL}}{{$XFA.businessqa_list}}?bs_id="; // The server-side script
	function handleHttpqaResponselist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results) {
					document.getElementById('divqalist').innerHTML = results;
					document.getElementById('divqalist').style.visibility = 'visible';
					closeTop();
				}
			}
		}
	}
	function requestquestionInfo(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			curl24 = getquestionlisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpqaResponselist;
			http.send(null);
			showTop();
		}
	}
	function requestquestionInfo2(pagenum) {
		var sId = document.getElementById("bus_id").value;
		if (sId > 0) {
			curl24 = getquestionlisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
			document.getElementById('qaIframe_list').style.display = 'block';
			document.getElementById('qaIframe_list').style.height = '300px';
			document.getElementById('qaIframe_list').style.border = '1px solid #999999';
			document.getElementById('qaIframe_list').src = curl24;
			showTop();
		}
	}
//qaIframe_list	
< !--Begin Ajax Comman Functions-- >
	< !--Ajax common Url-- >
		var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
	< !--Ajax common Url-- >
	< !--Begin Current date / time-- >
		function handleHttpResponcesetcur_date() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = ltrim(http.responseText)
					if (result != '') {
						var new_array = new Array();
						new_array = result.split('|');
						var v1 = ltrim(new_array[0]);
						var v2 = ltrim(new_array[1]);
						var v3 = ltrim(new_array[2]);
						var v4 = ltrim(new_array[3]);
						document.getElementById(v1).value = v2;
						document.getElementById(v3).value = v4;
						closeTop();
					}
				}
			}
		}
	function setcur_date(a, b, c) {
		var getdateurl = getcurrenturl + escape(a) + "&b=" + escape(b) + "&c=" + escape(c) + "&random=" + Math.random();
		http.open("GET", getdateurl, true);
		http.onreadystatechange = handleHttpResponcesetcur_date;
		http.send(null);
		showTop();
	}
	function handleHttpResponseSetstates() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var resultStates = ltrim(http.responseText);
				if (resultStates != '') {
					document.getElementById("listofallbusinesses").style.visibility = 'visible';
					document.getElementById('listofallbusinesses').innerHTML = resultStates;
				}
				else {
					document.getElementById('listofallbusinesses').style.visibility = 'hidden';
					document.getElementById('listofallbusinesses').innerHTML = '';
				}
			}
		}
	}
	function getstates() {
		var suburbValue = document.getElementById('suburb').value;
		var getSuburb = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'subhurb' + "&suburbValue=" + escape(suburbValue) + "&random=" + Math.random();
		http.open('GET', getSuburb, true);
		http.onreadystatechange = handleHttpResponseSetstates;
		http.send(null);
	}
	function setState(a, b, c, d) {
		var a = ltrim(a);
		var b = ltrim(b);
		var c = ltrim(c);
		var d = ltrim(d);
		document.getElementById('suburb').value = a;
		document.getElementById('state').value = b;
		document.getElementById('postcode').value = c;
		document.getElementById('suburb_id').value = d;
		document.getElementById("listofallbusinesses").style.visibility = 'hidden';
		document.getElementById('listofallbusinesses').innerHTML = '';
	}
< !--End get State-- >
< !--End Ajax Comman Functions-- >
< !----------------- RD - Business Tasks Setcion starts here---------------->
< !--Begin Business Tasks-- >
		function responseAddTask() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var resultTask = http.responseText;
					document.getElementById('taskmsg').innerHTML = resultTask;
					requestAllTasks();
					closeTop();
				}
			}
		}
	function requestAddTask() {
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_status_id').value;
		if (bus_id == '') {
			document.getElementById('taskmsg').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else if (taskStatusId == '0') {
			document.getElementById('taskmsg').innerHTML = "Please select Task Status to be added.";
			return false;
		}
		else {
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addStatusTask' + "&bus_id=" + escape(bus_id) + "&taskStatusId=" + escape(taskStatusId) + "&random=" + Math.random();
			http.open("GET", addStatusTaskUrl, true);
			http.onreadystatechange = responseAddTask;
			http.send(null);
			showTop();
		}
	}
< !--End Business Tasks-- >
< !--Add Proposal Task Start-- >
		function responseAddTaskProposal() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var resultTask = http.responseText;
					document.getElementById('taskmsgproposal').innerHTML = resultTask;
					requestAllTasksProposal();
					closeTop();
				}
			}
		}
	function requestAddTaskProposal(n) {
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_status_id').value;
		if (bus_id == '') {
			document.getElementById('taskmsgproposal').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else {
			var addStatusTaskUrl = "{{$BASE_URL}}business.common2?a_req=" + 'addStatusTask' + "&bus_id=" + escape(bus_id) + '&tasknum=' + n + "&random=" + Math.random();
			http.open("GET", addStatusTaskUrl, true);
			http.onreadystatechange = responseAddTask;
			http.send(null);
			showTop();
		}
	}
< !--Add Proposal Task End-- >
< !--Begin Fetch All project type tasks -->
		function responseAllptypeTasks() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('AllptypeTaskDiv').innerHTML = result;
					closeTop();
					requestCountptypeTask();
				}
			}
		}
	function requestAllptypeTasks(pagenum) {
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_types_id = document.getElementById('bt_task_types_id').value;
		if (bus_id > 0) {
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskpStatus.length;
			var currentTaskStatus;
			for (var i = 0; i < len; i++) {
				if (document.detail.taskpStatus[i].checked) {
					currentTaskStatus = document.detail.taskpStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllptypeTasks' + '&bus_id=' + bus_id + '&bt_task_types_id=' + bt_task_types_id + "&random=" + Math.random();
			if (currentTaskStatus == '0' || currentTaskStatus == '1') {
				addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			ptperpage = document.getElementById('ptperpage').value;
			addStatusTaskUrl = addStatusTaskUrl + '&ptperpage=' + ptperpage;
			if (pagenum > 0) {
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&ptperpage=' + perpage + "&random=" + Math.random();
			}
			http.open('GET', addStatusTaskUrl, true);
			http.onreadystatechange = responseAllptypeTasks;
			http.send(null);
			showTop();
		}
	}
< !--End Fetch All tasks-- >	
< !--Begin - mark task as done -->
		function responseptypeTaskDone() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('tasktypemsg').innerHTML = result;
					requestAllptypeTasks();
				}
			}
		}
	function requestptypeTaskDone(a) {
		var bt_id = a;
		if (bt_id > 0) {
			if (!confirm("Are you sure want to Mark the task as DONE??")) {
				return false;
			}
			else {
				var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'markptypeTaskDone' + '&bt_id=' + bt_id + "&random=" + Math.random();
				http.open('GET', addStatusTaskUrl, true);
				http.onreadystatechange = responseptypeTaskDone;
				http.send(null);
			}
		}
	}
< !--End - Mark task as Done -->	
< !--Begin ReEdit the task manually-- >
		function responseptypeTaskEdit() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('editptypeTaskDiv').innerHTML = result;
					requestCountptypeTask();
					requestAllptypeTasks();
				}
			}
		}
	function requestptypeTaskEdit(a, b) {
		var taskId = a;
		var taskAction = b;
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editptypeTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();
		if (taskAction == 'SaveEdit') {
			if (document.getElementById('bt_complete').checked) {
				var complete = 1;
			}
			else {
				var complete = 0;
			}
			var comment = document.getElementById('bt_comment').value;
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&random=" + Math.random();
		}
		if (taskAction == 'CloseEdit') {
			document.getElementById('editptypeTaskDiv').innerHTML = '';
		}
		http.open('GET', commonUrl, true);
		http.onreadystatechange = responseptypeTaskEdit;
		http.send(null);
	}
< !--Enf ReEdit the task manually-- >	
< !--Begin Project Tasks-- >
		function responseAddTypeTask() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var resultTask = http.responseText;
					document.getElementById('tasktypemsg').innerHTML = resultTask;
					requestAllptypeTasks();
					closeTop();
				}
			}
		}
	function requestAddtypeTask() {
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_types_id').value;
		if (bus_id == '') {
			document.getElementById('tasktypemsg').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else if (taskStatusId == '0') {
			document.getElementById('tasktypemsg').innerHTML = "Please select task status to be added.";
			return false;
		}
		else {
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addTypeTask' + "&bus_id=" + escape(bus_id) + "&taskStatusId=" + escape(taskStatusId) + "&random=" + Math.random();
			http.open("GET", addStatusTaskUrl, true);
			http.onreadystatechange = responseAddTypeTask;
			http.send(null);
			showTop();
		}
	}
< !--End Project Tasks-- >	
< !--Begin Count tasks-- >
		function responseCountTask() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('total_task').innerHTML = result;
				}
			}
		}
	function requestCountTask() {
		var bus_id = document.getElementById('bus_id').value;
		if (bus_id > 0) {
			var countTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'countTask' + '&bus_id=' + bus_id + "&random=" + Math.random();
			http.open('GET', countTaskUrl, true);
			http.onreadystatechange = responseCountTask;
			http.send(null);
		}
	}
< !--End Count tasks-- >	
< !--Begin project types Count tasks-- >
		function responseCountptypeTask() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('total_ptypetask').innerHTML = result;
				}
			}
		}
	function requestCountptypeTask() {
		var bus_id = document.getElementById('bus_id').value;
		if (bus_id > 0) {
			var countTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'countptypeTask' + '&bus_id=' + bus_id + "&random=" + Math.random();
			http.open('GET', countTaskUrl, true);
			http.onreadystatechange = responseCountptypeTask;
			http.send(null);
		}
	}
< !--End project types Count tasks-- >		
< !--Begin Fetch All tasks-- >
		function responseAllTasks() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('AllTaskDiv').innerHTML = result;
					closeTop();
					requestCountTask();
				}
			}
		}
	function responseAllTasksProposal1() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal1').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal2() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal2').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal3() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal3').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal4() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal4').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal5() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal5').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal6() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal6').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal7() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal7').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal8() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal8').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal9() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal9').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal10() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal10').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal11() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal11').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal12() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal12').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal13() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal13').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal14() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal14').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal15() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal15').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal16() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal16').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal17() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal17').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal18() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal18').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal19() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal19').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function responseAllTasksProposal20() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('AllTaskDivProposal20').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	function requestAllTasks(pagenum) {
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_status_id = document.getElementById('bt_task_status_id').value;
		if (bus_id > 0) {
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskStatus.length;
			var currentTaskStatus;
			for (var i = 0; i < len; i++) {
				if (document.detail.taskStatus[i].checked) {
					currentTaskStatus = document.detail.taskStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllTasks' + '&bus_id=' + bus_id + '&bt_task_status_id=' + bt_task_status_id + "&random=" + Math.random();
			if (currentTaskStatus == '0' || currentTaskStatus == '1') {
				addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			perpage = document.getElementById('perpage').value;
			addStatusTaskUrl = addStatusTaskUrl + '&perpage=' + perpage;
			if (pagenum > 0) {
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&perpage=' + perpage + "&random=" + Math.random();
			}
			http.open('GET', addStatusTaskUrl, true);
			http.onreadystatechange = responseAllTasks;
			http.send(null);
			showTop();
		}
	}
	function requestAllTasksProposal(pagenum, n) {
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_status_id = document.getElementById('bt_task_status_id').value;
		if (bus_id > 0) {
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskStatus.length;
			var currentTaskStatus;
			for (var i = 0; i < len; i++) {
				if (document.detail.taskStatus[i].checked) {
					currentTaskStatus = document.detail.taskStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllTasksProposal' + '&bus_id=' + bus_id + '&bt_task_list_number=' + n + "&random=" + Math.random();
			if (currentTaskStatus == '0' || currentTaskStatus == '1') {
				addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			//perpage = document.getElementById('perpage').value;
			perpage = 20;
			addStatusTaskUrl = addStatusTaskUrl + '&perpage=' + perpage;
			if (pagenum > 0) {
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&perpage=' + perpage + "&random=" + Math.random();
			}
			http.open('GET', addStatusTaskUrl, true);
			if (n == 1) { http.onreadystatechange = responseAllTasksProposal1; }
			else if (n == 2) { http.onreadystatechange = responseAllTasksProposal2; }
			else if (n == 3) { http.onreadystatechange = responseAllTasksProposal3; }
			else if (n == 4) { http.onreadystatechange = responseAllTasksProposal4; }
			else if (n == 5) { http.onreadystatechange = responseAllTasksProposal5; }
			else if (n == 6) { http.onreadystatechange = responseAllTasksProposal6; }
			else if (n == 7) { http.onreadystatechange = responseAllTasksProposal7; }
			else if (n == 8) { http.onreadystatechange = responseAllTasksProposal8; }
			else if (n == 9) { http.onreadystatechange = responseAllTasksProposal9; }
			else if (n == 10) { http.onreadystatechange = responseAllTasksProposal10; }
			else if (n == 11) { http.onreadystatechange = responseAllTasksProposal11; }
			else if (n == 12) { http.onreadystatechange = responseAllTasksProposal12; }
			else if (n == 13) { http.onreadystatechange = responseAllTasksProposal13; }
			else if (n == 14) { http.onreadystatechange = responseAllTasksProposal14; }
			else if (n == 15) { http.onreadystatechange = responseAllTasksProposal15; }
			else if (n == 16) { http.onreadystatechange = responseAllTasksProposal16; }
			else if (n == 17) { http.onreadystatechange = responseAllTasksProposal17; }
			else if (n == 18) { http.onreadystatechange = responseAllTasksProposal18; }
			else if (n == 19) { http.onreadystatechange = responseAllTasksProposal19; }
			else if (n == 20) { http.onreadystatechange = responseAllTasksProposal20; }
			http.send(null);
			showTop();
		}
	}
< !--End Fetch All tasks-- >	
< !--Begin - mark task as done -->
		function responseTaskDone() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('taskmsg').innerHTML = result;
					requestAllTasks();
				}
			}
			window.location.reload();
		}
	function requestTaskDone(a) {
		var bt_id = a;
		if (bt_id > 0) {
			if (!confirm("Are you sure want to Mark the task as DONE??")) {
				return false;
			}
			else {
				var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'markTaskDone' + '&bt_id=' + bt_id + "&random=" + Math.random();
				http.open('GET', addStatusTaskUrl, true);
				http.onreadystatechange = responseTaskDone;
				http.send(null);
			}
		}
	}
< !--End - Mark task as Done -->	
< !--Begin ReEdit the task manually-- >
		function responseTaskEdit() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('editTaskDiv').innerHTML = result;
					requestAllTasks();
				}
			}
		}
	function responseTaskEditProposal() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var result = http.responseText;
				document.getElementById('editTaskDivProposal').innerHTML = result;
				requestAllTasksProposal();
			}
		}
	}
	function requestTaskEdit(a, b) {
		var taskId = a;
		var taskAction = b;
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();
		if (taskAction == 'SaveEdit') {
			if (document.getElementById('bt_complete').checked) {
				var complete = 1;
			}
			else {
				var complete = 0;
			}
			var comment = document.getElementById('bt_comment').value;
			var date = document.getElementById('editTaskDate').value;
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&bt_completed_date=" + escape(date) + "&random=" + Math.random();
		}
		if (taskAction == 'CloseEdit') {
			document.getElementById('editTaskDiv').innerHTML = '';
		}
		http.open('GET', commonUrl, true);
		http.onreadystatechange = responseTaskEdit;
		http.send(null);
	}
	function requestTaskEditProposal(a, b) {
		var taskId = a;
		var taskAction = b;
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();
		if (taskAction == 'SaveEdit') {
			if (document.getElementById('bt_complete').checked) {
				var complete = 1;
			}
			else {
				var complete = 0;
			}
			var comment = document.getElementById('bt_comment').value;
			var date = document.getElementById('editTaskDate').value;
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&bt_completed_date=" + escape(date) + "&random=" + Math.random();
		}
		if (taskAction == 'CloseEdit') {
			document.getElementById('editTaskDivProposal').innerHTML = '';
		}
		http.open('GET', commonUrl, true);
		http.onreadystatechange = responseTaskEditProposal;
		http.send(null);
	}
< !--- Begin RD - various Frame functions-- ->
		function iframeResponse() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = ltrim(http.responseText);
					if (result != '') {
						var iframedata = new Array();
						iframedata = result.split('||');
						var len = iframedata.length;
						if (len > 0) {
							var v1 = iframedata[0];
							var v2 = iframedata[1];
							document.getElementById(v1).innerHTML = v2;
						} else {
							closeTop();
							return true;
						}
					}
					closeTop();
					return true;
				}
			}
		}
	function iframeRequest(divid, pagenum) {
		var bus_id = document.getElementById('bus_id').value;
		if (bus_id > 0) {
			if (divid != '') {
				if (divid == 1) {
					var docperpage = document.getElementById('docperpage').value;
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showdocuments' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divbusinessdocInfoToReturn';
					//alert(commonUrl);
				}
				if (divid == 2) {
					var imgperpage = document.getElementById('imgperpage').value;
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showimages' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&imgperpage=' + imgperpage + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divImages';
				}
				if (divid == 3) {
					var docperpage = document.getElementById('intdocperpage').value;
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showintdocuments' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divbusinessintdocInfoToReturn';
				}
				if (divid == 4) {
					var padocperpage = document.getElementById('padocperpage').value;
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showpadocs' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&padocperpage=' + padocperpage + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divbusinesspadocInfoToReturn';
				}
				if (divid == 5) {
					var panotesperpage = document.getElementById('panotesperpage').value;
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showpanotes' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&panotesperpage=' + panotesperpage + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divbusinesspanotesInfoToReturn';
				}
				if (divid == 6) {
					var docperpage_fin = document.getElementById('docperpage_fin').value;
					var commonUrl = "{{$BASE_URL}}business.common3?a_req=" + 'showdocuments_fin' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage_fin + "&random=" + Math.random();
					commonUrl = commonUrl + '&divid=' + 'divbusinessdocInfoToReturn_fin';
				}
				http.open('GET', commonUrl, true);
				http.onreadystatechange = iframeResponse;
				http.send(null);
				showTop();
			}
		}
	}
< !--- End RD - various Frame functions-- ->
< !--Begin Common Iframe Function for Common.php-- >
		function RequestcheckListIframe(action, tableid, divid, pagenum) {
			var bus_id = document.getElementById('bus_id').value;
			if (action == 'quotes') {
				var doc_id = tableid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + action + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#quoteIframe").show("slow");
				document.getElementById('quoteIframe').style.height = '1140px';
				document.getElementById('quoteIframe').style.display = 'block';
				document.getElementById('quoteIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'checklist') {
				var doc_id = tableid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'checklist' + '&doc_id=' + doc_id + "&random=" + Math.random();
				$("#checkListIframe").show("slow");
				document.getElementById('checkListIframe').style.height = '300px';
				document.getElementById('checkListIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'checklistfinancial') {
				var doc_id = tableid;
				var iframeUrl = "{{$BASE_URL}}business.common3?a_req=" + 'checklist_fin' + '&doc_id=' + doc_id + "&random=" + Math.random();
				$("#checkListIframe_fin").show("slow");
				document.getElementById('checkListIframe_fin').style.height = '300px';
				document.getElementById('checkListIframe_fin').src = iframeUrl;
				showTop(action);
			}
			if (action == 'checklistmini') {
				var doc_id = tableid;
				if (divid > 0) { var chknm = divid; }
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'checklistmini' + '&doc_id=' + doc_id + '&chknm=' + chknm + "&random=" + Math.random();
				$("#checkListIframeMini").show("slow");
				document.getElementById('checkListIframeMini').style.height = '300px';
				document.getElementById('checkListIframeMini').src = iframeUrl;
				showTop(action);
			}
			if (action == 'adddoc_checklistmini') {
				var doc_id = tableid;
				if (divid > 0) { var chknm = divid; }
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'adddoc_checklistmini' + '&doc_id=' + doc_id + '&chknm=' + chknm + '&bus_id=' + bus_id + "&random=" + Math.random();
				$("#adddoc_checkListIframeMini").show("slow");
				document.getElementById('adddoc_checkListIframeMini').style.height = '300px';
				document.getElementById('adddoc_checkListIframeMini').src = iframeUrl;
				showTop(action);
			}
			if (action == 'cchecklist') {
				var doc_id = tableid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cchecklist' + '&doc_id=' + doc_id + "&random=" + Math.random();
				$("#cdocumentsIframe1").show("slow");
				document.getElementById('cdocumentsIframe1').style.height = '325px';
				document.getElementById('cdocumentsIframe1').src = iframeUrl;
				showTop(action);
			}
			if (action == 'documents') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'documents' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#documentsIframe").show("slow");
				document.getElementById('documentsIframe').style.height = '300px';
				document.getElementById('documentsIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'adddocuments') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'documents' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#adddocumentsIframe").show("slow");
				document.getElementById('adddocumentsIframe').style.height = '300px';
				document.getElementById('adddocumentsIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'adddocuments_fin') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}business.common3?a_req=" + 'documents_fin' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#adddocumentsIframe_fin").show("slow");
				document.getElementById('adddocumentsIframe_fin').style.height = '370px';
				document.getElementById('adddocumentsIframe_fin').src = iframeUrl;
				showTop(action);
			}
			if (action == 'intdocuments') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'intdocuments' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#intdocumentsIframe").show("slow");
				document.getElementById('intdocumentsIframe').style.height = '300px';
				document.getElementById('intdocumentsIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'images') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'images' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#imagesIframe").show("slow");
				document.getElementById('imagesIframe').style.height = '210px';
				document.getElementById('imagesIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'padocuments') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'padocuments' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
				$("#padocumentsIframe").show("slow");
				document.getElementById('padocumentsIframe').style.height = '250px';
				document.getElementById('padocumentsIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'cdocuments') {
				var divid = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cdocuments' + '&bus_id=' + bus_id + '&divid=' + 'divbusinesspadocInfoToReturn1' + "&pagenum=" + pagenum + "&random=" + Math.random();
				$("#cdocumentsIframe").show("slow");
				document.getElementById('cdocumentsIframe').style.height = '300px';
				document.getElementById('cdocumentsIframe').src = iframeUrl;
				showTop(action);
			}
			if (action == 'dedocuments') {
				var docid = tableid;
				var cdata = divid;
				var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cdocuments' + '&bus_id=' + bus_id + '&divid=' + 'divbusinesspadocInfoToReturn1' + "&pagenum=" + pagenum + "&docid=" + docid + "&cdata=" + cdata + "&random=" + Math.random();
				$("#cdocumentsIframe").show("slow");
				document.getElementById('cdocumentsIframe').style.height = '300px';
				document.getElementById('cdocumentsIframe').src = iframeUrl;
				showTop(action);
			}
		}
		< !--End Common Iframe Function for Comman.php-- >
< !--Begin Delete document-- >
		function responseDeleteDocument() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = ltrim(http.responseText);
					if (result != '') {
						var temp = new Array();
						temp = result.split('||');
						var len = temp.length;
						if (len > 0) {
							var a = temp[0];
							var b = temp[1];
							iframeRequest(a);
						}
						else {
							iframeRequest(1);
							iframeRequest(2);
						}
					}
				}
			}
		}
	function requestDeleteDocument(tableid, id) {
			if (id == 1) {
				var a = confirm("Are you sure want to delete this Document?");
				if (a) { var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			if (id == 3) {
				var a = confirm("Are you sure want to delete this Document??");
				if (a) { var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			if (id == 2) {
				var a = confirm("Are you sure want to delete this Image??");
				if (a) { var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_image' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			if (id == 4) {
				var a = confirm("Are you sure want to delete?");
				if (a) { var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_padocs' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			http.open('GET', deleteUrl, true);
			http.onreadystatechange = responseDeleteDocument;
			http.send(null);
		}
< !--End Delete document-- >
< !--Begin Comman Function to hide div-- >
		function hideiFrame(id, msg) {
			$("#" + id).hide("slow");
			if (msg != '') {
				alert(ltrim(msg));
			}
		}
		< !--End Comman Function to hide div-- >
< !--End Add OC-- >
< !--Begin Add OC-- >
		function responseShowADDiv() {
			if (http.readyState == 4) {
				if (http.status == 200) {
					var result = http.responseText;
					document.getElementById('divadvertsToReturn').innerHTML = result;
					closeTop();
				}
			}
		}
		< !--Begin Price Ranges-- >
			function responseShowPRDiv() {
				if (http.readyState == 4) {
					if (http.status == 200) {
						var result = http.responseText;
						document.getElementById('divprToReturn').innerHTML = result;
						closeTop();
					}
				}
			}
			< !--Begin Quick View-- >
				function responseQuickView() {
					if (http.readyState == 4) {
						if (http.status == 200) {
							var result = ltrim(http.responseText);
							document.getElementById('showQuickView').innerHTML = result;
						}
					}
				}
	function requestQuickView(id) {
		var bcust_id = id;
		var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'quickView' + '&bcust_id=' + bcust_id + "&random=" + Math.random();
		http.open('GET', commonurl, true);
		http.onreadystatechange = responseQuickView;
		http.send(null);
	}
	function iframe3(a, b) {
		toggleLayer0pen('divimageadd', 'addfile');
		document.getElementById('fileupload').src = b;
		showTop();
	}
	function iframe4(a, b) {
		toggleLayer0pen('dividocadd', 'adddoc');
		var d = "{{$BASE_URL}}{{$XFA.document}}/bd_id/" + b;
		document.getElementById('docupload').src = d;
		showTop();
	}
	function iframe7(a, b) {
		toggleLayer0pen('divrecordedmeeting', 'addrecmeet');
		var d = "{{$BASE_URL}}{{$XFA.meeting_recording_detail}}/buse_id/" + b;
		document.getElementById('recordedmeeting').src = d;
		showTop();
	}
	function iframeqa(b, id) {
		toggleLayer0pen('divaqsection', 'addqa');
		var d = "{{$BASE_URL}}{{$XFA.businessqa_detail}}/bqa_id/" + b + "/id/" + id;
		document.getElementById('qaIframe').src = d;
		showTop();
	}
	function iframebm(b) {
		toggleLayer0pen('divbmsection', 'addqa');
		var d = "{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/" + b;
		document.getElementById('bmIframe').style.height = '355px';
		document.getElementById('bmIframe').src = d;
		showTop();
	}
	function add_edit_seller(v) {
		var id = v;
		var framesrc = '{{$BASE_URL}}{{$XFA.home}}/bsn_id/{{$detail.$ID}}/bs_id/' + v;
		document.getElementById('customerinfo').src = framesrc;
		toggleLayer('businesscistenquiry', 'addcust');
	}
	function confirmation() {
		var answer1 = confirm("Are you sure want to delete this business from database?? \n\n It will delete all data related  to this business from database and will not be rollback!")
		if (answer1) {
			var answer2 = confirm("Please click OK to delete this Business.")
			if (answer2) {
				var bus_id = document.getElementById('bus_id').value;
				window.location = "{{$BASE_URL}}{{$XFA.delete_business}}/bus_id/" + bus_id;
			}
			else {
				alert("Operation Aborted. \n\n This Business isn't deleted.")
			}
		}
		else {
			alert("Operation Aborted. \n\n This Business isn't deleted.")
		}
	}				
< !--End Quick View-- >	
< !--Begin Ajax comman XMLHttpRequest-- >
		function getHTTPObject() {
			var xmlhttp;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			}
			else if (window.ActiveXObject) {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				if (!xmlhttp) {
					xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
			return xmlhttp;
		}
	var http = getHTTPObject(); //We create the HTTP Object
< !--End Ajax comman XMLHttpRequest-- >
		function onload_items() {
			setTimeout('requestsellerInfo(1);', 1000);
		}
	window.onload = onload_items;
	function popup2(url) {
		params = 'width=' + screen.width / 1.5;
		params += ', height=' + screen.height / 1.5;
		params += ', top=0, left=0';
		params += ', scrolling=yes';
		params += ', fullscreen=no';
		params += ', scrollbars=yes';
		params += ', menubars=yes';
		newwin = window.open(url, 'windowname4', params);
		if (window.focus) { newwin.focus() }
		return false;
	}
</script>
<div>
	<table cellpadding="5" cellspacing="0" border="1" width="60%">
		<tr>
			<th width="33%"><a href="{{$BASE_URL}}planning_only_task_tracker.view_project/bsn_id/{{$bsn_id}}#ppat">Project
					Planning Approval Tasks</a></th>
			<th width="33%"><a href="{{$BASE_URL}}planning_only_task_tracker.view_project/bsn_id/{{$bsn_id}}#ppd">Planning
					Project Documents</a></th>
			<th width="33%"><a href="{{$BASE_URL}}planning_only_task_tracker.view_project/bsn_id/{{$bsn_id}}#ut_re">Utilites
					And Referrals</a></th>
		</tr>
	</table>
</div>
<div style="padding:10px; text-align:center; margin-bottom:20px; font-size:16px; color: #900"><strong>Project Name :
		{{$busdata.bsn_name}}</strong> </div>
<div id="ppat">
	
	<div style="padding:10px; text-align:center; margin-bottom:20px; font-size:18px; color:#09F; display:inline-block;">
		<strong>Project Planning Approval Tasks</strong>
		<form name="detail" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="shval" value="{{$shval}}" />
			<input type="submit" name="show_hide" value="Show/Hide" />
		</form>
	</div>
	<div style="float:left; margin-left: 10px;">
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th style="text-align: left;">DA Number</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_number" value="{{ $bsn_da_number }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_number', this.value)">
				</td>
			</tr>
			<tr>
				<th style="text-align: left;">DA Link 1</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_link" value="{{ $bsn_da_link }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_link', this.value)">
				</td>
			</tr>
			<tr>
				<th style="text-align: left;">DA Link 2</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_link" value="{{ $bsn_da_link_2 }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_link_2', this.value)">
				</td>
			</tr>
			<tr>
				<th style="text-align: left;">DA Link 3</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_link" value="{{ $bsn_da_link_3 }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_link_3', this.value)">
				</td>
			</tr>
			<tr>
				<th style="text-align: left;">DA Link 4</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_link" value="{{ $bsn_da_link_4 }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_link_4', this.value)">
				</td>
			</tr>
			<tr>
				<th style="text-align: left;">DA Link 5</th>
				<td style="text-align: left; width: 150px;">
					<input type="text" name="da_link" value="{{ $bsn_da_link_5 }}" onkeyup="update_record('{{$bsn_id}}', 'bsn_da_link_5', this.value)">
				</td>
			</tr>
		</table>
	</div>
	{{if $shval eq 1}}
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table cellpadding="5" cellspacing="0" border="1" width="100%">
			<tr>
				<th width="9%">Action</th>
				<th width="2%">Seq</th>
				<th width="1%">UID</th>
				<th width="6%">Email Link</th>
				<th width="26%">Task Name</th>
				<th width="5%">Complete</th>
				<th width="6%">Complete Date</th>
				<th width="8%">Completed By</th>
				<th width="25%" align="left">Relevant Procedures MS Team Links</th>
				<th width="5%" align="left">Auto Email</th>
				<th width="5%" align="left">Auto Text</th>
				<th width="3%" align="left">Help</th>
				<th width="5%" align="left">Video Link</th>
			</tr>
			{{assign var="bg" value="D4D7FE"}}
			{{foreach from=$allTasks item=item key=key}}
			{{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}}
			{{assign var="bg" value="D4D7FE"}} {{/if}}
			{{if $item.bt_complete eq 1}}
			<tr id="grTask{{$item.bt_id}}" style="background:#090;">
				{{else}}
					{{if $item.bt_task_not_required eq 1}}
			<tr id="grTask{{$item.bt_id}}" style="background:#CCC;">
				{{else}}
			<tr id="grTask{{$item.bt_id}}">
				{{/if}}
				{{/if}}
				<td>
					<a
						href="javascript:modelwindow('{{$BASE_URL}}business.subtask/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
						<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/sub.png"
							title="Sub Task Edit" /></a>
					<a
						href="javascript:modelwindow('{{$BASE_URL}}business.taskediturl/bus_id/{{$item.bt_bsn_id}}/taskId/{{$item.bt_id}}','90%','90%', 'yes');">
						<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"
							title="Task Edit" /></a>
					<a
						href="javascript:modelwindow('{{$BASE_URL}}business.ps_qa/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
						<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/qa.png"
							title="Sub Task Edit" /></a> <br />
					Make Not Required:
					<input type="hidden" name="not_required_task[{{$item.bt_id}}][bt_id]" value="{{$item.bt_id}}" />
					<input type="checkbox" name="not_required_task[{{$item.bt_id}}][bt_task_not_required]"
						id="notreqTask{{$item.bt_id}}"
						onclick="tasknotrequired({{$item.bt_id}}, {{$item.bt_complete}});" {{if
						$item.bt_task_not_required eq 1 }} checked="checked" {{/if}} />
					<p id="myElemTask{{$item.doc_id}}" style="display:none;"></p>
				</td>
				<td align="center">{{counter}}</td>
				<td align="center">{{if $item.bst_task_id == 0}}{{$item.bst_id}}
					{{else}}
						<a href="{{$BASE_URL}}business_status_taskAdmin.detail/bst_id/{{$item.bst_id}}"
							target="_blank">{{$item.bst_task_id}}{{/if}}
				</td>
				<td>
					{{foreach from=$emaillinks item=item_l key=key_l}}
					{{assign var=someVar value=","|explode:$item_l.eml_link_uid}}
					{{if $item.bst_task_id eq $someVar[0] || $item.bst_task_id eq $someVar[1] || $item.bst_task_id eq $someVar[2] || $item.bst_task_id eq $someVar[3] || $item.bst_task_id eq $someVar[4]  || $item.bst_task_id eq $someVar[5] || $item.bst_task_id eq $someVar[6] || $item.bst_task_id eq $someVar[7]}}
					<a href="{{$BASE_URL}}emaillibrary.compose/eml_id/{{$item_l.eml_id}}"
						target="_blank">{{$item_l.eml_code}}</a><br />
					{{/if}}
					{{/foreach}}
				</td>
				<td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.st_name}} - {{$item.bst_task_name}}
				</td>
				<td style="text-align:center;">
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="comp[val]" value="0" />
						<input type="hidden" name="bt_task_id[{{$item.bt_id}}]" value="{{$item.bt_task_id}}" />
						<input type="checkbox" name="comp[co]" onChange="this.form.submit()" {{if $item.bt_complete=='1'
							}}checked="checked" {{/if}} />
					</form>
				</td>
				<td style="text-align:center;">
					{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
				<td style="text-align:center;">{{if $item.bt_complete=='1'}} {{$item.user_name}}
					{{else}} {{$item.p_name}} {{/if}}
				</td>
				<td align="left">
					{{foreach from=$allTasksTeam item=item_t key=key_t}}
					{{if $item.bt_task_id eq $item_t.btp_bst_id}}
					{{if $item_t.dhd_link_pdf}}
					<div> <a href="{{$item_t.dhd_link_pdf}}" target="_blank">{{$item_t.btp_doc_longtext}}-PDF</a> </div>
					<br />{{/if}}
					{{if $item_t.dhd_link_word}}
					<div> <a href="{{$item_t.dhd_link_word}}" target="_blank">{{$item_t.btp_doc_longtext}}-Word</a>
					</div><br />{{/if}}
					{{/if}}
					{{/foreach}}
				</td>
				<td align="center">{{if $item.bst_auto_email_text eq '1'}} Yes
					{{else}} No {{/if}}
				</td>
				<td> {{if $item.bst_auto_sms_text eq '1'}} Yes
					{{else}} No {{/if}}
				</td>
				<td align="left">{{if $item.bst_instruction}}
					<a href="javascript:parent.showFancybox('{{$item.bst_instruction|strip_tags}}');">
						<!--  <a href="javascript:alert('{{$item.bst_instruction|strip_tags|html_entity_decode:2:"UTF-8"|htmlentities:2:"UTF-8"}}');" >-->
						<img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/help.png" title="Help" /></a>
					{{/if}}
				</td>
				<td>{{if $item.bst_video_link}} <a href="{{$item.bst_video_link}}" target="_blank">Link</a>{{/if}}
				</td>
			</tr>
			{{/foreach}}
			<tr>
				<td colspan="12" style="padding:5px;">
					<input type="hidden" name="bt_task_id[{{$item.bt_id}}]" value="{{$item.bt_task_id}}" />
					<input type="submit" name="not_required_task_save" value="Save Not Required" />
				</td>
			</tr>
		</table>
		<br />
		<br />
	</form>
	{{/if}}
</div>
<!--------Planning Project Documents Section Starts ----------->
<div id="ppd">
	<div style="padding:10px; text-align:center; margin-bottom:20px; font-size:18px; color:#09F"><strong>Planning Project Documents</strong> </div>
	<table cellpadding="5" cellspacing="0" border="1" width="95%" style="text-align:center;">
		<tr>
			<th></th>
			<th>Possible</th>
			<th>Required</th>
			<th>Added</th>
			<th>Approved</th>
		</tr>
		<tr>
			<th>DA</th>
			<th>{{$possible}}</th>
			<th>{{$required}}</th>
			<th>{{$added}}</th>
			<th>{{$approved}}</th>
		</tr>
		<tr>
			<th>BA</th>
			<th>{{$possible_ba}}</th>
			<th>{{$required_ba}}</th>
			<th>{{$added_ba}}</th>
			<th>{{$approved_ba}}</th>
		</tr>
	</table>
	<br />
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<input type="hidden" name="shval_ppd" value="{{$shval_ppd}}" />
		<input type="submit" name="show_hide_ppd" value="Show/Hide" />
	</form>
	<script>
		function update_required(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var req = '#req' + id;
			var req_color = '#req_color' + id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_required/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(req).html(result);
					if (value == 0) {
						$(req_color).css("background", "#F00");
					} else {
						$(req_color).css("background", "#FFF");
					}
				}
			});
		}
		function update_missing_plans_report(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var req = '#update_missing_plans_report'+id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_missing_plans_report/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(req).html(result);
				}
			});
		}
		function update_ready(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_ready/pc_id/" + id + "/value/" + val,
				success: function (result) {
				}
			});
		}
		function update_qa1(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var qa1 = '#qa1' + id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_qa1/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(qa1).html(result);
				}
			});
		}
		function update_qa2(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var qa2 = '#qa2' + id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_qa2/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(qa2).html(result);
				}
			});
		}
		function update_pp(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var apr = '#app' + id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_pp/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(apr).html(result);
				}
			});
		}
		function update_dep_uploaded(id, value) {
			if (value == true) { var val = 1 } else { var val = 0; }
			var dep = '#dep' + id;
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_dep_uploaded/pc_id/" + id + "/value/" + val,
				success: function (result) {
					$(dep).html(result);
				}
			});
		}
		function update_record(id, col, value) {
			const formData = {
				bsn_id: id,
				col: col,
				value: value,
				action: "updateRecord"
			};
			$.ajax({
				type: "POST",
				url: "{{$BASE_URL}}planning_only_task_tracker.update_record",
				data: formData,
				dataType: "json",
				encode: true,
				success: function (data) {
					if (data.success == true) {
						// alert('You have successfully updated the record');
					}
					else {
						alert('Some problem in updating the record');
					}
				}
			});
		}
		function update_da_number(id, value) {
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}planning_only_task_tracker.update_da_number/bsn_id/" + id + "/value/" + value,
				success: function (result) {
				}
			});
		}
		function update_da_link(id, value) {
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}planning_only_task_tracker.update_da_link/bsn_id/" + id + "/value/" + value,
				success: function (result) {
				}
			});
		}
	</script>
	{{if $shval_ppd eq 1}}
	<table cellpadding="5" border="1" cellspacing="0" width="100%">
		<tr>
			<th width="4%" data-col="action">Action</th>
			<th width="20%" data-col="document_plan">Document/Plan</th>
			<th width="5%" data-col="type">Type</th>
			<th width="6%" data-col="required">Required</th>
			<th width="6%" data-col="design_plans">Design Plans</th>
			<th width="6%" data-col="add_to_the_missing_plans_report">Add to the Missing Plans Report</th>			
			<th width="6%" data-col="planning_plans">Planning Plans</th>
			<th width="8%" data-col="qa">QA</th>
			<th width="8%" data-col="upload_to_department">Uploaded to department</th>
			<th width="8%" data-col="breach_list">Breach List</th>
			<th width="8%" data-col="rules">Rules</th>
		</tr>
		<form name="nr" method="post" action="">
			{{foreach from=$print_data item=item key=key}}
			<tr {{if $item.pc_required eq 0}} style="background:#F00;" {{/if}} id="req_color{{$item.pc_id}}">
				<td data-col="action">
					<a href="{{$BASE_URL}}{{$XFA.detail}}/pc_id/{{$item.pc_id}}" class="various" title="Edit">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
				</td>
				<td style="padding-left:5px;" data-col="document_plan">{{$item.pc_document}}</td>
				<td data-col="type">{{$item.pc_type}}</td>
				<td data-col="required">
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="required[{{$item.pc_id}}]" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="required[{{$item.pc_id}}]"
								onclick="update_required({{$item.pc_id}},this.checked);" {{if $item.pc_required eq 1 }}
								checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					<span id="req{{$item.pc_id}}">{{if $item.pc_required eq 0}}{{$item.pc_required_user}}
						<br />{{$item.pc_required_date}}{{/if}} </span>
				</td>
				<td data-col="design_plans">
					{{if $item.pc_design_plan}}
					<a href="{{$item.pc_design_plan}}" target="_blank">Link</a>
					{{$item.pc_design_plan_user}}
					<br />
					{{$item.pc_design_plan_date}}
					{{/if}}
				</td>
				<td data-col="add_to_the_missing_plans_report">
					<form>
						<input type="hidden" name="pc_missing_plans_report[{{$item.pc_id}}]" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="pc_missing_plans_report[{{ $item.pc_id }}]"
								onclick="update_missing_plans_report({{ $item.pc_id }},this.checked);"
								{{ if $item.pc_missing_plans_report eq 1 }} checked="checked" {{/if}}
							/>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					<span id="update_missing_plans_report{{$item.pc_id}}">
						{{ if $item.pc_missing_plans_report eq 1 }}
							{{$item.pc_missing_plans_report_user}}
							<br />
							{{$item.pc_missing_plans_report_date|date_format:'%d-%m-%Y'}}
						{{/if}}
					</span>
				</td>
				<td data-col="planning_plans">
					{{if $item.pc_live_link}}
					<a href="{{$item.pc_live_link}}" target="_blank">Link</a>
					{{$item.pc_live_link_user}}
					<br />
					{{$item.pc_live_link_date}}
					{{/if}}
				</td>
				<td data-col="qa">
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="qa1[{{$item.pc_id}}]" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="qa1[{{$item.pc_id}}]"
								onclick="update_qa1({{$item.pc_id}},this.checked);" {{if $item.pc_qa1 eq 1 }}
								checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					<span id="qa1{{$item.pc_id}}">{{if $item.pc_qa1 eq 1}}{{$item.pc_qa1_user}}
						<br />{{$item.pc_qa1_date}}{{/if}} </span>
				</td>
				<td data-col="upload_to_department">
					<form name="recmet5" method="post" action="">
						<input type="hidden" name="depup[{{$item.pc_id}}]" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="depup[{{$item.pc_id}}]"
								onclick="update_dep_uploaded({{$item.pc_id}},this.checked);" {{if $item.pc_dep_uploaded
								eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					<span id="dep{{$item.pc_id}}">{{if $item.pc_dep_uploaded eq 1}}{{$item.pc_dep_upload_user}}
						<br />{{$item.pc_dep_upload_user}}{{/if}} </span>
				</td>
				<td style="text-align:center;" data-col="breach_list">
					<!--<a href="{{$BASE_URL}}business.plan_breach/doc_name/{{ $item.pc_doc_id }}/bus_id/{{ $bsn_id }}" class="various">Link</a>-->
					<a href="{{$BASE_URL}}planning_only_task_tracker.breach_text/pc_doc_id/{{ $item.pc_doc_id }}/bsn_id/{{ $bsn_id }}" class="various">Link</a>
				</td>
				<td style="text-align:center;" data-col="rules">
					<a href="{{$BASE_URL}}business.rules/pc_doc_id/{{$item.pc_doc_id}}" class="various">Link</a>
				</td>
			</tr>
			{{/foreach}}
			</tr>
		</form>
	</table>
	{{/if}}
</div>
<!--------Utilites and referrals ----------->
<div id="ut_re" style="margin-bottom:20px">
	<div style="padding:10px; text-align:center; margin-bottom:20px; margin-top:15px; font-size:18px; color:#09F">
		<strong>Utilites and referrals</strong>
	</div>
	{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}
	{{ if empty($action_name)  }}
	{{foreach from=$project_checklist_list item=item_c key=key}}
	<br>
	<table cellpadding="5" border="1" cellspacing="0" width="100%">
		<tr>
			<th width="5%">Action</th>
			<th width="20%">Utilities</th>
			<th width="20%">Status</th>
			<th width="15%">Date we Applied</th>
			<th width="20%">Assessment Doc</th>
			<th width="20%">Conditions Imposed Snapshot</th>
		</tr>
		<form name="nr" method="post" action="">
			{{foreach from=$item_c.checklist_entities_referral item=item key=key}}
			<tr {{if $item.pc_required eq 10}} style="background:#F00;" {{/if}} id="req_color{{$item.pc_id}}">
				<td style="text-align:center;">
					<a
						href="javascript:requestProjectChecklistEntitiesList('ppchecklist_entites_edit','{{$bsn_id}}','{{ $item.checklist_entities_referral.id }}','{{ $item.er_document }}','{{ $item.er_id }}','{{ $item_c.dpn_unique_id }}');">
						<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png">
					</a>
					<!--https://newdeckquote.com/planning_only_task_tracker.detail/pc_id/"-->
				</td>
				<td style="text-align:center;">
					{{ $item.er_document }}
				</td>
				<td style="text-align:center;">
					{{ if $item.er_document eq 'TPU – Trees' or $item.er_document eq 'TCCS – Driveways'}}
                        N/A
                    {{else}}
                        {{ if $item.er_document eq 'Evo – Electrical' }}
							{{foreach from=$item.document_status item=item_s key=key}}
								{{ if empty($item_s.dpn_electric_ref)}} 
									N/A
								{{else}}
									{{ $item_s.dpn_electric_ref }} 
								{{/if}}
								
								- {{ if !empty($item_s.dpn_unique_id)}}{{ $item_s.dpn_unique_id }}{{/if}} <br>
							{{/foreach}}	
                        {{ elseif $item.er_document eq 'Icon – Water' }}
                            {{foreach from=$item.document_status item=item_s key=key}}
								{{ if empty($item_s.dpn_water_ref)}} 
									N/A
								{{else}}
									{{ $item_s.dpn_water_ref }} 
								{{/if}}
								
								- {{ if !empty($item_s.dpn_unique_id)}}{{ $item_s.dpn_unique_id }}{{/if}} <br>
							{{/foreach}}
                        {{ elseif $item.er_document eq 'TCCS – Stormwater' }}
                            {{foreach from=$item.document_status item=item_s key=key}}
								{{ if empty($item_s.dpn_storm_ref)}} 
									N/A
								{{else}}
									{{ $item_s.dpn_storm_ref }} 
								{{/if}}
								
								- {{ if !empty($item_s.dpn_unique_id)}}{{ $item_s.dpn_unique_id }}{{/if}} <br>
							{{/foreach}}
                        {{ elseif $item.er_document eq 'Gas' }}
                            {{foreach from=$item.document_status item=item_s key=key}}
								{{ if empty($item_s.dpn_gas_ref)}} 
									N/A
								{{else}}
									{{ $item_s.dpn_gas_ref }} 
								{{/if}}
								
								- {{ if !empty($item_s.dpn_unique_id)}}{{ $item_s.dpn_unique_id }}{{/if}} <br>
							{{/foreach}}
                        {{ elseif $item.er_document eq 'Heritage' }}
                            {{foreach from=$item.document_status item=item_s key=key}}
								{{ if empty($item_s.dpn_heritage_ref)}} 
									N/A
								{{else}}
									{{ $item_s.dpn_heritage_ref }} 
								{{/if}}
								
								- {{ if !empty($item_s.dpn_unique_id)}}{{ $item_s.dpn_unique_id }}{{/if}} <br>
							{{/foreach}}
                        {{/if}}
                    {{/if}}
				</td>
				<td style="text-align:center;">
				    {{if !empty($item.document_check_list.doc_file_name) }}
                      {{ $item.document_check_list.doc_date_uploaded }}
                    {{else}}
                        {{ $item.checklist_entities_referral.date_applied }}
                    {{/if}}
				</td>
				<td style="text-align:center;">
				    {{if !empty($item.document_check_list.doc_file_name) }}
                        <a href="/business.download_content?file_name={{ $item.document_check_list.doc_file_name }}&module_name=business.detail" target="_blank">Download</a>
                    {{/if}}
                      
					<!-- {{if !empty($item.checklist_entities_referral.assessment_doc) }}
					<a href="/business.download_content?file_name={{ $item.checklist_entities_referral.assessment_doc }}&module_name=business.detail"
						target="_blank">Download</a>
					{{/if}} -->
				</td>
				<td>
					{{if !empty($item.checklist_entities_referral.condition_snapshot) }}
					<a href="/business.download_content?file_name={{ $item.checklist_entities_referral.condition_snapshot }}&module_name=business.detail"
						target="_blank">Download</a>
					{{/if}}
				</td>
			</tr>
			{{/foreach}}
			</tr>
		</form>
	</table>
	{{/foreach}}
	<br><br>
	{{/if}}
	{{$ppchecklist_entites}}
	{{if !empty($iframe_msg)}}
	<script>
		parent.hideiFrame('ppcheckListIframe', '');
		parent.requestPPCheckList();
	</script>
	{{/if}}
	<script>
		function requestProjectChecklistEntitiesList(action_name, business_id, checklist_entities_referral_id, er_document, er_id, checklist_id) {
			var bus_id = business_id;
			if (bus_id > 0) {
				var iframeUrl = "{{$BASE_URL}}business.entities?action_name=" + action_name + "&er_id=" + er_id + "&checklist_id=" + checklist_id + "&er_document=" + er_document + "&checklist_entities_referral_id=" + checklist_entities_referral_id + "&a_req=" + 'EntityList' + '&bus_id=' + bus_id + "&random=" + Math.random();
				$.fancybox({
					'href': iframeUrl,
					'type': 'iframe',
					'width': '95%',
					'height': '95%',
					'autoScale': false,
					'transitionIn': 'elastic',
					'transitionOut': 'elastic',
					'speedIn': 300,
					'speedOut': 300,
					'overlayShow': true,
					'hideOnOverlayClick': false,
					'hideOnContentClick': false,
					'scrolling': 'yes'
				});
			}
		}
	</script>
</div>