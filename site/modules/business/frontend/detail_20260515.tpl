<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>

#list-table2 {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 th {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 td {border: 1px solid #9CF; border-collapse:collapse; }
#product-table td {padding:6px !important }
</style>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<script src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/ckeditor2/samples/css/sample.css" />

{{if $show_productpage}}
	{{include file=$productpage}}	
{{else}}


{{include file=$jdata}}
{{include file=$tiny_basic}}	


    <script type="text/javascript">

    function toggleDiv(divId) {

       $("#"+divId).toggle();

    }
	</script>

<script type="text/javascript">
function target_popup(form) {
    window.open('', 'formpopup', 'width=850,height=600,resizeable,scrollbars');
    form.target = 'formpopup';
}
function target_popup_IE() {
    window.open('', 'formpopup', 'width=850,height=600,resizeable,scrollbars');
    document.detail.target = 'formpopup';
	document.detail.action = '{{$BASE_URL}}{{$XFA.buyer_qa_email}}/'+ Math.random();	
	document.detail.submit();
}
</script>
<script type="text/javascript">
animatedcollapse.addDiv('michael', 'fade=1')
animatedcollapse.addDiv('michael1', 'fade=1')
animatedcollapse.ontoggle=function($, divobj, state){ }
animatedcollapse.init()
function setvalue(bus_id, bus_name)
		{
		document.getElementById("txtCustomerId").value = bus_name;
		document.getElementById("txtbusId").value = bus_id;
		document.getElementById('divCustomersInfo').style.visibility = 'hidden';
		}
function closediv(){document.getElementById('divCustomersInfo').style.visibility = 'hidden'; }			
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
 function callBoxFancy(my_href) {  

 var j1 = document.getElementById("hiddenclicker");  
 j1.href = my_href;  
 $('#hiddenclicker').trigger('click');  
 }  
 
 function modelview(id)
 {
 var viewurl = "{{$BASE_URL}}{{$XFA.common}}?a_req="+'quickView'+'&bcust_id='+id+"&random="+ Math.random();

 $(document).ready(function () {
        $.fancybox({
            'width': '89%',
            'height': '80%',
            'autoScale': true,
            'type': 'iframe',
            'href': viewurl,
			'transitionIn'    : 'fade',
			'transitionOut'   : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'hideOnContentClick':false	
        });
});

}

function openPopup(url)
{
	$(document).ready(function () {
		$.fancybox({
			'width': '89%',
			'height': '80%',
			'autoScale': true,
			'type': 'iframe',
			'href': url,
			'transitionIn'    : 'fade',
			'transitionOut'   : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'hideOnContentClick':false	
		});
	});
}

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}business.view_procedure"+ "/random/" + Math.random();	
	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}

function sync_planning(bd_id)
{
	var viewurl = "{{$BASE_URL}}business.sync"+ "/bd_id/" + bd_id;	
	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}

function add_type()
{
	var viewurl = "{{$BASE_URL}}business.view_type"+ "/random/" + Math.random();	
	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}


 function modelview_mr(id)
 {
	 var viewurl = "{{$BASE_URL}}{{$XFA.show_meetingrecording_detail}}?a_req="+'quickView'+'&rm_id='+id+"&random="+ Math.random();
	
	 $(document).ready(function () {
			$.fancybox({
				'width': '89%',
				'height': '80%',
				'autoScale': true,
				'type': 'iframe',
				'href': viewurl,
				'transitionIn'    : 'fade',
				'transitionOut'   : 'fade',
				'speedIn' : 300,
				'speedOut' : 300,
				'overlayShow' : true,
				'hideOnOverlayClick':false,
				'hideOnContentClick':false	
			});
	});

}


 function modelview2(id)
 {
var viewurl = "{{$BASE_URL}}customer.custview/bcust_id/"+ id+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
            'width': '89%',
            'height': '80%',
            'autoScale': true,
            'type': 'iframe',
            'href': viewurl,
			'transitionIn'          : 'fade',
			'transitionOut'         : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'hideOnContentClick':false
			
        });
});
}

 function modelview3(id)
 {
 var viewurl = "{{$BASE_URL}}business.courier_box/bid/10"

 $(document).ready(function () {
        $.fancybox({
            'width': '89%',
            'height': '90%',
            'autoScale': true,
            'type': 'iframe',
            'href': viewurl,
			'transitionIn'    : 'fade',
			'transitionOut'   : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'hideOnContentClick':false	
        });
});

}

  
  function showrule(pc_doc_id)
 {
	var viewurl = "{{$BASE_URL}}business.rules"+ "/pc_doc_id/" + pc_doc_id + "/po/" + 1;	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
				
				 
        });
      });
}

function plan_breach(doc_name, bus_id)
 {
	var viewurl = "{{$BASE_URL}}business.plan_breach"+ "/doc_name/" + doc_name + "/bus_id/" + bus_id;	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
				
				 
        });
      });
}

function breach_text(doc_name, bus_id)
 {
	var viewurl = "{{$BASE_URL}}business.breach_text/pc_doc_id/"+doc_name+"/bsn_id/"+bus_id;
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
				
				 
        });
      });
}
  


 function elogview(id)
 {
var viewurl = "{{$BASE_URL}}business.elogview/edl_id/"+ id+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
            'width': '80%',
            'height': '90%',
            'autoScale': true,
            'type': 'iframe',
            'href': viewurl,
			'transitionIn'          : 'fade',
			'transitionOut'         : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'hideOnContentClick':false
			
        });
});
}

function modelviewimages(url)
 {
 $(document).ready(function () {
        $.fancybox({
            'width': '95%',
            'height': '95%',
            'autoScale': true,
            'type': 'iframe',
            'href': url,
			'transitionIn' : 'elastic',
			'transitionOut' : 'elastic',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'scrolling'         : 'yes', 
			'hideOnContentClick':false			
        });
});
}

function modelwindow(url, width, hight, scrolling)
 {
 $(document).ready(function () {
        $.fancybox({
            'width': width,
            'height': hight,
            'autoScale': true,
            'type': 'iframe',
            'href': url,
			'transitionIn' : 'elastic',
			'transitionOut' : 'elastic',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'scrolling' : 'yes', 
			'hideOnContentClick':false			
        });
});
}

function seller_tasks_email(bid, id)
 {
var viewurl = "{{$BASE_URL}}business.taskemails/bid/"+bid+"/bt_id/"+ id+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
            'width': '80%',
            'height': '80%',
            'autoScale': true,
            'type': 'iframe',
            'href': viewurl,
			'transitionIn' : 'fade',
			'transitionOut' : 'fade',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'hideOnOverlayClick':false,
			'scrolling' : 'yes', 
			'hideOnContentClick':false
        });
});
}

function showFancybox(html){
    $.fancybox('',
				{
					'content': '<h1>Task Instructions:</h1><br><p>'+html+'</p>',
					'autoDimensions'    : false,
					'width'             : 550,
					'height'            : 550,
					'transitionIn'      : 'elastic',
					'transitionOut'		:'elastic',
					'speedIn'			: 600, 
					'speedOut'			: 200, 
					'overlayShow'		:false,
					'centerOnScroll': true
				}
        );
}

//
function showweb(a)
{
var str =  a.substr(0,3);
if(str == 'www')
{
      a = "http://"+a;
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

function popup(url) 
				{
				 params  = 'width='+screen.width/1.5;
				 params += ', height='+screen.height/1.5;
				 params += ', top=0, left=0'
				 params += ', scrolling=yes'
				 params += ', scrollbars=yes'
				 params += ', fullscreen=no';
				
				 newwin=window.open(url,'windowname4', params);
				 if (window.focus) {newwin.focus()}
				 return false;
				}
	
	function handleHttpResponsewin() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                var results=http.responseText;
			  if(results !='')
			  	{
				closeTop();	
				popup('{{$BASE_URL}}{{$XFA.taskemail}}'); 
				}
            }
          }
        }
		
		function send_email() {   
		   var sId = document.getElementById("bus_id").value;

		    curl2 = commonurl + "send_email" + '&busid=' + escape(sId)+ "&random=" + Math.random();
            http.open("GET", curl2, true);
            http.onreadystatechange = handleHttpResponsewin;
            http.send(null);
			showTop();			 
        }

	function handleHttpResponsedelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{requestsellerInfo(1);
						toggleLayernew('businesscistenquiry','addcust');
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
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{requestbusdocsInfo(1);
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
		var getcomdeleteurl = "{{$BASE_URL}}business.delete_component?po_id=";
		var getalertdeleteurl = "{{$BASE_URL}}{{$XFA.delete_alert}}?buse_id=";
		var getproposalalertdeleteurl = "{{$BASE_URL}}{{$XFA.delete_proposalalert}}?buse_id=";
		var gettimetrackerdeleteurl = "{{$BASE_URL}}business.delete_timetracker?buse_id=";
		var quotedeleteurl = "{{$BASE_URL}}business.delete_quote?po_id=";
		var customquotedeleteurl = "{{$BASE_URL}}business.delete_quote_custom?po_id=";
		
		var getrmdeleteurl = "{{$BASE_URL}}{{$XFA.delete_recorded_meeting}}?rm_id=";
		var getdeldeleteurl = "{{$BASE_URL}}business.delete_delivery?de_id=";
			
		function handleHttpResponseenqudelete() {   
		if (http.readyState == 4) {
		      if(http.status==200) {
			  var results=http.responseText;		
				  if(results !='')
						{
						requestbusenquiryInfo(1);
						closeTop();
						}
		    }
		  }
           }
	   
	   
	   function handleHttpResponsecompdelete() {   
		if (http.readyState == 4) {
		      if(http.status==200) {
			  var results=http.responseText;		
				  if(results !='')
						{
						requestcomponentInfo(1);
						requestPurchseOrder('add','NR');
						closeTop();
						}
		    }
		  }
           }
		
   function handleHttpResponsermdelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestrecordedmeetingInfo(1);
					closeTop();
					}
            }
          }
        }
		
	
	function handleHttpResponsedeldelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestdeliveryInfo(1);
					closeTop();
					}
            }
          }
        }
		
		
		function handleHttpResponsealertdelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestbusalertInfo(1);
					closeTop();
					}
            }
          }
        }
	
    function handleHttpResponseproposalalertdelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestproposalalertInfo(1);
					closeTop();
					}
            }
          }
        } 
	
	
	function handleHttpResponsetimedelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestddtimetrackerInfo(1);
					closeTop();
					}
            }
          }
        } 
	
	 function handleHttpResponseQuotedelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					requestPurchseOrder('add');
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
	
	
	function requestcomDelete(b) {   
            var sId = b;
	 
            http.open("GET", getcomdeleteurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsecompdelete;
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
	
	 function requestdelDelete(b) {   
            var sId = b;
            http.open("GET", getdeldeleteurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsedeldelete;
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
	
	
	function requesttimetrackerDelete(b) {   
            var sId = b;
            http.open("GET", gettimetrackerdeleteurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsetimedelete;
            http.send(null);
	    showTop();
        }
	
	
	function requestQuoteDelete(b,x) {   
            var sId = b;
	    if(x==1) {
            	http.open("GET", quotedeleteurl + escape(sId), true);
	    } else {
		http.open("GET", customquotedeleteurl + escape(sId), true);
	    }
            http.onreadystatechange = handleHttpResponseQuotedelete;
            http.send(null);
	    showTop();
        }
	
		<!--enquiry delete-->
			<!--QA delete-->
		
		var getqadeleteurl = "{{$BASE_URL}}{{$XFA.delete_qa}}?bqa_id=";	
		 function handleHttpResponseqadelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{requestquestionInfo2(1);
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
	
		<!--QA delete-->
	
			  function handleHttpResponsefiledelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{requestbusfilesInfo(1);
					toggleLayernew('divimageadd','addfile');
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
              if(http.status==200) {
                  var results=http.responseText;
              document.getElementById('divbusinesscustomreInfoToReturn').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divbusinesscustomreInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
		
		function requestsellerInfo(pagenum) {   
		   var sId = document.getElementById("bus_id").value;
		   if(sId > 0)
		   {
		var getSuburb = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showSeller' +  '&bus_id=' + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();	
		    http.open("GET", getSuburb, true);
            http.onreadystatechange = handleHttpCustResponselist;
            http.send(null);
			showTop();
			}
        }
		
	
		function handleHttpfilesResponselist() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					  
				  document.getElementById('divbusinessfileInfoToReturn').innerHTML = results;
				  if(results !='')
					{document.getElementById('divbusinessfileInfoToReturn').style.visibility = 'visible';
					closeTop();return false;}
				}
			  }
			}
		
		
		function requestbusfilesInfo(pagenum) {   
		   var sId = document.getElementById("bus_id").value;
		   if(sId>0)
		   {
				curl22 = getfileslisturl + escape(sId) + '&pagenum=' + pagenum + "&random=" + Math.random();
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponselist;
				http.send(null);
				showTop();
			}
			
        }
				
	
	var getenquirylisturl = "{{$BASE_URL}}{{$XFA.msteam_list}}?bs_id="; // The server-side script
	var getcomponentlisturl = "{{$BASE_URL}}business.component_list?bs_id="; // The server-side script
	var getvideolisturl = "{{$BASE_URL}}{{$XFA.videolinks_list}}?bs_id="; // The server-side script
	var getalertlisturl = "{{$BASE_URL}}{{$XFA.businessalert_list}}?bs_id="; // The server-side script
	var getproposalalertlisturl = "{{$BASE_URL}}{{$XFA.proposalalert_list}}?bs_id="; // The server-side script
	var getdtimetrackerturl = "{{$BASE_URL}}business.datetimetracker_list?bs_id="; // The server-side script
	var getrecordedmeeturl = "{{$BASE_URL}}{{$XFA.meeting_recording_list}}?bs_id="; // The server-side script
	var getdeliveryurl = "{{$BASE_URL}}business.delivery_list?bs_id="; // The server-side script
	
	function handleHttpenquiryResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divbusinessenquiryInfoToReturn').innerHTML = results;
				document.getElementById('divbusinessenquiryInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
	
	function handleHttpcomponentResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divbusinessenquiryInfoToReturn_c').innerHTML = results;
				document.getElementById('divbusinessenquiryInfoToReturn_c').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
	function handleHttprecordedmeetinglist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divrecmeettInfoToReturn').innerHTML = results;
				document.getElementById('divrecmeettInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
	function handleHttpdeliverylist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divdeliveryToReturn').innerHTML = results;
				document.getElementById('divdeliveryToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
	
		
	function handleHttpalertResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divbusinessalertInfoToReturn').innerHTML = results;
				document.getElementById('divbusinessalertInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }	
		
	
	function handleHttpProposalalertResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divproposalalertInfoToReturn').innerHTML = results;
				document.getElementById('divproposalalertInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
		
	function handleHttpTimetrackerResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divtimetrackerInfoToReturn').innerHTML = results;
				document.getElementById('divtimetrackerInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
	
	
	
		
		function requestbusenquiryInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getenquirylisturl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
		
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpenquiryResponselist;
				http.send(null);
				showTop();
			}
                }
	
	
	function requestcomponentInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getcomponentlisturl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
			
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpcomponentResponselist;
				http.send(null);
				
				showTop();
			}
			
                }
	
	
		function requestrecordedmeetingInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getrecordedmeeturl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttprecordedmeetinglist;
				http.send(null);
				showTop();
			}
               }
	

	function requestdeliveryInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getdeliveryurl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpdeliverylist;
				http.send(null);
				showTop();
			}
               }


	function requestbusalertInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getalertlisturl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
			//alert(curl24);
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpalertResponselist;
				http.send(null);
				showTop();
			}
        }
	
	
		function requestproposalalertInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getproposalalertlisturl + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
			//alert(curl24);
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpProposalalertResponselist;
			http.send(null);
			showTop();
		 }
             }
	
	
	
	function requestddtimetrackerInfo(pagenum,n) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   //alert(n);
		   
		   if(sId>0)
		   {
			var curl24 = getdtimetrackerturl + escape(sId) +'&pagenum=' + pagenum +'&n=' + n + "&random=" + Math.random();
			//alert(curl24);
			http.open("GET", curl24, true);
			http.onreadystatechange = handleHttpTimetrackerResponselist;
			http.send(null);
			showTop();
		 }
             }
	
	
	
	var getpms = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getpms'+"&bus_id="; // The server-side script
	
	function handleHttpmoneyResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ document.getElementById('divbusinessmoneyInfoToReturn').innerHTML = results;
				document.getElementById('divbusinessmoneyInfoToReturn').style.visibility = 'visible';
				closeTop();
				
				}
            }
          }
        }
		
		function requestmoneyInfo(pagenum) {   
		
		   var sId = document.getElementById("bus_id").value;
		   
		   if(sId>0)
		   {
			var curl24 = getpms + escape(sId) +'&pagenum=' + pagenum+ "&random=" + Math.random();
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpmoneyResponselist;
				http.send(null);
				showTop();
			}
        }
	

<!--E Log function Start-->
var geteloglisturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showelog'+"&bus_id="; // The server-side script
	
	function handleHttpelogResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results)
			  	{
					document.getElementById('divtruelog').innerHTML = results;
					document.getElementById('divtruelog').style.visibility = 'visible';
				closeTop();	
				}
            }
          }
        }
		
		function requestbuselogInfo(pagenum) {   
		   var sId = document.getElementById("bus_id").value;
		 
		   if(sId>0)
		   {
		   
				curl24 = geteloglisturl + escape(sId) + '&pagenum=' + pagenum+ "&random=" + Math.random();
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpelogResponselist;
				http.send(null);
				showTop();
			}
        }	

function responseElogdelete()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			if(result)
			{
			requestbuselogInfo(1);
			closeTop();
			}
		}
	}
}		
		
function requestelogDelete(id)
		{	
				if(id)
				{
					var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showelogdelete' + '&id=' + id + "&random=" + Math.random();	
					alert(commonurl);		
					http.open('GET',commonurl,true);
					http.onreadystatechange = responseElogdelete;
					http.send(null);
					showTop();
				}
		}		



function responsepmsdelete()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			if(result)
			{
			requestmoneyInfo(1);
			closeTop();
			}
		}
	}
}
		
function requestpmsDelete(id)		
				{
			if(id)
				{
					var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'deletepms' + '&pm_id=' + id + "&random=" + Math.random();	
					http.open('GET',commonurl,true);
					http.onreadystatechange = responsepmsdelete;
					http.send(null);
					showTop();
				}
				}		
		
<!--E Log function End-->


	var getquestionlisturl = "{{$BASE_URL}}{{$XFA.businessqa_list}}?bs_id="; // The server-side script
	function handleHttpqaResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results)
			  	{
					document.getElementById('divqalist').innerHTML = results;
					document.getElementById('divqalist').style.visibility = 'visible';
				closeTop();	
				}
            }
          }
        }
		
		function requestquestionInfo(pagenum) {   
		   var sId = document.getElementById("bus_id").value;
		 
		   if(sId>0)
		   {
				curl24 = getquestionlisturl + escape(sId) + '&pagenum=' + pagenum+ "&random=" + Math.random();
				http.open("GET", curl24, true);
				http.onreadystatechange = handleHttpqaResponselist;
				http.send(null);
				showTop();
			}
        }	
	
			function requestquestionInfo2(pagenum) {   
		   var sId = document.getElementById("bus_id").value;
		 
		   if(sId>0)
		   {
				curl24 = getquestionlisturl + escape(sId) + '&pagenum=' + pagenum+ "&random=" + Math.random();
				document.getElementById('qaIframe_list').style.display = 'block';	
				document.getElementById('qaIframe_list').style.height = '300px';
				document.getElementById('qaIframe_list').style.border = '1px solid #999999';
				document.getElementById('qaIframe_list').src = curl24;
				showTop();
			}
        }
	
//qaIframe_list	
			
<!-- Begin Ajax Comman Functions -->
	
	<!-- Ajax common Url -->
		var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
	<!-- Ajax common Url -->
	<!-- Begin Current date/time -->
			function handleHttpResponcesetcur_date()
			{
				if(http.readyState == 4)
				{
					if(http.status == 200)
					{
						var result = ltrim(http.responseText)
						
						if(result!='')
						{
							var new_array = new Array();
							new_array = result.split('|');	
														
							var v1 = ltrim(new_array[0]);
							var v2 = ltrim(new_array[1]);
							var v3 = ltrim(new_array[2]);
							var v4 = ltrim(new_array[3]);

							document.getElementById(v1).value =  v2;
							document.getElementById(v3).value =  v4;
							closeTop();
						}
					}
				}
			}
			
			function setcur_date(a,b,c)
			{
				var getdateurl = getcurrenturl + escape(a) + "&b=" + escape(b) + "&c=" + escape(c) + "&random=" + Math.random();
				http.open("GET",getdateurl,true);
				http.onreadystatechange = handleHttpResponcesetcur_date;
				http.send(null);
				showTop();
			}
	
	
	function handleHttpResponseSetstates()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200 )
			{
				var resultStates = ltrim(http.responseText);
				
				if(resultStates!='')
				{
					document.getElementById("listofallbusinesses").style.visibility='visible';
					document.getElementById('listofallbusinesses').innerHTML = resultStates;
				}
				else
				{
					document.getElementById('listofallbusinesses').style.visibility = 'hidden';
					document.getElementById('listofallbusinesses').innerHTML = '';
					
				}
			}
		}
	}
	

	function getstates()
		{
			var suburbValue = document.getElementById('suburb').value;
			var getSuburb = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'subhurb' + "&suburbValue=" + escape(suburbValue) + "&random=" + Math.random();			
			http.open('GET',getSuburb, true);
			http.onreadystatechange = handleHttpResponseSetstates;
			http.send(null);
		}
	
	function setState(a,b,c,d)
		{
			var a = ltrim(a);
			var b = ltrim(b);
			var c = ltrim(c);
			var d = ltrim(d);
	
				document.getElementById('suburb').value = a;
				document.getElementById('state').value = b;
				document.getElementById('postcode').value = c;
				document.getElementById('suburb_id').value = d;
				
				document.getElementById("listofallbusinesses").style.visibility='hidden';
				document.getElementById('listofallbusinesses').innerHTML = '';
		}
	
<!-- End get State -->
<!-- End Ajax Comman Functions -->
	

<!----------------- RD - Business Tasks Setcion starts here---------------->
<!-- Begin Business Tasks -->	
	function responseAddTask()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
			var resultTask = http.responseText;
			
			document.getElementById('taskmsg').innerHTML = resultTask;
			requestAllTasks();
			closeTop();
			
			}
		}
	}


function responseAddTaskRenovation()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
			var resultTask = http.responseText;
			
			document.getElementById('taskmsg').innerHTML = resultTask;
			requestAllTasks();
			closeTop();
			
			}
		}
	}




	function requestAddTask()
	{	
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_status_id').value;
		
		if(bus_id == '')
		{
		
			document.getElementById('taskmsg').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else if(taskStatusId == '0')
		{
			document.getElementById('taskmsg').innerHTML = "Please select Task Status to be added.";
			return false;
		}
		else
		{
		
		var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addStatusTask' + "&bus_id=" + escape(bus_id) + "&taskStatusId=" + escape(taskStatusId) + "&random=" + Math.random();
			http.open("GET",addStatusTaskUrl,true);
			http.onreadystatechange = responseAddTask;
			http.send(null);
			showTop();			
		}
	}
<!-- End Business Tasks -->


<!--Add Proposal Task Start-->
	
	function responseAddTaskProposal()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
			var resultTask = http.responseText;
			
			document.getElementById('taskmsgproposal').innerHTML = resultTask;
			requestAllTasksProposal();
			closeTop();
			
			}
		}
	}


	function requestAddTaskProposal(n)
	{	
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_status_id').value;
		
		if(bus_id == '')
		{
		
			document.getElementById('taskmsgproposal').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else
		{
		
		var addStatusTaskUrl = "{{$BASE_URL}}business.common2?a_req=" + 'addStatusTask' + "&bus_id=" + escape(bus_id) + '&tasknum=' + n + "&random=" + Math.random();
		 alert(addStatusTaskUrl);  
		   
			http.open("GET",addStatusTaskUrl,true);
			http.onreadystatechange = responseAddTask;
			http.send(null);
			showTop();	
			  	
		}
	}
<!--Add Proposal Task End-->
	
	
function requestAddTaskRenovation(n)
	{	
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_status_id').value;
		
		if(bus_id == '')
		{
			document.getElementById('taskmsgrenovation').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else
		{
			var addStatusTaskUrl = "{{$BASE_URL}}business.common4?a_req=" + 'addStatusTask' + "&bus_id=" + escape(bus_id) + '&tasknum=' + n + "&random=" + Math.random();
		   	http.open("GET",addStatusTaskUrl,true);
			http.onreadystatechange = responseAddTaskRenovation;
			http.send(null);
			showTop();	
		}
	}
<!--Add Renovation Task End-->
	
		
	
<!-- Begin Fetch All project type tasks -->
	function responseAllptypeTasks()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				document.getElementById('AllptypeTaskDiv').innerHTML = result;
				closeTop();
				requestCountptypeTask();
			}
		}
	}

	function requestAllptypeTasks(pagenum)
	{
	
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_types_id = document.getElementById('bt_task_types_id').value;	
		if(bus_id>0)
		{
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskpStatus.length;
			var currentTaskStatus;
			for(var i=0; i<len; i++)
			{
				if(document.detail.taskpStatus[i].checked)
				{
					currentTaskStatus = document.detail.taskpStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllptypeTasks' + '&bus_id=' + bus_id+'&bt_task_types_id='+ bt_task_types_id + "&random=" + Math.random();

			if(currentTaskStatus =='0' || currentTaskStatus =='1')
			{
				 addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			
			ptperpage = document.getElementById('ptperpage').value;
			addStatusTaskUrl = addStatusTaskUrl + '&ptperpage=' + ptperpage;
			
			if(pagenum>0)
			{
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&ptperpage=' + perpage + "&random=" + Math.random();
			}

				http.open('GET',addStatusTaskUrl,true);
				http.onreadystatechange = responseAllptypeTasks;
				http.send(null);
				showTop();
		}
	}
	
	
<!-- End Fetch All tasks -->	
	
<!-- Begin - mark task as done -->
	function responseptypeTaskDone()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = http.responseText;
				document.getElementById('tasktypemsg').innerHTML = result;
				requestAllptypeTasks();
			}
		}
	}
	

	function requestptypeTaskDone(a)
	{
		var bt_id = a;
		
		if(bt_id>0)
		{
			if(!confirm("Are you sure want to Mark the task as DONE??"))
			{
				return false;
			}
			else
			{
				var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'markptypeTaskDone' + '&bt_id=' + bt_id + "&random=" + Math.random();

				http.open('GET',addStatusTaskUrl,true);
				http.onreadystatechange = responseptypeTaskDone;
				http.send(null);
			}
		}
	}
<!-- End - Mark task as Done -->	
	

<!-- Begin ReEdit the task manually -->

	function responseptypeTaskEdit()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = http.responseText;
				document.getElementById('editptypeTaskDiv').innerHTML = result;
				requestCountptypeTask();
				requestAllptypeTasks();
			}
		}
	}


	function requestptypeTaskEdit(a,b)
	{
		var taskId = a;	
		var taskAction = b;
			
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editptypeTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();

		if(taskAction == 'SaveEdit')
		{
			if(document.getElementById('bt_complete').checked)
			{
				var complete = 1;
			}
			else
			{
				var complete = 0;
			}
			
			var comment = document.getElementById('bt_comment').value;
			
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&random=" + Math.random();
		}
		if(taskAction == 'CloseEdit')
		{	
			document.getElementById('editptypeTaskDiv').innerHTML = '';
		}

		http.open('GET',commonUrl,true);
		http.onreadystatechange = responseptypeTaskEdit;
		http.send(null);
	}
	
<!-- Enf ReEdit the task manually -->	
	
<!-- Begin Project Tasks -->	
	function responseAddTypeTask()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
			var resultTask = http.responseText;
			
			document.getElementById('tasktypemsg').innerHTML = resultTask;
			requestAllptypeTasks();
			closeTop();
			
			}
		}
	}


	function requestAddtypeTask()
	{
	
		var bus_id = document.getElementById('bus_id').value;
		var taskStatusId = document.getElementById('bt_task_types_id').value;

		if(bus_id == '')
		{
			document.getElementById('tasktypemsg').innerHTML = "Please save business before adding the Tasks.";
			return false;
		}
		else if(taskStatusId == '0')
		{
			document.getElementById('tasktypemsg').innerHTML = "Please select task status to be added.";
			return false;
		}
		else
		{
		var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addTypeTask' + "&bus_id=" + escape(bus_id) + "&taskStatusId=" + escape(taskStatusId) + "&random=" + Math.random();
			http.open("GET",addStatusTaskUrl,true);
			http.onreadystatechange = responseAddTypeTask;
			http.send(null);
			showTop();			
		}
	}
	
	
	
<!-- End Project Tasks -->	
	
	
<!-- Begin Count tasks -->
	function responseCountTask()
		{
			if(http.readyState == 4)
			{
				if(http.status == 200)
				{
					var result  = http.responseText;
					document.getElementById('total_task').innerHTML = result;
				}
			}
		}
	
	
	function requestCountTask()
	{
		var bus_id = document.getElementById('bus_id').value;
		
		if(bus_id>0)
		{
			var countTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'countTask' + '&bus_id=' + bus_id + "&random=" + Math.random();
			
			http.open('GET',countTaskUrl,true);
			http.onreadystatechange = responseCountTask;
			http.send(null);
		}
		
	}
<!-- End Count tasks -->	
	
<!-- Begin project types Count tasks -->
	function responseCountptypeTask()
		{
			if(http.readyState == 4)
			{
				if(http.status == 200)
				{
					var result  = http.responseText;
					document.getElementById('total_ptypetask').innerHTML = result;
				}
			}
		}

	function requestCountptypeTask()
		{
			var bus_id = document.getElementById('bus_id').value;
			
			if(bus_id>0)
			{
				var countTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'countptypeTask' + '&bus_id=' + bus_id + "&random=" + Math.random();
				http.open('GET',countTaskUrl,true);
				http.onreadystatechange = responseCountptypeTask;
				http.send(null);
			}
			
		}
<!-- End project types Count tasks -->		
	
	
	
	
<!-- Begin Fetch All tasks -->
	function responseAllTasks()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				document.getElementById('AllTaskDiv').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal1()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal1').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal2()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal2').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal3()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal3').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal4()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal4').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal5()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal5').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal6()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal6').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}
	
	function responseAllTasksProposal7()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal7').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal8()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal8').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal9()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal9').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal10()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal10').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal11()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal11').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal12()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal12').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal13()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal13').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal14()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal14').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal15()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal15').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal16()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal16').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}



	function responseAllTasksProposal17()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal17').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}

	function responseAllTasksProposal18()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal18').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal19()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal19').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}


	function responseAllTasksProposal20()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result  = http.responseText;
				
				document.getElementById('AllTaskDivProposal20').innerHTML = result;
				closeTop();
				requestCountTask();
			}
		}
	}




	function requestAllTasks(pagenum)
	{
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_status_id = document.getElementById('bt_task_status_id').value;

		if(bus_id>0)
		{
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskStatus.length;
			var currentTaskStatus;
			for(var i=0; i<len; i++)
			{
				if(document.detail.taskStatus[i].checked)
				{
					currentTaskStatus = document.detail.taskStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			
			var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllTasks' + '&bus_id=' + bus_id +'&bt_task_status_id='+ bt_task_status_id +"&random=" + Math.random();
			
			if(currentTaskStatus =='0' || currentTaskStatus =='1')
			{
				 addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			
			perpage = document.getElementById('perpage').value;
			addStatusTaskUrl = addStatusTaskUrl + '&perpage=' + perpage;
			
			if(pagenum>0)
			{
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&perpage=' + perpage + "&random=" + Math.random();
			}
	
				http.open('GET',addStatusTaskUrl,true);
				http.onreadystatechange = responseAllTasks;
				http.send(null);
				showTop();
		}
	}
	

	function requestAllTasksProposal(pagenum,n)
	{
		
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_status_id = document.getElementById('bt_task_status_id').value;
		
				
		if(bus_id>0)
		{
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskStatus.length;
			var currentTaskStatus;
			for(var i=0; i<len; i++)
			{
				if(document.detail.taskStatus[i].checked)
				{
					currentTaskStatus = document.detail.taskStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			
             var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'getAllTasksProposal' + '&bus_id=' + bus_id +'&bt_task_list_number='+ n +"&random=" + Math.random();
				 
		     		  
			if(currentTaskStatus =='0' || currentTaskStatus =='1')
			{
				 addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			
			//perpage = document.getElementById('perpage').value;
			perpage = 100;
			addStatusTaskUrl = addStatusTaskUrl + '&perpage=' + perpage;
			
			if(pagenum>0)
			{
				
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&perpage=' + perpage + "&random=" + Math.random();
				
			}
	
				http.open('GET',addStatusTaskUrl,true);
				if(n==1) { http.onreadystatechange = responseAllTasksProposal1; }
				  else if(n==2) { http.onreadystatechange = responseAllTasksProposal2; }
				  else if(n==3) { http.onreadystatechange = responseAllTasksProposal3; }
				  else if(n==4) { http.onreadystatechange = responseAllTasksProposal4; }
				  else if(n==5) { http.onreadystatechange = responseAllTasksProposal5; }
				  else if(n==6) { http.onreadystatechange = responseAllTasksProposal6; }
				  else if(n==7) { http.onreadystatechange = responseAllTasksProposal7; }
				  else if(n==8) { http.onreadystatechange = responseAllTasksProposal8; }
				  else if(n==9) { http.onreadystatechange = responseAllTasksProposal9; }
				  else if(n==10) { http.onreadystatechange = responseAllTasksProposal10; }
				  else if(n==11) { http.onreadystatechange = responseAllTasksProposal11; }
				  else if(n==12) { http.onreadystatechange = responseAllTasksProposal12; }
				  else if(n==13) { http.onreadystatechange = responseAllTasksProposal13; }
				  else if(n==14) { http.onreadystatechange = responseAllTasksProposal14; }
				  else if(n==15) { http.onreadystatechange = responseAllTasksProposal15; }
				  else if(n==16) { http.onreadystatechange = responseAllTasksProposal16; }
				  else if(n==17) { http.onreadystatechange = responseAllTasksProposal17; }
				  else if(n==18) { http.onreadystatechange = responseAllTasksProposal18; }
				  else if(n==19) { http.onreadystatechange = responseAllTasksProposal19; }
				  else if(n==20) { http.onreadystatechange = responseAllTasksProposal20; }				  
				  
				  
				http.send(null);
				showTop();
		}
	}

	

	function requestAllTasksRenovation(pagenum,n)
	{
		
		var bus_id = document.getElementById('bus_id').value;
		var bt_task_status_id = document.getElementById('bt_task_status_id').value;
		
				
		if(bus_id>0)
		{
			/*** Begin get Radio box vale ***/
			var len = document.detail.taskStatus.length;
			var currentTaskStatus;
			for(var i=0; i<len; i++)
			{
				if(document.detail.taskStatus[i].checked)
				{
					currentTaskStatus = document.detail.taskStatus[i].value;
				}
			}
			/*** End get Radio box vale ***/
			
             var addStatusTaskUrl = "{{$BASE_URL}}business.common4?a_req=" + 'getAllTasksRenovation' + '&bus_id=' + bus_id +'&bt_task_list_number='+ n +"&random=" + Math.random();
				 
		     		  
			if(currentTaskStatus =='0' || currentTaskStatus =='1')
			{
				 addStatusTaskUrl = addStatusTaskUrl + "&cts=" + escape(currentTaskStatus);
			}
			
			//perpage = document.getElementById('perpage').value;
			perpage = 100;
			addStatusTaskUrl = addStatusTaskUrl + '&perpage=' + perpage;
			
			if(pagenum>0)
			{
				
				addStatusTaskUrl = addStatusTaskUrl + '&pagenum=' + pagenum + '&perpage=' + perpage + "&random=" + Math.random();
				
			}
	
				http.open('GET',addStatusTaskUrl,true);
				if(n==1) { http.onreadystatechange = responseAllTasksProposal1; }
				  else if(n==2) { http.onreadystatechange = responseAllTasksProposal2; }
				  else if(n==3) { http.onreadystatechange = responseAllTasksProposal3; }
				  else if(n==4) { http.onreadystatechange = responseAllTasksProposal4; }
				  else if(n==5) { http.onreadystatechange = responseAllTasksProposal5; }
						  
				  
				  
				http.send(null);
				showTop();
		}
	}	
	
	
<!-- End Fetch All tasks -->	
	
<!-- Begin - mark task as done -->
	function responseTaskDone()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = http.responseText;
				document.getElementById('taskmsg').innerHTML = result;
				requestAllTasks();

			}
		}
		
	}
	

	function requestTaskDone(a)
	{
		var bt_id = a;
		
		if(bt_id>0)
		{
			if(!confirm("Are you sure want to Mark the task as DONE??"))
			{
				return false;
			}
			else
			{
				var addStatusTaskUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'markTaskDone' + '&bt_id=' + bt_id + "&random=" + Math.random();
				http.open('GET',addStatusTaskUrl,true);
				http.onreadystatechange = responseTaskDone;
				http.send(null);
			}
		}
	}
	
	
	
<!-- End - Mark task as Done -->	
	

<!-- Begin ReEdit the task manually -->

	function responseTaskEdit()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = http.responseText;
				document.getElementById('editTaskDiv').innerHTML = result;
				requestAllTasks();
			}
		}
	}

	function responseTaskEditProposal()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = http.responseText;
				document.getElementById('editTaskDivProposal').innerHTML = result;
				requestAllTasksProposal();
			}
		}
	}

	function requestTaskEdit(a,b)
	{
		var taskId = a;	
		var taskAction = b;
			
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();
		
		if(taskAction == 'SaveEdit')
		{
			if(document.getElementById('bt_complete').checked)
			{
				var complete = 1;
			}
			else
			{
				var complete = 0;
			}
			
			var comment = document.getElementById('bt_comment').value;
			var date = document.getElementById('editTaskDate').value;
			
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&bt_completed_date=" + escape(date) + "&random=" + Math.random();
		}
		
		if(taskAction == 'CloseEdit')
		{	
			document.getElementById('editTaskDiv').innerHTML = '';
		}
		
		
		http.open('GET',commonUrl,true);
		http.onreadystatechange = responseTaskEdit;
		http.send(null);
	}
	
	
	
	function requestTaskEditProposal(a,b)
	{
		var taskId = a;	
		var taskAction = b;
			
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'editTask' + '&taskId=' + taskId + "&taskAction=" + escape(taskAction) + "&random=" + Math.random();
		
		if(taskAction == 'SaveEdit')
		{
			if(document.getElementById('bt_complete').checked)
			{
				var complete = 1;
			}
			else
			{
				var complete = 0;
			}
			
			var comment = document.getElementById('bt_comment').value;
			var date = document.getElementById('editTaskDate').value;
			
			commonUrl = commonUrl + "&complete=" + complete + "&comment=" + escape(comment) + "&bt_completed_date=" + escape(date) + "&random=" + Math.random();
		}
		
		if(taskAction == 'CloseEdit')
		{	
			document.getElementById('editTaskDivProposal').innerHTML = '';
		}
		
		
		http.open('GET',commonUrl,true);
		http.onreadystatechange = responseTaskEditProposal;
		http.send(null);
	}
	
	
<!-- Enf ReEdit the task manually -->
<!----------------- RD - Business Tasks Section Ends here---------------->



<!----------------- RD - Document Check List Begins here-------------->
function responseDocumentCheckList()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('DocumentCheckListDiv').innerHTML = http.responseText;
			closeTop();
		}
	}
}

function responsePPCheckList()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('PPCheckListDiv').innerHTML = http.responseText;
			closeTop();
		}
	}
}

function responseEntitiesList()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('EntitiesListDiv').innerHTML = http.responseText;
			closeTop();
		}
	}
}

function requestDocumentCheckList(a,b)
{

	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
		var addList = a;
		
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'DocumentCheckList' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responseDocumentCheckList;
		http.send(null);
		showTop();
	}
}

function requestPPCheckList(a,b)
{

	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
	   var addList = a;
		
	  var commonUrl = "{{$BASE_URL}}business.common_pp?a_req=" + 'PPCheckList' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responsePPCheckList;
		http.send(null);
		showTop();
	}
}

function requestEntitiesList(a,b)
{

	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
	   var addList = a;
		
	  var commonUrl = "{{$BASE_URL}}business.entities?a_req=" + 'EntityList' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responseEntitiesList;
		http.send(null);
		showTop();
	}
}

function requestchecklistEntitiesList(action_name,business_id,checklist_entities_referral_id,er_document,er_id,checklist_id)
{
    var bus_id =business_id;
	if(bus_id>0)
	{
		var iframeUrl = "{{$BASE_URL}}business.entities?action_name="+action_name+"&er_id="+er_id+"&checklist_id="+checklist_id+"&er_document="+er_document+"&checklist_entities_referral_id="+checklist_entities_referral_id+"&a_req=" + 'EntityList' + '&bus_id=' + bus_id + "&random=" + Math.random();
		$("#entitesListChecklist1").show("slow");
		document.getElementById('entitesListChecklist1').style.height = '300px';
		document.getElementById('entitesListChecklist1').style.display = 'block';
		document.getElementById('entitesListChecklist1').src = iframeUrl;
		showTop(action);
	}
	
}

function responsePurchaseOrder()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('PurchaseOrderDiv').innerHTML = http.responseText;
			closeTop();
		}
	}
}


function requestPurchseOrder(a,b)
{
      
	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
		var addList = a;
		
		if(b) {
var commonUrl = "{{$BASE_URL}}{{$XFA.common3}}?a_req=" + 'PurchaseOrder' + '&bus_id=' + bus_id + '&addList=' + addList + '&b=' + b + "&random=" + Math.random(); } else {
		var commonUrl = "{{$BASE_URL}}{{$XFA.common3}}?a_req=" + 'PurchaseOrder' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();	
			
		}
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responsePurchaseOrder;
		http.send(null);
		showTop();
	}
}
<!-- Financial-->

function responseDocumentCheckListFinancial()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('DocumentCheckListDiv_fin').innerHTML = http.responseText;
			closeTop();
		}
	}
}


function requestDocumentCheckListFinancial(a,b)
{

	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
		var addList = a;
		
		var commonUrl = "{{$BASE_URL}}business.common3?a_req=" + 'DocumentCheckList_fin' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responseDocumentCheckListFinancial;
		http.send(null);
		showTop();
	}
}


<!-- Financial Ends-->

<!----------------- RD - Document Check List Ends here---------------->

<!----------------- RD - Document Check List MIni Begins here-------------->
function responseDocumentCheckListMini()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('DocumentCheckListDivMini').innerHTML = http.responseText;
			closeTop();
		}
	}
}


function requestDocumentCheckListMini(a,b)
{
  
	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
		var addList = a;
		
		var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'DocumentCheckListMini' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responseDocumentCheckListMini;
		http.send(null);
		showTop();
	}
}


<!----------------- RD - Document Check List Mini Ends here---------------->


<!----------------- RD - Document Check List Renovation Begins here-------------->
function responseDocumentCheckListRenovation()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			document.getElementById('DocumentCheckListDivRenovation').innerHTML = http.responseText;
			closeTop();
		}
	}
}


function requestDocumentCheckListRenovation(a,b)
{
  
	var bus_id = document.getElementById('bus_id').value;
	if(bus_id>0)
	{
		var addList = a;
		
		var commonUrl = "{{$BASE_URL}}business.common4?a_req=" + 'DocumentCheckListRenovation' + '&bus_id=' + bus_id + '&addList=' + addList + "&random=" + Math.random();
		
		
		if(a == 'edit')
		{
			commonUrl = commonUrl + '&doc_id=' + b;
		}
		
		http.open("GET",commonUrl,true);
		http.onreadystatechange = responseDocumentCheckListRenovation;
		http.send(null);
		showTop();
	}
}


<!----------------- RD - Document Check List Renovation Ends here---------------->






<!---Begin RD - various Frame functions --->
	function iframeResponse()
	{
		
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = ltrim(http.responseText);
								
				if(result!='')
				{
				    console.log("result :: "+result);
				var iframedata = new Array();
				iframedata = result.split('||');
				var len = iframedata.length;

					if(len>0)
					{
						var v1 = iframedata[0];
						var v2 = iframedata[1];
						document.getElementById(v1).innerHTML = v2;
					}else
					{
					closeTop();
				return true;
					}
				}
				closeTop();
				return true;
			}
		}
	}
	

	function iframeRequest(divid,pagenum)
	{
		var bus_id = document.getElementById('bus_id').value;	
		if(bus_id > 0)
		{
			if(divid != '')
			{
					if(divid == 1)	
					{
						var docperpage = document.getElementById('docperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showdocuments' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
		
						commonUrl = commonUrl + '&divid=' + 'divbusinessdocInfoToReturn';
						//alert(commonUrl);
					}
				  if(divid == 2)	
					{
						var	imgperpage = document.getElementById('imgperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showimages' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&imgperpage=' + imgperpage + "&random=" + Math.random();
						commonUrl = commonUrl + '&divid=' + 'divImages';	
						
					}
				  if(divid == 3)	
					{
						var	docperpage = document.getElementById('intdocperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showintdocuments' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
											
						commonUrl = commonUrl + '&divid=' + 'divbusinessintdocInfoToReturn';
					}
				   if(divid == 4)	
					{
						var	padocperpage = document.getElementById('padocperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showpadocs' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&padocperpage=' + padocperpage + "&random=" + Math.random();
						commonUrl = commonUrl + '&divid=' + 'divbusinesspadocInfoToReturn';
							
					}
				if(divid == 5)	
					{
						var	panotesperpage = document.getElementById('panotesperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showpanotes' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&panotesperpage=' + panotesperpage + "&random=" + Math.random();
						commonUrl = commonUrl + '&divid=' + 'divbusinesspanotesInfoToReturn';	
					}
						
				if(divid == 6)	
					{
						var docperpage_fin = document.getElementById('docperpage_fin').value;
						var commonUrl = "{{$BASE_URL}}business.common3?a_req=" + 'showdocuments_fin' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage_fin + "&random=" + Math.random();
		
						commonUrl = commonUrl + '&divid=' + 'divbusinessdocInfoToReturn_fin';
					}		
					
					
					if(divid == 7)	
					{
						var docperpage = document.getElementById('docperpage').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showspecial' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
		
						commonUrl = commonUrl + '&divid=' + 'divspecialcondition';
						//alert(commonUrl);
					}
					
					if(divid == 8)	
					{
						var docperpage = document.getElementById('docperpage_var').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showvariations' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
		
						commonUrl = commonUrl + '&divid=' + 'divvariations';
						
					}
													
					http.open('GET',commonUrl,true);
					http.onreadystatechange = iframeResponse;
					http.send(null);
					showTop();
					
					if(divid == 9)	
					{
						var docperpage = document.getElementById('docperpage_dp').value;
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showdesignplan' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
		
						commonUrl = commonUrl + '&divid=' + 'divdesignplan';
						
					}
					
					
					if(divid == 10)	
					{
						
						var docperpage = document.getElementById('docperpage_lmp').value;
						
						var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showlmpplan' + "&bus_id=" + bus_id + "&pagenum=" + pagenum + '&docperpage=' + docperpage + "&random=" + Math.random();
			
						commonUrl = commonUrl + '&divid=' + 'divlmp';
					
								}
								
																
								http.open('GET',commonUrl,true);
								http.onreadystatechange = iframeResponse;
								http.send(null);
								showTop();
					
					
					
			}
		}
	}
<!---End RD - various Frame functions --->

<!-- Begin Common Iframe Function for Common.php -->
function RequestcheckListIframe(action,tableid,divid,pagenum)
	{
		
		var bus_id = document.getElementById('bus_id').value;
			
		if(action == 'quotes')
		{
			var doc_id = tableid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + action + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#quoteIframe").show("slow");
			document.getElementById('quoteIframe').style.height = '1140px';
			document.getElementById('quoteIframe').style.display = 'block';
			document.getElementById('quoteIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'checklist')
		{
			var doc_id = tableid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'checklist' + '&doc_id=' + doc_id  + "&random=" + Math.random();
			$("#checkListIframe").show("slow");
			document.getElementById('checkListIframe').style.height = '400px';
			document.getElementById('checkListIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'purchase')
		{
			var po_id = tableid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common3}}?a_req=" + 'purchase' + '&po_id=' + po_id  + "&random=" + Math.random();
			$("#purchaseIframe").show("slow");
			document.getElementById('purchaseIframe').style.height = '300px';
			document.getElementById('purchaseIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'checklistfinancial')
		{
			var doc_id = tableid;
			var iframeUrl = "{{$BASE_URL}}business.common3?a_req=" + 'checklist_fin' + '&doc_id=' + doc_id  + "&random=" + Math.random();
			$("#checkListIframe_fin").show("slow");
			document.getElementById('checkListIframe_fin').style.height = '300px';
			document.getElementById('checkListIframe_fin').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'checklistmini')
		{
			var doc_id = tableid;
			
			if(divid > 0 ) { var chknm = divid; }
			
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'checklistmini' + '&doc_id=' + doc_id + '&chknm=' + chknm + "&random=" + Math.random();
			$("#checkListIframeMini").show("slow");
			document.getElementById('checkListIframeMini').style.height = '300px';
			document.getElementById('checkListIframeMini').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'checklistrenovation')
		{
			var doc_id = tableid;
			
			if(divid > 0 ) { var chknm = divid; }
			
			var iframeUrl = "{{$BASE_URL}}business.common4?a_req=" + 'checklistrenovation' + '&doc_id=' + doc_id + '&chknm=' + chknm + "&random=" + Math.random();
			$("#checkListIframeRenovation").show("slow");
			document.getElementById('checkListIframeRenovation').style.height = '300px';
			document.getElementById('checkListIframeRenovation').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'adddoc_checklistmini')
		{
			var doc_id = tableid;
			if(divid > 0 ) { var chknm = divid; }
			
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'adddoc_checklistmini' + '&doc_id=' + doc_id + '&chknm=' + chknm + '&bus_id=' + bus_id +"&random=" + Math.random();
			
	
			$("#adddoc_checkListIframeMini").show("slow");
			document.getElementById('adddoc_checkListIframeMini').style.height = '300px';
			document.getElementById('adddoc_checkListIframeMini').src = iframeUrl;
			showTop(action);
		}
		
		
		if(action == 'adddoc_checklistrenovation')
		{
			var doc_id = tableid;
			if(divid > 0 ) { var chknm = divid; }
			
			var iframeUrl = "{{$BASE_URL}}business.common4?a_req=" + 'adddoc_checklistrenovation' + '&doc_id=' + doc_id + '&chknm=' + chknm + '&bus_id=' + bus_id +"&random=" + Math.random();
			
	
			$("#adddoc_checkListIframeMini").show("slow");
			document.getElementById('adddoc_checkListIframeRenovation').style.height = '300px';
			document.getElementById('adddoc_checkListIframeRenovation').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'cchecklist')
		{
			var doc_id = tableid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cchecklist' + '&doc_id=' + doc_id  + "&random=" + Math.random();
			$("#cdocumentsIframe1").show("slow");
			document.getElementById('cdocumentsIframe1').style.height = '325px';
			document.getElementById('cdocumentsIframe1').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'documents')
		{
			var divid = divid;		
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'documents' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#documentsIframe").show("slow");
			document.getElementById('documentsIframe').style.height = '300px';			
			document.getElementById('documentsIframe').src = iframeUrl;
			showTop(action);
		}	
		
		
		
		
		if(action == 'adddocuments')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'documents' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#adddocumentsIframe").show("slow");
			document.getElementById('adddocumentsIframe').style.height = '370px';
			document.getElementById('adddocumentsIframe').src = iframeUrl;
			showTop(action);
		}	
		
		
		if(action == 'addspecialcondition')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addspecialcondition' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#addspIframe").show("slow");
			document.getElementById('addspIframe').style.height = '300px';
			document.getElementById('addspIframe').src = iframeUrl;
			showTop(action);
		}	
		
		if(action == 'addvariations')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addvariations' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#addvariationsIframe").show("slow");
			document.getElementById('addvariationsIframe').style.height = '300px';
			document.getElementById('addvariationsIframe').src = iframeUrl;
			showTop(action);
		}	
		
		if(action == 'adddesignplan')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'adddesignplan' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#adddesignplanIframe").show("slow");
			document.getElementById('adddesignplanIframe').style.height = '300px';
			document.getElementById('adddesignplanIframe').src = iframeUrl;
			showTop(action);
		}	
		
		
		if(action == 'addlmp')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'addlmp' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#addlmpIframe").show("slow");
			document.getElementById('addlmpIframe').style.height = '300px';
			document.getElementById('addlmpIframe').src = iframeUrl;
			showTop(action);
		}	
		
		if(action == 'adddocuments_fin')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}business.common3?a_req=" + 'documents_fin' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#adddocumentsIframe_fin").show("slow");
			document.getElementById('adddocumentsIframe_fin').style.height = '370px';
			document.getElementById('adddocumentsIframe_fin').src = iframeUrl;
			showTop(action);
		}
		
		
		if(action == 'intdocuments')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'intdocuments' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#intdocumentsIframe").show("slow");
			document.getElementById('intdocumentsIframe').style.height = '300px';
			document.getElementById('intdocumentsIframe').src = iframeUrl;
			showTop(action);
		}	
		
		if(action == 'images')
		{
			var divid = divid;		
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'images' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#imagesIframe").show("slow");
			document.getElementById('imagesIframe').style.height = '210px';
			document.getElementById('imagesIframe').src = iframeUrl;
			showTop(action);
		}	
		
	if(action == 'padocuments')
		{
			var divid = divid;		
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'padocuments' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#padocumentsIframe").show("slow");
			document.getElementById('padocumentsIframe').style.height = '250px';
			document.getElementById('padocumentsIframe').src = iframeUrl;
			showTop(action);
		}	
		
		if(action == 'cdocuments')
		{
			var divid = divid;		
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cdocuments' + '&bus_id=' + bus_id + '&divid=' + 'divbusinesspadocInfoToReturn1' + "&pagenum=" + pagenum + "&random=" + Math.random();
				
			$("#cdocumentsIframe").show("slow");
			document.getElementById('cdocumentsIframe').style.height = '300px';
			document.getElementById('cdocumentsIframe').src = iframeUrl;
			showTop(action);
		}

	if(action == 'dedocuments')
		{
			var docid = tableid;
			var cdata = divid;	
			
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'cdocuments' + '&bus_id=' + bus_id + '&divid=' + 'divbusinesspadocInfoToReturn1' + "&pagenum=" + pagenum + "&docid=" + docid + "&cdata=" + cdata + "&random=" + Math.random();
				
			$("#cdocumentsIframe").show("slow");
			document.getElementById('cdocumentsIframe').style.height = '300px';
			document.getElementById('cdocumentsIframe').src = iframeUrl;
			showTop(action);
		}

		if(action == 'nwen')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'nwen' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#nwenIframe").show("slow");
			document.getElementById('nwenIframe').style.height = '657px';
			document.getElementById('nwenIframe').src = iframeUrl;
			showTop(action);
		}	

		if(action == 'panotes')
		{
			var divid = divid;		
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'panotes' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#panotesIframe").show("slow");
			document.getElementById('panotesIframe').style.height = '210px';
			document.getElementById('panotesIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'truelog')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'truelog' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#truelogIframe").show("slow");
			document.getElementById('truelogIframe').style.height = '1000px';
			document.getElementById('truelogIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'addcomponent')
		{
			
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common3}}?a_req=" + 'component' + '&bus_id=' + bus_id + '&divid=' + divid + '&tableid=' + tableid + "&random=" + Math.random();
			$("#addcomponentIframe").show("slow");
			document.getElementById('addcomponentIframe').style.height = '300px';
			document.getElementById('addcomponentIframe').src = iframeUrl;
			showTop(action);
		}
		
		if(action == 'ppchecklist')
		{
			var doc_id = tableid;
			var iframeUrl = "{{$BASE_URL}}business.common_pp?a_req=" + 'ppchecklist' + '&pc_id=' + doc_id  + "&random=" + Math.random();
			$("#ppcheckListIframe").show("slow");
			document.getElementById('ppcheckListIframe').style.height = '400px';
			document.getElementById('ppcheckListIframe').src = iframeUrl;
			showTop(action);
		}
			
	}
<!-- End Common Iframe Function for Comman.php -->

<!-- Begin Delete document -->
function responseDeleteDocument()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = ltrim(http.responseText);
			if(result!='')
			{
			
				var temp = new Array();
				temp = result.split('||');
 				
				var len = temp.length;
				
				if(len>0)
				{
					var a = temp[0];
					var b = temp[1];
					
				
					iframeRequest(a);
				}
				else
				{
					iframeRequest(1);
					iframeRequest(2);
				}
			}
		}
	}
}

	function requestDeleteDocument(tableid,id)
		{
			if(id == 1)
			{
				var a = confirm("Are you sure want to delete this Document?");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			
			if(id == 3)
			{
				var a = confirm("Are you sure want to delete this Document??");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			
			
			if(id == 2)
			{
				var a = confirm("Are you sure want to delete this Image??");
				if(a){ var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_image' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			
			if(id == 4)
			{
				var a = confirm("Are you sure want to delete?");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_padocs' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random();	}
			}
			
			if(id == 5)
			{
				var a = confirm("Are you sure want to delete?");
				if(a){ var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_pnotes' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random();	}
			}
			
			if(id == 6)
			{
				var a = confirm("Are you sure want to delete this Document?");
				if(a){	var deleteUrl = "{{$BASE_URL}}business.common3?a_req=" + 'delete_document_fin' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			
			if(id == 7)
			{
				var a = confirm("Are you sure want to delete this Document?");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document_sp' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
			
			if(id == 8)
			{
				var a = confirm("Are you sure want to delete this Document?");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document_var' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}
		
		if(id == 9)
			{
				var a = confirm("Are you sure want to delete this Document?");
				if(a){	var deleteUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'delete_document_dp' + '&tableid=' + tableid + '&id=' + id + "&random=" + Math.random(); }
			}	
			
			http.open('GET',deleteUrl,true);
			http.onreadystatechange = responseDeleteDocument;
			http.send(null);
		}
<!-- End Delete document -->

<!-- Begin Comman Function to hide div -->
function hideiFrame(id,msg)
	{
		$("#"+id).hide("slow");
		
	if(msg!='')
		{
			alert(ltrim(msg));
		}
	}
<!-- End Comman Function to hide div -->


<!-- Begin Add Seller -->
function responseShowSellersDiv()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = ltrim(http.responseText);
			document.getElementById('showSellersDiv').innerHTML = result;
		}
	}
}


function requestSellersDiv()
{	
		var bus_id = {{$detail.$ID|default:0}} ;
		if(bus_id>0)
		{
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'showSeller' + '&bus_id=' + bus_id + "&random=" + Math.random();
	
			http.open('GET',commonurl,true);
			http.onreadystatechange = responseShowSellersDiv;
			http.send(null);
		}
}
<!-- End Add Seller -->


<!-- Begin Add OC -->
function responseShowOCDiv()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			document.getElementById('divotherContactToReturn').innerHTML = result;
			closeTop();
		}
	}
}


function requestOthercontactDiv(page)
{	
		var bus_id = document.getElementById('bus_id').value;
		if(bus_id>0)
		{
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'othercontact' + '&bus_id=' + bus_id + '&pnum=' + page + "&random=" + Math.random();
			http.open('GET',commonurl,true);
			http.onreadystatechange = responseShowOCDiv;
			http.send(null);
			showTop();
		}
}
<!-- End Add OC -->

<!-- Begin Add OC -->
function responseShowADDiv()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			document.getElementById('divadvertsToReturn').innerHTML = result;
			closeTop();
		}
	}
}


<!-- Begin Addvert -->
function requestadvertsDiv(page)
{	
		var bus_id = document.getElementById('bus_id').value;
		if(bus_id>0)
		{
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'adverts' + '&bus_id=' + bus_id + '&pnum=' + page + "&random=" + Math.random();
			http.open('GET',commonurl,true);
			http.onreadystatechange = responseShowADDiv;
			http.send(null);
			showTop();
		}
}

function requestOthercontactDelete(id)
		{	
				if(id)
				{
					var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'othercontactdelete' + '&id=' + id + "&random=" + Math.random();
					http.open('GET',commonurl,true);
					http.onreadystatechange = responseShowOCdelete;
					http.send(null);
					showTop();
				}
		}
<!-- End Add Advert -->



<!-- Begin Price Ranges -->
function responseShowPRDiv()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			document.getElementById('divprToReturn').innerHTML = result;
			closeTop();
		}
	}
}

function requestpricerangeDiv(page)
{	
		var bus_id = document.getElementById('bus_id').value;
		if(bus_id>0)
		{
			var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'pricerange' + '&bus_id=' + bus_id + '&pnum=' + page + "&random=" + Math.random();
			http.open('GET',commonurl,true);
			http.onreadystatechange = responseShowPRDiv;
			http.send(null);
			showTop();
		}
}

function requestpricerangeDelete(id)
		{	
				if(id)
				{
					var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'othercontactdelete' + '&id=' + id + "&random=" + Math.random();
					http.open('GET',commonurl,true);
					http.onreadystatechange = responseShowOCdelete;
					http.send(null);
					showTop();
				}
		}
<!-- End Price Ranges -->



<!-- Begin Delete OC -->
function responseShowAdvertdelete()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = http.responseText;
			if(result)
			{
			requestadvertsDiv(1);
			closeTop();
			}
		}
	}
}

function requestAdvertDelete(id)
		{	
				if(id)
				{
					var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'advertdelete' + '&id=' + id + "&random=" + Math.random();			
					http.open('GET',commonurl,true);
					http.onreadystatechange = responseShowAdvertdelete;
					http.send(null);
					showTop();
				}
		}
<!-- End Delete OC -->



	
<!-- Begin Quick View -->
function responseQuickView()
{
	if(http.readyState == 4)
	{
		if(http.status == 200)
		{
			var result = ltrim(http.responseText);
			document.getElementById('showQuickView').innerHTML = result;
		}
	}
}


function requestQuickView(id)
{
	var bcust_id = id;
	
	var commonurl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + 'quickView' + '&bcust_id=' + bcust_id + "&random=" + Math.random();
	http.open('GET',commonurl,true);
	http.onreadystatechange = responseQuickView;
	http.send(null);
}
function iframe2(a,b) {
toggleLayer0pen('businesscistenquiry','addcust');
document.getElementById('customerinfo').src=b;
showTop();
}

function iframe3(a,b) {
toggleLayer0pen('divimageadd','addfile');
document.getElementById('fileupload').src=b;
showTop();
}

function iframe4(a,b) {
toggleLayer0pen('dividocadd','adddoc');
var d ="{{$BASE_URL}}{{$XFA.document}}/bd_id/" +b;
document.getElementById('docupload').src=d;
showTop();
}

function iframe5(a,b) {

toggleLayer0pen('divbyersaleenquiry','addenq');
var d ="{{$BASE_URL}}{{$XFA.msteam_detail}}/buse_id/" +b;
document.getElementById('businessenquiry').src=d;
showTop();
}

function iframe55(a,b) {
	
toggleLayer0pen('divbyersaleenquiry_c','addenq');
var d ="{{$BASE_URL}}business.custom_component/buse_id/" +b;

document.getElementById('businessenquiry_c').src=d;
showTop();
}

function iframe6(a,b) {
toggleLayer0pen('divbyeralert','addalert');
var d ="{{$BASE_URL}}{{$XFA.businessalert_detail}}/buse_id/" +b;
document.getElementById('businessalert').src=d;
showTop();
}

function iframe8(a,b) {
toggleLayer0pen('divproposalalert','addproposalalert');
var d ="{{$BASE_URL}}{{$XFA.proposalalert_detail}}/buse_id/" +b;
document.getElementById('proposalalert').src=d;
showTop();
}

function iframe9(a,b) {
toggleLayer0pen('divtimetracker','addtimetrackeralert');
var d ="{{$BASE_URL}}business.timetracker_detail/buse_id/" +b;
document.getElementById('timetracker').src=d;
showTop();
}

function iframe7(a,b) {
toggleLayer0pen('divrecordedmeeting','addrecmeet');
var d ="{{$BASE_URL}}{{$XFA.meeting_recording_detail}}/buse_id/" +b;
document.getElementById('recordedmeeting').src=d;
showTop();
}


function iframe10(a,b) {
toggleLayer0pen('divdelivery','adddelivery');
var d ="{{$BASE_URL}}business.delivery_detail/buse_id/" +b;
document.getElementById('deliverydata').src=d;
showTop();
}

function iframeqa(b,id) {
toggleLayer0pen('divaqsection','addqa');
var d ="{{$BASE_URL}}{{$XFA.businessqa_detail}}/bqa_id/" +b+"/id/"+id;
document.getElementById('qaIframe').src=d;
showTop();
}

function iframebm(b) {
toggleLayer0pen('divbmsection','addqa');
var d ="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/" +b;
document.getElementById('bmIframe').style.height = '355px';
document.getElementById('bmIframe').src=d;
showTop();
}

function add_edit_seller(v)			
				{
				var id = v;
				var framesrc = '{{$BASE_URL}}{{$XFA.home}}/bsn_id/{{$detail.$ID}}/bs_id/' + v;
				document.getElementById('customerinfo').src = framesrc;
				toggleLayer('businesscistenquiry','addcust');
				}
function add_edit_file(v)			
				{
				document.getElementById('fileupload').src='{{$BASE_URL}}{{$XFA.upload}}/bsn_id/{{$detail.$ID}}';
				toggleLayer('divimageadd','addfile');
				}
function add_edit_doc(v)			
				{
				document.getElementById('docupload').src='{{$BASE_URL}}{{$XFA.document}}/bsn_id/{{$detail.$ID}}';
				toggleLayer('dividocadd','adddoc');
				}	

function add_edit_ms_team(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('businessenquiry').src='{{$BASE_URL}}{{$XFA.msteam_detail}}/bsn_id/{{$detail.$ID}}';
						toggleLayer('divbyersaleenquiry','addenq');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}	

function add_edit_component(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('businessenquiry_c').src='{{$BASE_URL}}business.custom_component/bsn_id/{{$detail.$ID}}';
						toggleLayer('divbyersaleenquiry_c','addenq');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
					 
				}




       function add_edit_recording_meetings(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('recordedmeeting').src='{{$BASE_URL}}{{$XFA.meeting_recording_detail}}/bsn_id/{{$detail.$ID}}';
						toggleLayer('divrecordedmeeting','addrecmeet');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}
				
	 function add_edit_delivery(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('deliverydata').src='{{$BASE_URL}}business.delivery_detail/bsn_id/{{$detail.$ID}}';
						toggleLayer('divdelivery','adddelivery');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}
				
				
	function add_edit_business_alerts(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('businessalert').src='{{$BASE_URL}}{{$XFA.businessalert_detail}}/bsn_id/{{$detail.$ID}}';
						toggleLayer('divbyeralert','addalert');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}
				

	function add_edit_proposal_alerts(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('proposalalert').src='{{$BASE_URL}}{{$XFA.proposalalert_detail}}/bsn_id/{{$detail.$ID}}';
						toggleLayer('divproposalalert','addproposalalert');
						document.getElementById('error').innerHTML = "";
						//requestproposalalertInfo(1);
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
					
				}


	function add_edit_time_tracker(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('timetracker').src='{{$BASE_URL}}business.timetracker_detail/bsn_id/{{$detail.$ID}}';
						toggleLayer('divtimetracker','addtimetrackeralert');
						document.getElementById('error').innerHTML = "";
						//requestproposalalertInfo(1);
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
					
				}


				
function add_edit_money(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('businessmoney').src='{{$BASE_URL}}{{$XFA.money}}/bsn_id/{{$detail.$ID}}/pm_id/'+v;
						
						if(v)
							{
								toggleLayer0pen('divmoney','addadvert');
							}else{
								toggleLayer('divmoney','addadvert');
							}
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}

function add_edit_adverts(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				showTop();
					if(bus_id>0)
					{			
						document.getElementById('divAdverts').src='{{$BASE_URL}}{{$XFA.advert}}/bsn_id/{{$detail.$ID}}/sl_id/'+v;
						
						if(v)
							{
								toggleLayer0pen('divAdvert','addadvert');
							}else{
								toggleLayer('divAdvert','addadvert');
							}		
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}	


	
function add_edit_othercontact(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				showTop();
					if(bus_id>0)
					{
						document.getElementById('othercontact').src='{{$BASE_URL}}{{$XFA.businesscontact_detail}}/bsn_id/{{$detail.$ID}}/oc_id/'+v;
						if(v)
							{
								toggleLayer0pen('divothercontact','addcontact');
							}else{
								toggleLayer('divothercontact','addcontact');
							}
						document.getElementById('error').innerHTML = "";
						
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}	
	
function add_edit_business_QA(v)			
				{
				var bus_id = document.getElementById('bus_id').value;
				
					if(bus_id>0)
					{
						document.getElementById('qaIframe').src='{{$BASE_URL}}{{$XFA.businessqa_detail}}/bsn_id/{{$detail.$ID}}';
						toggleLayer('divaqsection','addqa');
						document.getElementById('error').innerHTML = "";
					}
					else
					{
						document.getElementById('error').innerHTML = "Please save business and try again.";
					}
				}	
	

				
function confirmation() {
	var answer1 = confirm("Are you sure want to delete this business from database?? \n\n It will delete all data related  to this business from database and will not be rollback!")
	if (answer1){
		var answer2 = confirm("Please click OK to delete this Business.")
		if(answer2)
		{
			var bus_id = document.getElementById('bus_id').value;
			window.location = "{{$BASE_URL}}{{$XFA.delete_business}}/bus_id/" + bus_id;
		}
		else
		{
			alert("Operation Aborted. \n\n This Business isn't deleted.")
		}
	}
	else
	{
		alert("Operation Aborted. \n\n This Business isn't deleted.")
	}
}				
		
<!-- End Quick View -->	
		
<!-- Begin Ajax comman XMLHttpRequest -->				
		function getHTTPObject() {
		  var xmlhttp;
		
		  if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		  }
		  else if (window.ActiveXObject){
		
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlhttp){
				xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
		  return xmlhttp; 
		}
		var http = getHTTPObject(); //We create the HTTP Object
<!-- End Ajax comman XMLHttpRequest -->	


function onload_items()
{
	
	setTimeout('requestsellerInfo(1);', 1000);

}
window.onload = onload_items;
		function popup2(url) 
				{
				 params  = 'width='+screen.width/1.5;
				 params += ', height='+screen.height/1.5;
				 params += ', top=0, left=0';
				 params += ', scrolling=yes';
				 params += ', fullscreen=no';
				 params += ', scrollbars=yes';
				 params += ', menubars=yes';
				 newwin=window.open(url,'windowname4', params);
				 if (window.focus) {newwin.focus()}
				 return false;
				}
		
		function print_report()
				{
				bnid = document.detail.bsn_id.value;
				opt = document.detail.report_opt.value;
				url = '{{$BASE_URL}}{{$XFA.report}}' + '/bsn_id/'+ bnid + '/opt/'+ opt;
				if(opt !== 0)
					{	
					popup2(url);
					}
				}
				
		function print_sales_follow_up()
				{
				bnid = document.detail.bsn_id.value;
				opt = document.detail.report_opt.value;
				url = '{{$BASE_URL}}business.print_sales_follow_up' + '/bsn_id/'+ bnid + '/opt/'+ opt;
				if(opt !== 0)
					{	
					popup2(url);
					}
				}		
				
       </script>
       
 <script language="javascript">
	   
	    function update_sp_status(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_sp_status/sp_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
		
		 function update_va_status(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_va_status/va_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
		
		 function update_va_dc(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_va_dc/va_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
		
		
		function update_invoice_created(id,value)
		{
		
		 var tana10 = "#ic"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_invoice_created/va_id/"+id+"/value/"+value,
				   success: function(result){
					   $(tana10).html(result);
			   }
			 });
		}
		
		function update_va_signed_date(id,value)
		{
				 
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_va_signed_date/va_id/"+id+"/value/"+value,
				   success: function(result){
					  
			   }
			 });
		}	

		function update_variation_in_progress(id, value) {
			var val = 0;
			if (value == true) { val = 1; }
			if (value == false) { val = 0; }
			$.ajax({
				type: "GET",
				url: "{{$BASE_URL}}business.update_variation_in_progress/va_id/" + id + "/value/" + value,
				success: function (result) {
				}
			});
		}		
	</script>      
	<script>
		function updateProposalAlert(record_id, c, t) {
			// console.log(record_id, c, t);
			const allCheckElements = $('.' + c + record_id);
			let activeStatus = 0;
			if ($(t).is(":checked")) {
				activeStatus = 1;
				allCheckElements.attr('checked', 'checked');
			}
			else {
				allCheckElements.removeAttr('checked');
			}
			const formData = {
				r_ID: record_id,
				column: c,
				flag: activeStatus,
				action: "update_proposal_alert"
			};
			console.log(formData);
			$.ajax({
				type: "POST",
				url: "{{$BASE_URL}}business.ajax_handler",
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
			})
		}

		function updateDocumentChecklist(this_id, key, value, update_id = '') {
			// console.log(this_id, key, value, update_id);
			// return false;
			const formData = {
				this_id: this_id,
				key: key,
				value: value,
				action: "update_document_checklist"
			};
			console.log(formData);
			$.ajax({
				type: "POST",
				url: "{{$BASE_URL}}business.ajax_handler",
				data: formData,
				dataType: "json",
				encode: true,
				success: function (data) {
					// console.log(data, data.success);
					if (data.success) {
						if(update_id != '') {
							$(update_id).html(data.message);
						}
					}
					else {
						alert('Some problem in updating the record');
					}
				}
			})
		}

		const doc_qr_code_upload = '{{$doc_qr_code_upload}}';
		console.log(doc_qr_code_upload);
		if(doc_qr_code_upload != '') {
			requestDocumentCheckList('add');
		}
	</script>
       
       
       
{{if $buyer_enquiry}}
<script type="text/javascript">		
setTimeout('requestbusenquiryInfo(1);', 2200);			
setTimeout('iframe5("businessenquiers", "{{$buyer_enquiry}}");', 2500);
</script>
{{/if}}
<div align="center" style="background-color:#FFFFFF;">
<h3 class="page-title">{{$title}}</h3>
{{if !empty($delete_msg)}}
<div style="font-size:14px; font-weight:bold; color:#FF6600;">{{$delete_msg}}</div>
{{/if}}



<form name="detail" method="post" action="" enctype="multipart/form-data" id="pp">
  <table id="product-table" width="1450" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="10">
      <div style="border:1px solid gray; margin-bottom: 1em; padding-top:20px;">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="bus_id" />
          <tr>
            <th width="150" >Project Name:</th>
            <td><input type="text" autocomplete="off" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}" style="width:520px;" /></td>
           {{if $alert_data.total > 0}}
            <td><div style="background:#F00; width:400px; margin-right:10px; height:25px;"> &nbsp;</div></td>
           {{else}}
           <td></td>
           {{/if}} 
          </tr>
          <tr>
            <th colspan="3" align="left">
             <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td width="150">Project Status:</td>
                  <th> <!--<select name="{{$TABLE}}[bsn_status]" class="lrg" >
                      <option value="0" selected="selected"> -- select --</option>
                        {{foreach from=$business_status key="key" item="item"}}
                        <option value="{{$item.st_id}}" {{if $item.st_id == $detail.bsn_status}} selected="selected" {{/if}}> {{$item.st_name}}</option>  
                        {{/foreach}}
                    </select>-->
                           <div class="bsearch_scroll_div">
            <ul style="margin: 0; padding: 0;">
               {{foreach from=$business_status key="key" item="item"}}
 <li><input type="checkbox" name="{{$TABLE}}[bsn_status][]" value="{{$item.st_id}}" {{foreach from=$detail.bsn_status key="key1" item="item1"}}  {{if $item.st_id eq $item1}} checked="checked"  {{/if}}{{/foreach}}/> {{$item.st_name}}</li>
               {{/foreach}}
                             
           </ul>
       </div>
                    
                  </th>
                  <td width="270">Status Date:</td>
                  <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_status_date]" value="{{$detail.bsn_status_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" readonly="readonly"/>
                    &nbsp;
                    <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_status_time]" value="{{$detail.bsn_status_time}}" style="width:50px;"  id="bsn_status_time"  />
                    &nbsp;<a href="javascript:setcur_date('curdate','demo4','bsn_status_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>&nbsp;&nbsp;&nbsp;<b>Days at Status:&nbsp;&nbsp;&nbsp;{{$statusday}}</b></th>
                </tr>
                <tr>
                  <td valign="top">Project Sub Status:</td>
                  <th><select name="{{$TABLE}}[bsn_sub_status]" class="lrg" id="bsn_sub_status" >
                      <option value="Open" {{if $detail.bsn_sub_status == "Open"}} selected="selected" {{/if}}>Open</option>
                      <option value="Lost" {{if $detail.bsn_sub_status == "Lost"}} selected="selected" {{/if}}> Lost</option>  
      		      <option value="Hold" {{if $detail.bsn_sub_status == "Hold"}} selected="selected" {{/if}}> On Hold</option> 
                      <option value="Completed" {{if $detail.bsn_sub_status == "Completed"}} selected="selected" {{/if}}>Completed</option> 
                    </select><div id="bsn_sub" style="display:none;">
                    		 	<textarea rows="3" cols="70" name="{{$TABLE}}[bsn_cd_note]" >{{$detail.bsn_cd_note}}</textarea>	
                    		 </div>
                    <script type="text/javascript">
			 $("#bsn_sub_status").change(function() {  
				if($(this).val() == 'Lost'){
				$('#bsn_sub').show('slow');				
				}else{
				$('#bsn_sub').hide('slow');	
				}
				});		
                    </script>
               {{if $detail.bsn_sub_status == "Lost"}}
               <script type="text/javascript"> 
			   	$(document).ready(function(){
				$('#bsn_sub').show('slow');	
				});         
               </script>
               {{/if}}     
                     </th>
                  <td >Created Date:</td>
                  <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_status_sys_date]" value="{{$detail.bsn_status_sys_date}}" id="demo5" maxlength="25" {{if empty($detail.$ID)}} class="w16em dateformat-d-ds-m-ds-Y" {{/if}} readonly="readonly"/>
                    &nbsp;{{if !empty($detail.$ID)}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{/if}}
                    <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_status_sys_time]" value="{{$detail.bsn_status_sys_time}}" style="width:50px;"  id="bsn_status_sys_time" />&nbsp;{{if empty($detail.$ID)}}<a href="javascript:setcur_date('curdate','demo5','bsn_status_sys_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>{{/if}}&nbsp;&nbsp;<b>Days in System:&nbsp;&nbsp;&nbsp;{{$systemday}}</b></th>
                </tr>
                <tr>
                  <td>Project type:</td>
                  <th>
                  <select name="{{$TABLE}}[bsn_type]" class="lrg" >
                      <option value="0" selected="selected"> -- select -- </option>
                    {{foreach from=$project_types key="key" item="item"}}
                      <option value="{{$item.pt_id}}" {{if $item.pt_id == $detail.bsn_type}} selected="selected" {{/if}}> {{$item.pt_name}}</option>
                    {{/foreach}}
				  </select>
                  </th>
                  <td>Created User:</td><th>{{$detail.user_name|default:"NA"}}</th>
                </tr>
                <tr>
                  <td>Project Price:</td>
                  <th>
 <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_advertLink]" value="{{$detail.bsn_advertLink}}" class="vsml" style="width:240px;" />
                  </th>
                  <td>Project Enquiry:</td>
                  <th><select name="{{$TABLE}}[bsn_cd_enquiry_source]" class="lrg" >
                      <option value="0" selected="selected"> -- select --</option>
            	  {{foreach from=$allenquirysource key="key" item="item"}}
                      <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.bsn_cd_enquiry_source}} selected="selected" {{/if}}> {{$item.soe_name}}</option>  
            	  {{/foreach}}
                      </select>
                  </th>
                </tr>    
              </table></th>
          </tr>
         <tr>
            <td colspan="3">
            <table border="0" width="100%">
            <tr>
             <th>Project Customer Type:</th>
                  <td><select name="{{$TABLE}}[bsn_proj_cust_type]" class="lrg" >
                      <option value="0" selected="selected"> -- select --</option>
            	  {{foreach from=$pct key="key" item="item"}}
                      <option value="{{$item.pct_id}}" {{if $item.pct_id == $detail.bsn_proj_cust_type}} selected="selected" {{/if}}> {{$item.pct_title}}</option>  
            	  {{/foreach}}
                      </select>
                  </td>
   
    		<th>All Homes Link:</th>
   		    <td><input type="text" name="{{$TABLE}}[bsn_allhomes_link]" value="{{$detail.bsn_allhomes_link}}" style="width:380px;" /> </td>
   
					</tr>            
            <tr>
            <th width="125">Budget:</th>
            <td><input type="text" name="{{$TABLE}}[bsn_advert_text]" value="{{$detail.bsn_advert_text}}" style="width:240px;" />             
            
            <!-- <textarea  cols="70" id="editor1" name="{{$TABLE}}[bsn_advert_text]" rows="6">{{$detail.bsn_advert_text}}</textarea>-->
            </td>
            <th  width="125">Description:</th><td>
            <textarea  cols="70" id="editor1" name="{{$TABLE}}[bsn_description]" rows="3">{{$detail.bsn_description}}</textarea>
            </td>
            </tr>
            
            <tr>
            <th width="125">Courier Box:</th>
            <td><input type="text" name="{{$TABLE}}[bsn_courier_box]" value="{{$detail.bsn_courier_box}}" style="width:240px;" readonly="readonly" />             
            <a href="{{$BASE_URL}}business.courier_box/bsn_id/{{$detail.$ID}}" class="various">
            <span style=" background:#039; color:#FFF; padding:5px; font-weight:bold; border-radius:5px;"> Add Design </span> </a>
             </td>
            <th  width="125">Project Salutation</th>
            <td><input type="text" name="{{$TABLE}}[bsn_proj_salu]" value="{{$detail.bsn_proj_salu}}" style="width:380px;" onkeyup = "javascript:update_proj_salu({{$detail.bsn_id}},this.value)"/> 
            	
		<script language="javascript">
	   
	    function update_proj_salu(id,value)
		{
		 	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_salutation/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	    </script>
             
            </td>
            </tr>
            
            <tr>
            <th width="125"> </th>
            <td><b>Project Address Same as Customer Address</b>&nbsp;
  <input type="checkbox" value="1" name="{{$TABLE}}[bsn_address_same]" {{if $detail.bsn_address_same eq 1}} checked="checked"  {{/if}}/> </td>
              <th width="125">Confirmed Date </th>
            <td><input type="text"  name="{{$TABLE}}[bsn_proj_salu_date]" value="{{$detail.bsn_proj_salu_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo101" style="width:70px;" onfocus= "javascript:update_date({{$detail.bsn_id}},this.value)"/>
             &nbsp; Who &nbsp; <input type="text"  name="{{$TABLE}}[bsn_proj_salu_who]" value="{{$detail.bsn_proj_salu_who}}" style="width:150px;" onkeyup = "javascript:update_who({{$detail.bsn_id}},this.value)"/>
             
             <script language="javascript">
	   
	        function update_who(id,value)
		{
		 	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_salutation/bsn_id_2/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
		
		function update_date(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_salutation/bsn_id_3/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
		
	       </script>
             </td>
            </tr>
            <tr>
        <td> </td>
         <td><b> Add to Construction Pipeline Report</b> &nbsp;  <input type="checkbox" value="1" name="{{$TABLE}}[bsn_addto_cpr]" {{if $detail.bsn_addto_cpr eq 1}} checked="checked"  {{/if}}/> <br />
         <b> Add to Complete Report</b> &nbsp;  <input type="checkbox" value="1" name="{{$TABLE}}[bsn_addto_complete]" {{if $detail.bsn_addto_complete eq 1}} checked="checked"  {{/if}}/>
         </td>
         <td> <b>Unsubscribe email:</b>&nbsp;
  <input type="checkbox" value="1" name="{{$TABLE}}[bsn_unsubscribe_email]" {{if $detail.bsn_unsubscribe_email eq 1}} checked="checked"  {{/if}}/> 
</td>
         </tr>
            
            <tr>
              <th width="125">Gross Profit:</th>
            <td >
             <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_cd_turnover]" value="{{$detail.bsn_cd_turnover}}" class="vsml" style="width:280px;" />
            </td>
            <th  width="125">Project Address:</th><td>
            <textarea  cols="70" id="editor1" name="{{$TABLE}}[bsn_address]" rows="3">{{$detail.bsn_address}}</textarea>
            </td>
            </tr>            
            </table>
            </td>
          </tr>  
          
          <tr>
            <th colspan="3"><table id="none-table" width="100%" cellpadding="0" cellspacing="0">
                <tr>
              
                  <th width="181" colspan="2"> <table cellpadding="0" cellspacing="0" width="100%" border="0" >
                      <tr>
                        <td width="155"><strong>Suburb:</strong> </td>
                        <th><input type="hidden" name="{{$TABLE}}[bsn_suburb_id]" id="suburb_id" value="{{$detail.bsn_suburb_id}}"/>
                          <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_suburb]" value="{{$detail.bsn_suburb}}" class="vsml" onkeyup="javascript:getstates();" id="suburb" style="width:280px;" />
                          <div id="listofallbusinesses" style="position:absolute; height:200px; overflow:hidden; z-index:100;  visibility:hidden;  width:290px;  color:#FFFFFF;" ></div></th>
                      </tr>
                    </table></th>
                  <th width="223"><strong>State:</strong>&nbsp;
                    <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_state]" value="{{$detail.bsn_state}}" class="vsml"  id="state"  />
                </th>
                
                <th width="421"><strong>Post Code:</strong>&nbsp;
                    <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_pcode]" value="{{$detail.bsn_pcode}}" class="vsml" id="postcode"  />
                    </th>
                </tr>
                <tr>
                  <td colspan="2"></td>
                </tr>
              </table></th>
          </tr>
          <tr>
            <th colspan="3">
            
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
                <tr>
              
                  <th width="181" colspan="2"> <table cellpadding="0" cellspacing="0" width="100%" border="0" >
                      <tr>
                        <td width="155"><strong>Block:</strong> </td>
                        <th>
                          <input type="text"  name="{{$TABLE}}[bsn_cd_block]" value="{{$detail.bsn_cd_block}}" class="vsml" style="width:280px;" />
                          <div id="listofallbusinesses" style="position:absolute; height:200px; overflow:hidden; z-index:100;  visibility:hidden;  width:290px;  color:#FFFFFF;" ></div></th>
                      </tr>
                    </table>
                 </th>
                  <th width="233"><strong>Section:</strong>&nbsp;
                    <input type="text"   name="{{$TABLE}}[bsn_cd_section]" value="{{$detail.bsn_cd_section}}" class="vsml"   />
                </th>
                <th width="421">Sales Agent:&nbsp;
                	<select class="lrg" name="{{$TABLE}}[bsn_sales_user_id]">
                    <option value="0">-- Select --</option> 
                    {{foreach from=$salesagents item="item" key="key"}}
                    <option value="{{$item.user_id}}" {{if $detail.bsn_sales_user_id == $item.user_id}} selected="selected" {{/if}}>{{$item.user_name}}</option>
                    {{/foreach}}
                </select>
                </th>
                </tr>
    		</table></th>
         </tr>
         </table>
         <table>
         <tr> 
         <td style="width:70px;"> </td>
         <th > Rating: </th> <td >
                       
               <style>
					output {
						display: inline-block;
						font-size: 15px;
						font-weight: bold;
						text-align: center;
						width: 300px;
					}
				</style>
                
                <div style="width:100%; margin-top:15px;">
                {{if $bid  eq 0 }}
                  <input type="range" name = "{{$TABLE}}[bsn_rating]" value="0" min="0" max="10" data-rangeSlider>
                {{else}}
    <input type="range" name = "{{$TABLE}}[bsn_rating]" value="{{$detail.bsn_rating}}" min="0" max="10" data-rangeSlider>
	             {{/if}}
                     <output></output>
                </div>
               
         <script>
    	(function () {

        var selector = '[data-rangeSlider]',
                elements = document.querySelectorAll(selector);

        // Example functionality to demonstrate a value feedback
        function valueOutput(element) {
            var value = element.value,
                    output = element.parentNode.getElementsByTagName('output')[0];
            output.innerHTML = value;
        }

        for (var i = elements.length - 1; i >= 0; i--) {
            valueOutput(elements[i]);
        }

        Array.prototype.slice.call(document.querySelectorAll('input[type="range"]')).forEach(function (el) {
            el.addEventListener('input', function (e) {
                valueOutput(e.target);
            }, false);
        });


        // Basic rangeSlider initialization
        rangeSlider.create(elements, {

            // Callback function
            onInit: function () {
            },

            // Callback function
            onSlideStart: function (value, percent, position) {
                console.info('onSlideStart', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            },

            // Callback function
            onSlide: function (value, percent, position) {
                console.log('onSlide', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            },

            // Callback function
            onSlideEnd: function (value, percent, position) {
                console.warn('onSlideEnd', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
            }
        });

    })();
</script>
          
         
     
         </td>
         <th style="text-align:left;" > Sales Pathway: </th>
         <td>
         <select name="{{$TABLE}}[bsn_sales_pathway]" onchange="setboxcolor(this.value)" >

       
         {{foreach from = $pro_street_checklist item = "itempsc" key = "keypsc"}}
         <option value="{{$itempsc.pst_id}}" {{if $detail.bsn_sales_pathway eq $itempsc.pst_id}} selected="selected" {{/if}}> 
        		{{$itempsc.pst_sales_pathway}}  
         </option>
          {{/foreach}}
	   </select>   
        </td>
        <td>
        
       {{if $detail.bsn_sales_pathway eq 1}}
        <input type="text" value="{{$pro_street_checklist[0].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#FF6; cursor:pointer;">
      <p id='op'><a href="{{$pro_street_checklist[0].pst_link}}" target="_blank">Click Here to open link</a> </p>
        
        {{elseif $detail.bsn_sales_pathway eq 2}}
         <input type="text" value="{{$pro_street_checklist[1].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#0C0;cursor:pointer;">
          <p id='op'><a href="{{$pro_street_checklist[1].pst_link}}"  target="_blank">Click Here to open link</a></p>
        
        {{elseif $detail.bsn_sales_pathway eq 3}}
         <input type="text" value="{{$pro_street_checklist[2].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#09F;cursor:pointer;">
         <p id='op'> <a href="{{$pro_street_checklist[2].pst_link}}"  target="_blank">Click Here to open link</a></p>
        
        {{elseif $detail.bsn_sales_pathway eq 4}}
           <input type="text" value="{{$pro_street_checklist[3].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#F00;cursor:pointer;">
           <p id='op'> <a href="{{$pro_street_checklist[3].pst_link}}"  target="_blank">Click Here to open link</a></p>
          
        {{elseif $detail.bsn_sales_pathway eq 5}}
        <input type="text" value="{{$pro_street_checklist[4].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#b6b6b6;cursor:pointer;">
         <p id='op'> <a href="{{$pro_street_checklist[4].pst_link}}"  target="_blank">Click Here to open link</a></p>
        
        {{elseif $detail.bsn_sales_pathway eq 6}}
         <input type="text" value="{{$pro_street_checklist[5].pst_link}}" id="box" style="width:300px;height:22px; display:inline-block; border:1px solid #666; background:#F90;cursor:pointer;">
         <p id='op'> <a href="{{$pro_street_checklist[5].pst_link}}"  target="_blank">Click Here to open link</a></p>
        {{/if}}
        </td>
        
        <script type="text/javascript">
        function setboxcolor(value)
        {
		var col = value;
	       if(col==1) {
		document.getElementById("box").style.backgroundColor ='#FF6';
		document.getElementById("box").value= '{{$pro_street_checklist[0].pst_link}}';
		document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[0].pst_link}}" target="_blank">Click Here to open link</a>';
	       } else if (col==2) {
		 document.getElementById("box").style.backgroundColor ='#0C0';
	         document.getElementById("box").value= '{{$pro_street_checklist[1].pst_link}}';
		document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[1].pst_link}}" target="_blank">Click Here to open link</a>';
        	} else if (col==3) {
		 document.getElementById("box").style.backgroundColor ='#09F';
		 document.getElementById("box").value= '{{$pro_street_checklist[2].pst_link}}';
		document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[2].pst_link}}" target="_blank">Click Here to open link</a>';
	       } else if (col==4) {
		 document.getElementById("box").style.backgroundColor ='#F00';
		 document.getElementById("box").value= '{{$pro_street_checklist[3].pst_link}}';
		 document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[3].pst_link}}" target="_blank">Click Here to open link</a>';
	       } else if (col==5) {
		 document.getElementById("box").style.backgroundColor ='#b6b6b6';
		 document.getElementById("box").value= '{{$pro_street_checklist[4].pst_link}}';
		 document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[4].pst_link}}" target="_blank">Click Here to open link</a>';
	       } else if (col==6) {
		 document.getElementById("box").style.backgroundColor ='#F90';
		 document.getElementById("box").value= '{{$pro_street_checklist[5].pst_link}}';
		 document.getElementById("op").innerHTML = '<a href="{{$pro_street_checklist[5].pst_link}}" target="_blank">Click Here to open link</a>';
	       }
       
        }
        </script>	
         </tr>
      	
        
         
        </table>
        <table >
        
        <tr>
        <td> </td>
        <td style="width:175px;" > <b>Live Construction Calendar :</b> </td>
       <td ><input type="text"  name="{{$TABLE}}[bsn_live_proj_calendar]" value="{{$detail.bsn_live_proj_calendar}}" class="vsml" style="width:480px;"> </td>
       <td><b>Starting Onsite Date :</b> <input type="text" name="{{$TABLE}}[bsn_starting_onsite_date]" value="{{$detail.bsn_starting_onsite_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo1010"> </td>
        </tr>
        
        <tr>
        <td> </td>
        <td style="width:175px;" > <b>Site Camera:</b> </td>
       <td> <input type="text"  name="{{$TABLE}}[bsn_site_camera]" value="{{$detail.bsn_site_camera}}" class="vsml" style="width:480px;" /> </td>
         <td>
         <input type="submit" name="makenew" value="Click here to make new Project" onclick="javascript:if(!confirm('Are you sure?')) return false;"></td>
        </tr>
        
        <tr>
        <td> </td>
        <td style="width:175px;" > <b>Document Click :</b> </td>
       <td colspan="2">
       <input type="text"  name="{{$TABLE}}[bsn_document_click]" value="{{$detail.bsn_document_click}}" class="vsml" style="width:480px;" />
      
        </td>
        </tr>
        
         <tr>
        <td> </td>
        <td style="width:175px;" > <b>CC Link :</b> </td>
       <td colspan="2"><input type="text"  name="{{$TABLE}}[bsn_cc_link]" value="{{$detail.bsn_cc_link}}" class="vsml" style="width:480px;" /> </td>
        </tr>
		
		<tr>
		<td> </td>		
	   <td style="width:175px;" > <b>SmartSheet Link :</b> </td>
       <td><input type="text"  name="{{$TABLE}}[bsn_smartsheet_link]" value="{{$detail.bsn_smartsheet_link}}" class="vsml" style="width:480px;" /> </td>
	   
	   <td>
		{{if !empty($checklist_number)}}
		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<td rowspan="{{ $checklist_number|@count }}" style="border: 2px solid white;background: green;color: #fff;font-size: 14px;">
					Signed HIA Checklist
				</td>
				{{foreach from=$checklist_number item=item_reno name=loop}}
					{{if $smarty.foreach.loop.first}}
						<td style="border: 2px solid white;background: green;color: #fff;font-size: 14px;">{{ $item_reno.dpn_unique_id }}</td>
					</tr>
					{{else}}
					<tr>
						<td style="border: 2px solid white;background: green;color: #fff;font-size: 14px;">{{ $item_reno.dpn_unique_id }}</td>
					</tr>
					{{/if}}
				{{/foreach}}
		</table>
		{{/if}}
	   </td>
        </tr> 
        
        
        </table>
        </td>
      </div>
    </tr>
     
         
    
    
    <tr>
      <th colspan="5" align="center" > 
      <div id="michael1" style="width: 1470px; background: #FFFFFF; display: block;" align="center">
        <ul id="countrytabs" class="shadetabs">
          <!--<li><a href="#" rel="country1" class="selected">Common Details</a></li>-->
          <li><a href="#" rel="country2" class="selected">Customers</a></li>
          <!--<li><a href="#" rel="country3">Marketing/Other Agency</a></li>-->
          <!--<li><a href="#" rel="country4">Advert</a></li>
          <li><a href="#" rel="country5">Notes/Extra info</a></li>-->
          <li><a href="#" rel="country6">Other Contacts</a></li>
          <li><a href="#" rel="logon">Logon</a></li>
          <li><a href="#" rel="country7">Project Status Tasks <span id="total_task"></span></a></li>
	<!--  <li><a href="#" rel="country8">Project Type Tasks <span id="total_ptypetask"></span></a></li>-->       
		<!--  <li><a href="#" rel="country100" >Images*</a></li>-->
    <!--  <li><a href="#" rel="country200">Documents*</a></li>-->
          <li><a href="#" rel="country300">Document CheckList</a></li>
         <!-- <li><a href="#" rel="country400" class="selected">Project Enquiries</a></li>-->
            <li><a href="#" rel="country400" class="selected">Ms Team</a></li>
          <!--<li><a href="#" rel="country700">Quote - Profit & Loss</a></li>-->
           
          <li><a href="#" rel="country2000">Planning Approvals</a></li>
          <li><a href="#" rel="country2100">Proposal Document CheckList/{{$pc_count}}</a></li>
          <li><a href="#" rel="country3000">Renovation Proposal/{{$pc_count_reno}}</a></li>
        <!--  <li><a href="#" rel="country18">Pla/Approvals Docs</a></li>--> <br /><br />
          <li><a href="#" rel="country2200">Financial Document Checklist</a></li>
          <li><a href="#" rel="country2300">Q/A</a></li>
          <li><a href="#" rel="country2400">Q/A Email Logs</a></li>
          <li><a href="#" rel="country2500">Recorded Meetings</a></li>
          <li><a href="#" rel="country2600">Progress Payments</a></li>
          <li><a href="#" rel="country700">Reports</a></li>
          <li><a href="#" rel="country2700">Proposal Alerts</a></li>
          <li><a href="#" rel="country2800">Quotes</a></li>
          <li><a href="#" rel="country2900">Project Purchase Orders</a></li><br /><br />
          <li><a href="#" rel="country3200">Delivery</a></li>
          <li><a href="#" rel="country3100">Due Date Time Tracker </a></li>
          <li><a href="#" rel="country3300">Special Conditions</a></li>
          <li><a href="#" rel="country3400">Variations</a></li>
          <li><a href="#" rel="country3500">Design Plans</a></li>
          <li><a href="#" rel="property_customer_page">Property Customer Page</a></li>
          <li><a href="#" rel="action_items">Action Items</a></li>
          <li><a href="#" rel="site_progress">Site Progress</a></li>
          <li><a href="/business.detail/bsn_id/{{$detail.bsn_id}}/productpage" rel="" target="_blank">Product and Manufacturers</a></li>
          <!-- <li><a href="#" rel="country3600">Latest Merge Plans</a></li> -->
		  <li><a href="#" rel="phone_log">Phone Log({{$phone_count}}-{{$phone_await_count}})</a></li>
       
        </ul>

        <div style="border:1px solid gray; width:98%; margin-bottom: 1em; padding: 1px">
          <div id="country1" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td>Contact Name:&nbsp;</td>
                <th> <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_cd_contact]" value="{{$detail.bsn_cd_contact}}" class="lrg" /></th>
                <td >Phone:&nbsp; </td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_cd_phone]" value="{{$detail.bsn_cd_phone}}" class="sml" />
                  &nbsp;</th>
                <td>Fax:&nbsp; </td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_cd_fax]" value="{{$detail.bsn_cd_fax}}" class="vsml" /></th>
              </tr>
              <tr>
                <td>Email:&nbsp;</td>
                <th> <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_cd_email]" value="{{$detail.bsn_cd_email}}" class="lrg" /></th>
                <td ></td>
                <th>Send Marketing Emails&nbsp;&nbsp;
                  <input type="checkbox" name="{{$TABLE}}[bsn_send_marketing_emails]" value="1" {{if $detail.bsn_send_marketing_emails == 1}} checked="checked" {{/if}} />
                  &nbsp;</th>
                <td></td>
                <th></th>
              </tr>
              <tr>
                <td>Project Summary:&nbsp;</td>
                <th  colspan="5"> <textarea  cols="100"  name="{{$TABLE}}[bsn_cd_seller_summery]" rows="6">{{$detail.bsn_cd_seller_summery}}</textarea></th>
              </tr>
            </table>
          </div>
          <div id="country2" class="tabcontent" style="background-color:#FFFFFF;">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th colspan="10"><input type="button" name="addcust" value="Add New" onclick="add_edit_seller();" id="addcust" class="vsml" />
                  <input type="button" value="Show" onclick="requestsellerInfo(1);"/></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <td colspan="10" bgcolor="#FFFFFF"><div id="divbusinesscustomreInfoToReturn"></div>
                  <br />
                  <div id="businesscistenquiry">
                    <iframe name="customerinfo" id="customerinfo" src="{{$BASE_URL}}business.home/bsn_id/{{$detail.$ID}}" width="100%" height="210" frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();"></iframe>
                  </div></td>
              </tr>
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
            </table>
          </div>
          <div id="country3" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td>Agency Marketing:&nbsp;</td>
                <th> <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_agency_marketing]" value="{{$detail.bsn_agency_marketing}}" class="lrg" /></th>
                <td >Agent Marketing:&nbsp; </td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_agent_marketing]" value="{{$detail.bsn_agent_marketing}}" class="lrg" />
                  &nbsp;</th>
              </tr>
              <tr>
                <td>Agent Status:&nbsp;</td>
                <th><select name="{{$TABLE}}[bsn_agent_status]" class="lrg" >
                    <option value="0" selected="selected"> -- select --</option>    
                    {{foreach from=$agent_status key="key" item="item"}}
                           <option value="{{$item.bi_id}}" {{if $item.bi_id == $detail.bsn_agent_status}} selected="selected" {{/if}}> {{$item.bi_title}}</option>   
                    {{/foreach}}
                 </select></th>
                <td ></td>
                <th></th>
              </tr>
              <tr>
                <td>Marketing Date:&nbsp;</td>
                <th> <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_marketing_date]" value="{{$detail.bsn_marketing_date}}" id="demo9" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>
           &nbsp;
           <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_marketing_time]" value="{{$detail.bsn_marketing_time}}" class="vvsml" id="bsn_marketing_time" />
           &nbsp;<a href="javascript:setcur_date('curdate','demo9','bsn_marketing_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a></th>           <td ></td>
                <th></th>
              </tr>
              <tr>
                <td>Disclosed Marketing:&nbsp;</td>
                <th> <input type="checkbox" name="{{$TABLE}}[bsn_disclosed_marketing]" value="1" {{if $detail.bsn_disclosed_marketing == 1}} checked="checked" {{/if}} /></th>
                <td >Undisclosed Name:&nbsp;</td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_undisclosed_name]" value="{{$detail.bsn_undisclosed_name}}" class="lrg" /></th>
              </tr>
              <tr>
                <td>Franchise:&nbsp;</td>
                <th> <input type="checkbox" name="{{$TABLE}}[bsn_franchise]" value="1" {{if $detail.bsn_franchise == 1}} checked="checked" {{/if}} /></th>
                <td >Franchise Name:&nbsp;</td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_franchise_name]" value="{{$detail.bsn_franchise_name}}" class="lrg" /></th>
              </tr>
              <tr>
                <td>Marketing Price:&nbsp;</td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_marketing_price]" value="{{$detail.bsn_marketing_price}}" class="sml" /></th>
                <td >Stock At Value:</td>
                <th><input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_stock_at_value]" value="{{$detail.bsn_stock_at_value}}" class="sml" /></th>
              </tr>
              <tr>
                <td>Marketing Headline:&nbsp;</td>
                <th colspan="4"> <input type="text" autocomplete="off"  name="{{$TABLE}}[bsn_marketing_headline]" value="{{$detail.bsn_marketing_headline}}" class="xxlrg" /></th>
              </tr>
              <tr>
                <td>Marketing Note:&nbsp;</td>
                <th  colspan="5"> <textarea  cols="100" id="editor1" name="{{$TABLE}}[bsn_marketing_note]" rows="6">{{$detail.bsn_marketing_note}}</textarea></th>
              </tr>
            </table>
          </div>
          <!--Adv Listing-->
          <div id="country4" class="tabcontent"> {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> <input type="button" name="show" value="Show Existing Links" onclick="requestadvertsDiv(1);" id="show" class="vsml" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" name="addadvert" value="Add New" onclick="add_edit_adverts();" id="addadvert" class="vsml" />
                  &nbsp; <br />
                  <div id="error" style="color:#FF6600; font-weight:bold;"></div></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
       <tr>
       <th colspan="10" bgcolor="#FFFFFF"> <div id="divadvertsToReturn"></div>
       <div id="divAdvert">
       <iframe name="divAdverts" id="divAdverts" src="" width="100%" height="360"  frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();return false;"></iframe>
       </div></th>
       </tr>
            </table>
            {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
              <tr>
                <td><div class="savelisting">Must save project first.</div></td>
              </tr>
            </table>
            {{/if}} </div>
          <!--Adv Listing-->
          <div id="country5" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td>Notes:&nbsp;</td>
                <th  colspan="5"> <textarea  cols="100"  name="{{$TABLE}}[bsn_notes]" rows="6">{{$detail.bsn_notes}}</textarea></th>
              </tr>
              
            </table>
          </div>
          <div id="country6" class="tabcontent"> {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> <input type="button" name="show" value="Link Existing" onclick="requestOthercontactDiv(1);" id="show" class="vsml" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" name="addcontact" value="Add New" onclick="add_edit_othercontact();" id="addcontact" class="vsml" />
                  &nbsp; <br />
                  <div id="error" style="color:#FF6600; font-weight:bold;"></div></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"><div id="divotherContactToReturn"></div>
                  <div id="divothercontact"><iframe name="othercontact" id="othercontact" src="" width="100%" height="360"  frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();return false;"></iframe></div></th>
              </tr>
            </table>
            {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
              <tr><td><div class="savelisting">Must save project first.</div></td></tr>
            </table>
            {{/if}} </div>

			<div id="logon" class="tabcontent">
				<h3 style="font-size: 1.7em; font-weight: bold; margin-top: 40px; margin-bottom: 40px;">User Access & Logons</h3>
				<iframe name="siteProgressFrame" id="siteProgressFrame" src="{{ $BASE_URL }}{{ $XFA.user_logon_home }}/bsn_id/{{ $detail.bsn_id }}" frameborder="0" width="100%" height="100%" style="min-height: 250px; max-height: 500px;"></iframe>
			</div>
          <div id="country7" class="tabcontent" > {{if $detail.bsn_id}}
            <table cellpadding="0"  cellspacing="0">
              <tr>
                <td width="150">Add tasks for Status:</td>
          <td>
          <select name="business_task[bt_task_status_id]" class="lrg" id="bt_task_status_id" >
                    <option value="0" selected="selected"> -- select --</option>
            {{foreach from=$business_status key="key" item="item"}}    
                    <option value="{{$item.st_id}}" {{if $item.st_id == $detail.bsn_status}}  {{/if}}> {{$item.st_name}}</option>                   
            {{/foreach}}
		  </select>
          </td>
                <td><input type="button" value="Add Tasks" onclick="requestAddTask();" /></td>
                <td><input type="button" value="Reload" onclick="requestAllTasks();"/></td>
                <td><table cellpadding="0" cellspacing="0" style="border: 1px #CCCCCC solid;">
                    <tr>
                      <td  style="font-weight: normal;" width="200">
                      <input type="radio" value="0" name="taskStatus" checked="checked"/>
                        Not&nbsp;Done<br />
                        <input type="radio" value="1" name="taskStatus" />
                        Done<br />
                        <input type="radio" value="" name="taskStatus" />
                        All </td>
                      <td><input type="button" value="Show" onclick="requestAllTasks();" /></td>
                    </tr>
                  </table></td>
                <td><table cellpadding="0" cellspacing="0" style="border: 1px #CCCCCC solid;">
                    <tr>
                      <td>Per Page:
                        <select name="perpage" id="perpage" onchange="javascript:requestAllTasks();">
                          <option value="5" {{if $perpage == 5}} selected="selected" {{/if}}>5</option>
                          <option value="10" {{if $perpage == 10}} selected="selected" {{/if}}>10</option>
                          <option value="20" {{if $perpage == 20}} selected="selected" {{/if}}>20</option>
                          <option value="30" {{if $perpage == 30}} selected="selected" {{/if}}>30</option>
                          <option value="40" {{if $perpage == 40}} selected="selected" {{/if}}>40</option>
                          <option value="50" {{if $perpage == 50}} selected="selected" {{/if}}>50</option>
                          <option value="100" {{if $perpage == 100}} selected="selected" {{/if}}>100</option>
                        </select>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> <td> <a href = "{{$BASE_URL}}business.subtask_synchronize/bsn_id/{{$detail.bsn_id}}" class="various">Synchronize Subtask</a> </td> </tr>
            </table>
            <div id="taskmsg" style="color:#FF6600;" align="left"></div>
            <br />
            <div id="AllTaskDiv"></div>
            <br />
            <div id="editTaskDiv" align="left"></div>
            {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
              <tr>
                <td><div class="savelisting"> Must save project first. </div></td>
              </tr>
            </table>
            {{/if}} </div>
            <div id="country18" class="tabcontent" > 
                {{if $detail.bsn_id}}
                {{/if}}
           	</div>
        <!--Price Range Start-->
         <div id="country8" class="tabcontent"> {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> <input type="button" name="show" value="Show List" onclick="requestpricerangeDiv(1);" id="show" class="vsml" />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp; <br />
                  <div id="error" style="color:#FF6600; font-weight:bold;"></div></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> <div id="divprToReturn"></div>
                 </th>
              </tr>
            </table>
            {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
              <tr>
                <td><div class="savelisting">Must save project first.</div></td>
              </tr>
            </table>
            {{/if}} </div>
          <div style="border:0px solid gray; width:95%; margin-bottom: 1em; padding: 10px;">
          <div id="country100" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th> <input type="button" name="addfile" value="Add New" onclick="RequestcheckListIframe('images','','divImages','');" id="addfile" class="vsml" />
                  <input type="button" name="adddoc" value="Show" onclick="iframeRequest(2,'1');" id="adddoc" class="vsml" />
                  Per Page:<select name="imgperpage" id="imgperpage" onchange="javascript:iframeRequest(2,'');">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                  </select>
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
           <th colspan="10" bgcolor="#FFFFFF";> <div id="divImages"></div>
          <iframe name="imagesIframe" id="imagesIframe" src=""  frameborder="0" scrolling="no" height="5px;" hspace=10 vspace=5 width="100%" onload="javascript:closeTop();" ></iframe></th></tr>
              {{else}}
            <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
            </tr>
              {{/if}}
            </table>
          </div>
          <div id="country2200" class="tabcontent">
           {{if $detail.bsn_id}}
    		<!-- <input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}{{$XFA.checklistemail}}/bus_id/{{$detail.bsn_id}}','90%','90%', 'yes');" id="addfile" class="vsml" /> -->            &nbsp;
            <input type="button" name="adddoc" value="Add New" onclick="RequestcheckListIframe('adddocuments_fin','','divbusinessdocInfoToReturn_fin','');" id="adddoc_fin" class="vsml" />
            <input type="button" name="adddoca" value="Show" onclick="iframeRequest(6,'');" id="adddoc" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage_fin" onchange="javascript:iframeRequest(6,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
           <!-- <input type="button" name="CreateDocumentCheckList" value="Create Finance Document Check List" onclick="requestDocumentCheckListFinancial('add');" />-->
                        
    <div id="divbusinessdocInfoToReturn_fin"></div>
    <div id="DocumentCheckListDiv_fin"></div>
    <br />
    <iframe name="adddocumentsIframe_fin" id="adddocumentsIframe_fin" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="checkListIframe_fin" id="checkListIframe_fin" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
            {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
            {{/if}} 
          
          
          </div>
   
   			 <div id="country2300" class="tabcontent">
             	<table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th> <input type="button" name="addqa" value="Add New" onclick="add_edit_business_QA();" id="addqa" class="vsml" />
                  &nbsp;
                  <input type="button" value="Show" onclick="requestquestionInfo2(1);" /></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> <iframe name="qaIframe_list" id="qaIframe_list"  src="" frameborder="0" scrolling="yes" hspace=10 vspace=5 width="100%" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; " ></iframe>
                  <div id="divaqsection">
                    <iframe name="qaIframe" id="qaIframe" src="" frameborder="0" scrolling="no" height="750px;" hspace=10 vspace=5 width="100%" onload="javascript:closeTop();" ></iframe>
                  </div></th>
              </tr>
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save business listing first.</div></th>
              </tr>
              {{/if}}
            </table>
             </div>
   
                           
    	<div id="country2400" class="tabcontent">
    
          {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF">
           
              <tr>
                <th colspan="10">
                                           
                      <table id="elog_table" cellpadding="0" cellspacing="0" width="100%" id="emaillog">
                      <tr>
                 
                      <th width="7%"> Sent to </th>
                      <th width="10%"> Date Sent</th>
                      <th width="25%"> Attachment </th>
                      <th width="6%"> View Content </th>
                      </tr>
                     {{foreach from=$listqalog key="key" item="item"}}
                     <tr>
                     
                     <td style="text-align:left;">{{$item.qal_to}}</td>
                     <td style="text-align:left;">{{$item.qal_date|date_format:"%d-%b-%Y"}}</td>
                     <td style="text-align:left;"><a href = "{{$item.qal_attachment}}" target="_blank" >{{$item.qal_attachment}}</a></td>
                     <td><a href="{{$BASE_URL}}business.qa_email_view/qal_id/{{$item.qal_id}}" class="various3" title="View Email">
                    <img src="{{$BASE_URL}}css/admin/images/view.png"/></a> </td>
                                          
                     </tr>
                     {{/foreach}}
                      </table>
   {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">    
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'><< previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><< previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next >></span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>

</table> 
{{/if}}

                
                </th>
              </tr>
  
            </table>
            {{else}}
            <div align="left" class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save business listing first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
            </div>
    
    
    
    <!------Recorded Meetings-->
    
     <div id="country2500" class="tabcontent">
    	{{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
                
              
       <input type="button" name="addrecmeet" value="Add File" onclick="add_edit_recording_meetings();" id="addrecmeet" class="vsml" />
       <input type="button" value="List" onclick="requestrecordedmeetingInfo(1);" />               
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divrecmeettInfoToReturn"></div>
                  <div id="divrecordedmeeting" style="display:none;">
                  <iframe name="recordedmeeting" id="recordedmeeting" src="{{$BASE_URL}}{{$XFA.meeting_recording_detail}}/bsn_id/{{$detail.$ID}}" width="100%" height="530" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
    
     </div>
    
    
    <!-------Recorded Meetings Ends-->
    
    
     <!------Progress Payments-->
    
     <div id="country2600" class="tabcontent" style="display:block;">
    	{{if $detail.bsn_id}} 
              <table id="list-table2" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF" style="border:1px solid #999 !important; padding:5px !important;">
                <tr>
                  <th height="50" width="8%" style="text-align:center !important;">Stage</th>
                  <th height="50" width="3%" style="text-align:center !important;">Percent</th>
                  <th height="50" width="5%" style="text-align:center !important;">HIA Value</th>
                  <th height="50" width="5%" style="text-align:center !important;">Paid Value</th>
				  <th height="50" width="5%" style="text-align:center !important;">Amount Owed</th>
                  <th height="50" width="14%" style="text-align:center !important;">Forecast Date<br />Completed Date</th>
                  <th height="50" width="8%" style="text-align:center !important;">Progress Payment Report</th>
                  <th height="50" width="6%" style="text-align:center !important;">Invoice Sent</th>
                  <th height="50" width="7%" style="text-align:center !important;">Invoice Due Date</th>
                  <th height="50" width="7%" style="text-align:center !important;">When Payment Received</th>
                  <th height="50" width="4%" style="text-align:center !important;">Days Late</th>
                  <th height="50" width="4%" style="text-align:center !important;">IN</th>
                  <th height="50" width="5%" style="text-align:center !important;">Late Letter<br /> to be sent</th>
                  <th height="50" width="5%" style="text-align:center !important;">Later Letter</th>
                  <th height="50" width="5%" style="text-align:center !important;">Sync Letter</th>
                  <th height="50" width="4%" style="text-align:center !important;">Action:</th>
                  
                </tr>
            
              {{foreach from=$progress_payment_detail item="pritem" key="prkey"}}
                <tr>
              
<td><input type="text" name="payment[{{$pritem.ppd_id}}][ppd_stage]" value="{{$pritem.ppd_stage}}" id ="pr{{$pritem.ppd_id}}"  style="width:160px;"/></td>
<td><input type="text" name="payment[{{$pritem.ppd_id}}][ppd_percent]" value="{{$pritem.ppd_percent}}" id ="pr{{$pritem.ppd_id}}" style="width:35px;" onkeyup="update_percent_user({{$pritem.ppd_id}},this.value)"/>
{{if $pritem.ppd_percent_user}}{{$pritem.ppd_percent_user}}<br />{{$pritem.ppd_percent_date}}{{/if}}
      <script>
	   
	   function update_percent_user(id,value)
		{
			 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_percent_user/ppd_id/"+id,
				   success: function(result){
			   }
			 });
		}
	
       </script>

 </td>
<td>
<input type="text" name="payment[{{$pritem.ppd_id}}][ppd_hia_value]" value="{{$pritem.ppd_hia_value}}" id ="pr{{$pritem.ppd_id}}" style="width:50px;" onkeyup="update_hia_user({{$pritem.ppd_id}},this.value)"  /> 
{{if $pritem.ppd_hia_value_user}}{{$pritem.ppd_hia_value_user}}<br />{{$pritem.ppd_hia_value_date}}{{/if}}
      <script>
	   
	   function update_hia_user(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_hia_user/ppd_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>

</td>
                
<td>
<input type="text"  name="payment[{{$pritem.ppd_id}}][ppd_value]" value="{{$pritem.ppd_value}}" id ="pr{{$pritem.ppd_id}}" style="width:50px;" onkeyup="update_value_user({{$pritem.ppd_id}},this.value)"  /> 
{{if $pritem.ppd_value_user}}{{$pritem.ppd_value_user}}<br />{{$pritem.ppd_value_date}}{{/if}}
<script>
	   
	   function update_value_user(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_value_user/ppd_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>

</td>
				<td>
				{{if $pritem.ppd_hia_value && $pritem.ppd_value }}
					{{$pritem.amount_owed}}
				{{/if}}
				</td>
                 
                  {{if !empty($pritem.ppd_forcast_date) }}
                  		<td id = "col_{{$pritem.ppd_id}}" style="background:#F00; color:#FFF;">
                  {{else}}
                 		 <td id = "col_{{$pritem.ppd_id}}">
                  {{/if}}
                
  		
       F  <input type="text" name="payment[{{$pritem.ppd_id}}][ppd_forcast_date]" value="{{$pritem.ppd_forcast_date}}" id ="demo1_{{$pritem.ppd_id}}" class="w16em dateformat-d-ds-m-ds-Y" style="width:60px;" /> 
<hr style="width:60%"/>
   
  
      C <input type="text" name="payment[{{$pritem.ppd_id}}][ppd_completed_date]" value="{{$pritem.ppd_completed_date}}" id ="demo2_{{$pritem.ppd_id}}" class="w16em dateformat-d-ds-m-ds-Y" style="width:60px;" />
 
        </td>
                  
          <td><input type="file" name="doc_{{$pritem.ppd_id}}" style="width:90px;" id ="pr3{{$pritem.ppd_id}}"  /> <br />
             {{if $pritem.ppd_signoff_doc}} 
                  
  
          <a href="/business.download_content_pp?file_name={{$pritem.ppd_signoff_doc}}&module_name=business.home" target="_blank" >View/Download </a>
                  
                  {{/if}}
          </td>
    
                  <td>
				  {{if $pritem.ppd_stage eq 'Planning Approvals Submitted' and $pritem.ppd_invoice_sent ne '' and $pritem.ppd_invoice_sent ne null and $pritem.ppd_inv_due_date ne '' and $pritem.ppd_inv_due_date ne null}}
				  {{ assign var="new_ppd_inv_val" value=$pritem.ppd_hia_value}}
				  <input type="text" name="payment[{{$pritem.ppd_id}}][ppd_inv_value]" value="{{$new_ppd_inv_val}}" id ="pr{{$pritem.ppd_id}}" style="width:50px;" readonly />
				  {{else}}
				  <input type="text" name="payment[{{$pritem.ppd_id}}][ppd_inv_value]" value="{{$pritem.ppd_inv_value}}" id ="pr{{$pritem.ppd_id}}" style="width:50px;" />
				  {{/if}}
				  
					<!--<input type="text" name="payment[{{$pritem.ppd_id}}][ppd_inv_value]" value="{{$pritem.ppd_inv_value}}" id ="pr{{$pritem.ppd_id}}" style="width:50px;" /> -->
					
				  <input type="file" name="doc2_{{$pritem.ppd_id}}" style="width:90px;" /> <br />
                  {{if $pritem.ppd_invoice_sent}} 
 
             <a href="/business.download_content_pp?file_name={{$pritem.ppd_invoice_sent}}&module_name=business.home" target="_blank" >View/Download </a>
             
             {{$pritem.ppd_invoice_sent_date}}
             {{/if}}
                  </td>
  <td> <input type="text" name="payment[{{$pritem.ppd_id}}][ppd_inv_due_date]" value="{{$pritem.ppd_inv_due_date}}" id ="demo4_{{$pritem.ppd_id}}" class="w16em dateformat-d-ds-m-ds-Y" style="width:60px;" onfocus ="update_due_user({{$pritem.ppd_id}}, this.value);" />
  {{if $pritem.ppd_due_user}}{{$pritem.ppd_due_user}}<br />{{$pritem.ppd_due_date}}{{/if}}
<script>
	   
	   function update_due_user(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_due_user/ppd_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
  
  </td> 
                  <td><input type="text"  name="payment[{{$pritem.ppd_id}}][ppd_when_payrec]" value="{{$pritem.ppd_when_payrec}}" id ="demo3_{{$pritem.ppd_id}}"  class="w16em dateformat-d-ds-m-ds-Y" style="width:60px;" onfocus ="update_received_user({{$pritem.ppd_id}}, this.value);"  /> 
                  
     {{if $pritem.ppd_received_user}}{{$pritem.ppd_received_user}}<br />{{$pritem.ppd_received_date}}{{/if}}
<script>
	   
	   function update_received_user(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_received_user/ppd_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>             
                   </td>
                  
                  
             <td>{{$pritem.days_late}}</td>
             <td>             
             <input type="text" name="in[{{$pritem.ppd_id}}][ppd_in]" value="{{$pritem.ppd_in}}" id ="pr{{$pritem.ppd_id}}" style="width:55px;" onkeyup="update_in({{$pritem.ppd_id}},this.value)"/>
{{if $pritem.ppd_in}}{{$pritem.ppd_in_date}}{{/if}}
      <script>
	   
	   function update_in(id,value)
		{
		
			 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_in/ppd_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
             
             </td>
                
             <td>
                         		
     		<label class="switch">
        	<input class="switch-input" type="checkbox"  name="payment[{{$pritem.ppd_id}}][ppd_default_int]" value="1"  {{if $pritem.ppd_default_int eq 1 }} checked="checked" {{/if}}  />
        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
             {{$pritem.ppd_send_user}} <br /> {{$pritem.ppd_send_date}}
             </td>
             
             <td><input type="file" name="doc3_{{$pritem.ppd_id}}" style="width:90px;" /> <br />
                  {{if $pritem.ppd_letter_to_be}} 
 
             <a href="/business.download_content_pp?file_name={{$pritem.ppd_letter_to_be}}&module_name=business.home" target="_blank" >View/Download </a>
             {{/if}}</td>  
             
             <td>TBD</td>
                  <td>
                  <a href="{{$BASE_URL}}business.delete_pp/ppd_id/{{$pritem.ppd_id}}/bsn_id/{{$pritem.ppd_bsn_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;" title="Delete">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></th>
                 </tr>
              {{/foreach}}  
              
              <tr>
              <td colspan="2">Total value</td>
              <td> ${{$total_value_hia|number_format:2:".":","}} </td>
              <td> ${{$total_value|number_format:2:".":","}} </td>
			  <td id="payment_amount_owed">
					{{assign var="hia_val" value=$total_value_hia|replace:"$":""|replace:",":""}}
					{{assign var="base_val" value=$total_value|replace:"$":""|replace:",":""}}
					
					{{if $hia_val > 0}}
					
						{{if $base_val > 0}}
							{{math assign="diff" equation="x - y" x=$hia_val y=$base_val}}
						{{else}}
							{{assign var="diff" value=$hia_val}}
						{{/if}}
						
						${{$diff|number_format:2:".":","}}
						
					{{/if}}
			  </td>
			  <td></td>
			  <td></td>
			  <td> ${{$total_inv_val|number_format:2:".":","}} </td>
              </tr>
              
              <!--
               <script type="text/javascript">
		var x=0;
		function appendRowLp(id)
		{
		 x=x+1;
		 var row = '<tr id="r'+x+'">';
		 
		 row =  row + '<td> <input type="text" style="width:160px" name="payment2[ppd_stage]" />';
		 row =  row + '<td> <input type="text" style="width:35px"  name="payment2[ppd_percent]" />';
		 row =  row + '<td> <input type="text" style="width:50px"  name="payment2[ppd_value]" />';
		 row =  row + '<td> F <input type="text" style="width:70px" id = "demo1" class="w16em dateformat-d-ds-m-ds-Y"  name="payment2[ppd_forcast_date]"  />';
		 row =  row + '<td> <input type="text" style="width:50px"  name="payment2[ppd_value]" />';
		 row =  row + '</tr>';
		 
		 $("#list-table2").append(row);
		 
		 document.detail.submit();
		}
		
		
		</script>		
              -->
              
               </table>      
            
            
           <!-- <input type="submit" onclick="appendRowLp()" value="Add New" name="blank" />-->
			<div style="display: flex;margin-top: 5px;align-items: center;justify-content: center;">
				<input type="submit"  value="Add New" name="blank" style="margin-top:5px;"/>&nbsp;&nbsp;
				<input type="Submit" name="ppsave" value="Save Progress Payment" style="margin-top:5px;" /> &nbsp;&nbsp;
				<span>Outstanding Invoices</span>&nbsp;&nbsp;
				<label class="switch" for="outstanding_payment{{$detail.bsn_id}}">
				  <input id="outstanding_payment{{$detail.bsn_id}}" class="switch-input" {{ if $outstanding_payment == 1 }}checked{{ /if }} onchange="outstandingToggle('{{$detail.bsn_id}}', 'bsn_wa_outstanding_payment', this)" type="checkbox" />
				  <span class="switch-label" data-on="Yes" data-off="No"></span>
				  <span class="switch-handle"></span> <br />
				</label>
			</div>
			<script>
				function outstandingToggle(record_id, c, t) {
				  //console.log(record_id, c, t);
				  let activeStatus = 0;
				  if ($(t).is(":checked")) {
					  activeStatus = 1;
				  }
				  const formData = {
					  r_ID: record_id,
					  column: c,
					  flag: activeStatus,
					  action: "outstandingToggle"
				  };
				  //console.log(formData);
				  $.ajax({
					  type: "POST",
					  url: "{{$BASE_URL}}business.outstanding_payment_handler",
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
		    </script>
           	
              
             {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                     <tr><td><strong>Must save business listing first.</strong></td></tr>
            </table>
            {{/if}}
     </div>
    
    <script language="javascript">
	
	function showdate(a)
	{
		
		var id ="#fc_"+a;
		var id2 = "#plus"+a;
						
		$(id).css("display","inline");
	}
	
	function update(b,c)
	{
		
		var idv = '#col_'+ b;
		var bak = '#cf' + b;
		if(c=='F') {	
						$(idv).css('background', '#F00')
						
						
					}
		else {
			$(idv).css('background', '#CCC')
		}
		
	}
	
	</script>
    
    
    <!-------Progress Payments Ends-->
  
   
   <!------Proposal Alerts--->
    
     <div id="country2700" class="tabcontent" style="display:block;">
     {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
       <input type="button" name="addenq" value="Add New" onclick="add_edit_proposal_alerts();" id="addproposalalert" class="vsml" />
       <!--<input type="button" value="Export to XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.businessalert_list}}/bs_id/{{$detail.bsn_id}}/export/1'" class="vsml" />-->
       <input type="button" value="Refresh" onclick="requestproposalalertInfo(1);" />   
       <script> requestproposalalertInfo(1); </script>            
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divproposalalertInfoToReturn"></div>
                  <div id="divproposalalert" style="display:none;">
                  <iframe name="proposalalert" id="proposalalert" src="{{$BASE_URL}}{{$XFA.proposalalert_detail}}/bsn_id/{{$detail.$ID}}" width="100%" height="280" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
     
     </div>
    <!------Proposal Alerts Ends--->

    
   <div id="country2800" class="tabcontent" style="display:block;">
     {{if $detail.bsn_id}} 
     <script>
     requestPurchseOrder('add');
     </script>
  <!-- <input type="button" name="CreatePurchaseOrder" value="Create Quote Purchase Order" onclick="requestPurchseOrder('add');" />-->
   <input type="button" name="addenq" value="Add Custom Component" onclick="add_edit_component();" id="addenq2" class="vsml" />
   <input type="button" value="List / Refresh Custom Component" onclick="requestcomponentInfo(1);" />   
   <br /><br />
    
      
     <div id="divbusinessenquiryInfoToReturn_c"></div>
                  <div id="divbyersaleenquiry_c" style="display:none;">
                  
                  <iframe name="businessenquiry_c" id="businessenquiry_c" src="{{$BASE_URL}}business.custom_component/bsn_id/{{$detail.$ID}}" width="100%" height="150" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div> 
                        
    <div id="divbusinessdocInfoToReturn1"></div>
    <div id="PurchaseOrderDiv"></div>
    <br />
    
    <iframe name="addcomponentIframe" id="addcomponentIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    
    <iframe name="purchaseIframe" id="purchaseIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
            {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
     {{/if}}
     
  </div>
  
  
    <!------Due Date Time Tracker--->
    
     <div id="country3100" class="tabcontent" style="display:block;">
     {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
       <input type="button" name="addenq" value="Add New" onclick="add_edit_time_tracker();" id="addtimetrackeralert" class="vsml" />
        <input type="button" value="Refresh" onclick="requestddtimetrackerInfo(1);" />   
   <!--    <script> requestproposalalertInfo(1); </script> -->
       <script> requestddtimetrackerInfo(1); </script>            
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divtimetrackerInfoToReturn"></div>
                  <div id="divtimetracker" style="display:none;">
                  <iframe name="timetracker" id="timetracker" src="{{$BASE_URL}}business.timetracker_detail/bsn_id/{{$detail.$ID}}" width="100%" height="280" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
     
     </div>
    <!------PDue Date Time Tracker  Ends--->
  
  <!------- Delivery ---->
   <!------Recorded Meetings-->
    
     <div id="country3200" class="tabcontent">
    {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
                
              
       <input type="button" name="adddelivery" value="Add New" onclick="add_edit_delivery();" id="adddelivery" class="vsml" />
       <input type="button" value="Show" onclick="requestdeliveryInfo(1);" />               
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divdeliveryToReturn"></div>
                  <div id="divdelivery" style="display:none;">
                  <iframe name="deliverydata" id="deliverydata" src="{{$BASE_URL}}business.delivery_detail/bsn_id/{{$detail.$ID}}" width="100%" height="330" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
    
     </div>
  
  <!----- Delivery Ends-->
  
  <!----Special Condition Starts -->
          <div id="country3300" class="tabcontent"> {{if $detail.bsn_id}}
            &nbsp;
             
   <input type="button" name="adddoc_sp" value="Add New" onclick="RequestcheckListIframe('addspecialcondition','','divspecialcondition','');" id="adddoc_sp" class="vsml" />
            
            <input type="button" name="adddoc_sp" value="Show" onclick="iframeRequest(7,'');" id="adddoc_sp" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage" onchange="javascript:iframeRequest(7,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
                         
    <div id="divspecialcondition"></div>
    <br />
    <iframe name="addspIframe" id="addspIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
    {{/if}} 
            
    </div>
  <!---- Special Condition Ends ---->
  
  
  <!----Variations Starts -->
          <div id="country3400" class="tabcontent"> {{if $detail.bsn_id}}
            &nbsp;
             
   <input type="button" name="adddoc_var" value="Add New" onclick="RequestcheckListIframe('addvariations','','divvariations','');" id="adddoc_var" class="vsml" />
            
            <input type="button" name="adddoc_var" value="Show" onclick="iframeRequest(8,'');" id="adddoc_var" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage_var" onchange="javascript:iframeRequest(8,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
                         
    <div id="divvariations"></div>
    <br />
    <iframe name="addvariationsIframe" id="addvariationsIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
    {{/if}} 
            
    </div>
  <!---- Variations Ends ---->
  
  
  <!----Design Plans Starts -->
          <div id="country3500" class="tabcontent"> {{if $detail.bsn_id}}
            &nbsp;
             
   <input type="button" name="adddoc_var" value="Add New" onclick="RequestcheckListIframe('adddesignplan','','divdesignplan','');" id="adddoc_var" class="vsml" />
            
            <input type="button" name="adddoc_var" value="Show" onclick="iframeRequest(9,'');" id="adddoc_var" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage_dp" onchange="javascript:iframeRequest(9,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
                         
    <div id="divdesignplan"></div>
    <br />
    <iframe name="adddesignplanIframe" id="adddesignplanIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
    {{/if}} 
            
    </div>
  <!---- Design Plans Ends ---->
	
	<div id="property_customer_page" class="tabcontent">
		<h3 style="font-size: 1.7em; font-weight: bold; margin-top: 40px; margin-bottom: 40px;">Client Overview</h3>
		<iframe name="clientOverviewFrame" id="clientOverviewFrame" src="{{ $BASE_URL }}{{ $XFA.client_overview }}?bsn_id={{ $detail.bsn_id }}" frameborder="0" width="100%" height="100%" style="height: 100vh;"></iframe>
	</div>

	<div id="action_items" class="tabcontent">
		<h3 style="font-size: 1.7em; font-weight: bold; margin-top: 40px; margin-bottom: 40px;">Action Items</h3>
		<iframe name="actionItemsFrame" id="actionItemsFrame" src="{{ $BASE_URL }}{{ $XFA.action_items_home }}/bsn_id/{{ $detail.bsn_id }}" frameborder="0" width="100%" height="100%" style="height: 100vh;"></iframe>
	</div>

	<div id="site_progress" class="tabcontent">
		<h3 style="font-size: 1.7em; font-weight: bold; margin-top: 40px; margin-bottom: 40px;">Site Progress</h3>
		<iframe name="siteProgressFrame" id="siteProgressFrame" src="{{ $BASE_URL }}{{ $XFA.site_progress_report_home }}/bsn_id/{{ $detail.bsn_id }}" frameborder="0" width="100%" height="100%" style="height: 100vh;"></iframe>
	</div>
	
	<div id="phone_log" class="tabcontent">
		<h3 style="font-size: 1.7em; font-weight: bold; margin-top: 40px; margin-bottom: 40px;">Phone Log</h3>
		<iframe name="phonelogFrame" id="phonelogFrame" src="{{ $BASE_URL }}{{ $XFA.phone_log_frame }}/bsn_id/{{ $detail.bsn_id }}" frameborder="0" width="100%" height="100%" style="height: 70vh;"></iframe>
	</div>

  
  <!----Latest Merge Plans  Plans Starts -->
          <!-- <div id="country3600" class="tabcontent"> {{if $detail.bsn_id}}
            &nbsp;
             
   <input type="button" name="adddoc_var" value="Add New" onclick="RequestcheckListIframe('addlmp','','divlmp','');" id="adddoc_lmp" class="vsml" />
            
            <input type="button" name="adddoc_lmp" value="Show" onclick="iframeRequest(10,'');" id="adddoc_lmp" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage_lmp" onchange="javascript:iframeRequest(10,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
                         
    <div id="divlmp"></div>
    <br />
    <iframe name="addlmpIframe" id="addlmpIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
    {{/if}} 
            
    </div> -->
  <!---- Latest Merge  Plans Ends ---->
  
  
  
  <div id="country2900" class="tabcontent" style="display:block;">
  <script language="javascript">
  function showlert(po_id,po)
 {
	var viewurl = "{{$BASE_URL}}purchase_order.alert"+ "/po_id/" + po_id + "/po/" + po;	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
				
				 
        });
      });
}
  
  </script>
  
  
     {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF">
           
              <tr>
                <th colspan="10">
                                           
                      <table id="elog_table" cellpadding="0" cellspacing="0" width="100%" id="emaillog">
                      <tr>
                 
                      <th width="10%"> Component </th>
                      <th width="15%"> Supplier Name</th>
                      <th width="8%"> Linked Quote</th>
                      <th width="10%">Value ($)</th>
                      <th width="10%"> Linked To Invoice</th>
                       <th width="10%"> Purchase Order</th>
                      <th width="10%"> Alert</th>
                      <th width="15%"> PO Sent Date </th>
                      <th width="15%"> PO Upload Date </th>
                       
                      </tr>
                     {{foreach from=$proj_po_list key="key10" item="item10"}}
                     <tr>
                     
                     <td style="text-align:left;">{{$item10.pc_name}} 
                     {{if $item10.po_component_name}} {{$item10.po_component_name}} {{/if}}
                     </td>
                     <td style="text-align:left;">{{$item10.po_supplier1}}</td>
                     <td style="text-align:left;">
                         {{if $item10.po_quote1}}
                                  <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item10.po_quote1}}">Link</a>
                         {{/if}}
                       {{if $item10.po_linked_quote}} 
                       		  <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item10.po_linked_quote}}">Link</a>
                       {{/if}}
                      </td>
                      <td> {{$item10.po_value1}}</td>
                     <td style="text-align:left;"> </td>
                     <td style="text-align:left;"> 
                      {{if $item10.po_purchase_order}} <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item10.po_purchase_order}}">Link</a>{{/if}}
                     </td>
                     <td style="text-align:left;">
                     <input type="button" name="Alert" value="Read Alert" onclick="javascript:showlert({{$item10.po_id}},{{$item10.po}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
                      </td>
                    <td>{{$item10.po_sent_date}}</td>
       		    <td>{{if $item10.po_purchase_order}} {{$item10.po_upload_date}}{{/if}}</td>
                    
                                          
                     </tr>
                     {{/foreach}}
                      </table>
   {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">    
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'><< previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><< previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next >></span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>

</table> 
{{/if}}

                
                </th>
              </tr>
  
            </table>
            {{else}}
            <div align="left" class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save business listing first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
            </div>
 
     
  </div>
  
  
  
  
           <div id="country300" class="tabcontent"> 
           {{if $detail.bsn_id}}
            <input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}{{$XFA.checklistemail}}/bus_id/{{$detail.bsn_id}}','90%','90%', 'yes');" id="addfile" class="vsml" />
            &nbsp;
         <input type="button" name="adddoc" value="Add New" onclick="RequestcheckListIframe('adddocuments','','divbusinessdocInfoToReturn','');" id="adddoc" class="vsml" />
            <input type="button" name="adddoca" value="Show" onclick="iframeRequest(1,'');" id="adddoc" class="vsml" />
       
            Per Page:
            <select name="docperpage" id="docperpage" onchange="javascript:iframeRequest(1,'');">
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
              <option value="30">30</option>
              <option value="40">40</option>
              <option value="50">50</option>
              <option value="100">100</option>
            </select>
            <input type="button" name="CreateDocumentCheckList" value="Load Document Check List" onclick="requestDocumentCheckList('add');" />
                        
    <div id="divbusinessdocInfoToReturn"></div>
    <div id="DocumentCheckListDiv"></div>
    <br />
    <iframe name="adddocumentsIframe" id="adddocumentsIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="checkListIframe" id="checkListIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
            {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
            {{/if}} 
            
            </div>
            
            
            <div id="country400" class="tabcontent"> {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
       <input type="button" name="addenq" value="Add Path" onclick="add_edit_ms_team();" id="addenq" class="vsml" />
       <!--<input type="button" value="Export to XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.msteam_list}}/bs_id/{{$detail.bsn_id}}/export/1'" class="vsml" />-->
       <input type="button" value="List" onclick="requestbusenquiryInfo(1);" />               
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divbusinessenquiryInfoToReturn"></div>
                  <div id="divbyersaleenquiry" style="display:none;">
                  <iframe name="businessenquiry" id="businessenquiry" src="{{$BASE_URL}}{{$XFA.msteam_detail}}/bsn_id/{{$detail.$ID}}" width="100%" height="280" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
             </div>
            
           <!-- 
             <div id="country700" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th colspan="10"><input type="button" name="adddoc" value="Show Quote" onclick="RequestcheckListIframe('quotes','','','');" id="adddoc" class="vsml" /></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF">
        <iframe name="quoteIframe" id="quoteIframe" src="" class="quoteIframe" frameborder="0" scrolling="yes" hspace=10 vspace=5 width="100%" height="1" onload="javascript:closeTop();" ></iframe>
                </th>
              </tr>
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
            </table>
          </div> -->
          
          
            <div id="country700" class="tabcontent">
            <table id="list-table" width="60%" cellpadding="3" cellspacing="0" border="1" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              
              <tr>
                <th style="width:40%">Add to Proposal Checklist Report</th>
                 <td><input type="checkbox"  {{if $rpc eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
              <tr>
                <th style="width:40%">Add to Planning Assessment Quick Report</th>
                 <td><input type="checkbox"  {{if $rpaq eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
              <tr>
                <th style="width:40%">Add to Design Report</th>
                 <td><input type="checkbox"  {{if $rd eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
              <tr>
                <th style="width:40%">Add to Construction Pipeline Report</th>
                 <td><input name = "add_cpr" type="checkbox" {{if $bsn_showin_cpr eq 1}} checked="checked" {{/if}}  onclick="update_cpr({{$businessid}},this.checked)" />
              
              <script language="javascript">
	   
		function update_cpr(id,value)
		{
			
			var val = 0;
			if(value==true) { val = 1; } 
			if(value==false) { val = 2; } 
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_cpr/bsn_id/"+id+"/value/"+val,
					   success: function(result){
				   }
				 });
		}
	   </script>
              </td>
              </tr>
              <tr>
                <th style="width:40%">Add to Complete Report</th>
                 <td><input type="checkbox"  {{if $rc eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
              
              <tr>
                <th style="width:40%">Add to Inclusion Report</th>
                 <td><input type="checkbox"  {{if $ri eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
               <tr>
                <th style="width:40%">Add to Inclusion Task Tracker</th>
                 <td><input type="checkbox"  {{if $ritt eq 1}} checked="checked" {{/if}} /></td>
              </tr>
              
               <tr>
                <th style="width:40%">Add to Planning Progress Report</th>
                 <td><input type="checkbox"  {{if $rpp eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
               <tr>
                <th style="width:40%">Add to Planning Task Tracker</th>
                 <td><input type="checkbox"  {{if $rptt eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
              <tr>
                <th style="width:40%">Add to Proposal Control Panel Report</th>
                 <td><input type="checkbox"  {{if $rpcp eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
               <tr>
                <th style="width:40%">Add to Construction Task Tracker</th>
                 <td><input type="checkbox" {{if $rctt eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
               <tr>
                <th style="width:40%">Add to Construction Report</th>
                 <td><input type="checkbox"  {{if $rcons eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
               <tr>
                <th style="width:40%">Add to Post Par Report</th>
                 <td><input type="checkbox"  {{if $rpopar eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
               <tr>
                <th style="width:40%">Add to Design Take Off Report</th>
                 <td><input type="checkbox"  {{if $rpopar eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              
              
               <tr>
                <th style="width:40%">Add to Project Plans Report</th>
                 <td><input type="checkbox"  {{if $rplans eq 1}} checked="checked" {{/if}} /></td>
              </tr> 
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
            </table>
          </div>
          
           <div id="country2100" class="tabcontent"> {{if $detail.bsn_id}}

            <input type="button" name="CreateDocumentCheckList" value="Load Proposal CheckList" onclick="requestDocumentCheckListMini('add');" />
            <input type="button" name="Show" value="Open Proposal Checklist" onclick="requestDocumentCheckListMini('show');" />
             <input type="button" name="Synchr" value="Synchronize" onclick="requestDocumentCheckListMini('sync');" />
            <input type="button" name="CreateDocumentCheckList" value="Create New Proplsal Checklist" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListMini('add_new');" />
           
                        
   <!-- <div id="divbusinessdocInfoToReturn"></div>-->
    <div id="DocumentCheckListDivMini"></div>
    <br />
    <iframe name="adddocumentsIframe" id="adddocumentsIframemini" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="checkListIframeMini" id="checkListIframeMini" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="adddoc_checkListIframeMini" id="adddoc_checkListIframeMini" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
   
            {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
            {{/if}} 
            
            </div>
          
     
    <div id="country3000" class="tabcontent"> {{if $detail.bsn_id}}

    <input type="button" name="CreateDocumentCheckList" value="Load CheckList" onclick="requestDocumentCheckListRenovation('add');" />
    <input type="button" name="Show" value="Open Checklists" onclick="requestDocumentCheckListRenovation('show');" />
    <input type="button" name="Synchr" value="Synchronize" onclick="requestDocumentCheckListRenovation('sync');" />
    <input type="button" name="CreateDocumentCheckList" value="Create New Checklist" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListRenovation('add_new');" />
  
    <div id="DocumentCheckListDivRenovation"></div>
    <br />
    <iframe name="adddocumentsIframe" id="adddocumentsIframerenovation" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="checkListIframeRenovation" id="checkListIframeRenovation" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="adddoc_checkListIframeMini" id="adddoc_checkListIframeRenovation" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
   
    {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
    {{/if}} 
            
    </div>
     
     
     
          
    <div id="country2000" class="tabcontent">
    <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
               <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr> 
              <tr>
                <th> 
    <div class="country2000">
	<p class="field switch">
		<label class="cb-enable" id="bsn_readyforsale"><span>YES</span></label>
		<label class="cb-disable selected"><span>NO</span></label>
        <input type="checkbox"   id="checkbox" class="checkbox"  value="1" name="{{$TABLE}}[bsn_readyforsale]" {{if $detail.bsn_readyforsale == 1}}  checked="checked" {{/if}}/> 
	 </p>  &nbsp;     <input type="button" name="addcustdoc" value="Add Custom Documents" onclick="RequestcheckListIframe('cdocuments','','divbusinesspadocInfoToReturn1','');" id="addcustdoc" class="vsml" />  
       
                  <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF"  >
           
              <tr>
                <th colspan="10" bgcolor="#FFFFFF" >
                  <script type="text/javascript"> 
	     			   $(document).ready(function() {
							RequestcheckListIframe('cdocuments','','divbusinesspadocInfoToReturn1','');	   
					   });	   
     			</script>
               <br /><iframe name="cdocumentsIframe" id="cdocumentsIframe" src=""  scrolling="auto" frameborder="0"  hspace=10 vspace=5 width="100%" height="5px;" style="overflow-x: hidden;"   onload="javascript:closeTop();" ></iframe> 
                  <br /><iframe name="cdocumentsIframe1" id="cdocumentsIframe1" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe> 
                   <div id="divbusinesspadocInfoToReturn1"></div> 
                  </th>
              </tr>

            </table> 
    </div></th>
              </tr>
              <tr>
           <th colspan="10" bgcolor="#FFFFFF">
	<div id="divaqsection"><br />
<hr style="width:98%; padding-left:0px; float:left;" />
<table width="100%" border="1" style="background-color:#FFFFFF;" id="none-table">
<tr> <th colspan="10">  <span> &nbsp; <select name="{{$TABLE}}[bsn_approval_type]" style="width:200px;">
                {{foreach from=$approvals key="id" item="oprname"}}
                <option value="{{$id}}" {{if $id == $detail.bsn_approval_type}} selected="selected" {{/if}}>{{$oprname}}</option>
                {{/foreach}}
            </select> </span> </th> </tr>
<tr><th colspan="10"><h1 style="font-size:18px;">Notes:</h1><br /></th></tr>
<tr>
                <th colspan="10"> 
      <input type="button" name="addnotes" value="Add New" onclick="RequestcheckListIframe('panotes','','divbusinesspanotesInfoToReturn','');" id="addnotes" class="vsml" />
                <input type="button" name="shownotes" value="Show" onclick="javascript:iframeRequest(5,'');" id="shownotes" class="vsml" />
                  Per Page:
                  <select name="panotesperpage" id="panotesperpage" onchange="javascript:iframeRequest(5,'');">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="40">40</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                  </select>           
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
<tr><td colspan="10">
<div id="divbusinesspanotesInfoToReturn" class="divInfoToReturn"></div><br />
<iframe name="panotesIframe" id="panotesIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
</td></tr>
 <tr>
              	<td><hr />
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
            <tr><th colspan="2"><h1 style="font-size:18px;">Documents:</h1></th></tr>
            <tr><td>&nbsp;</td></tr>
              <tr>
              <th colspan="10">
               <input type="button" name="adddoc" value="Add New" onclick="RequestcheckListIframe('padocuments','','divbusinesspadocInfoToReturn','');" id="adddoc" class="vsml" />
                <input type="button" name="adddoc" value="Show" onclick="iframeRequest(4,'');" id="adddoc" class="vsml" />
                  Per Page:
                  <select name="padocperpage" id="padocperpage" onchange="javascript:iframeRequest(4,'');">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="40">40</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                  </select>
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> <div id="divbusinesspadocInfoToReturn"></div>
                  <br /><iframe name="padocumentsIframe" id="padocumentsIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe></th>
              </tr>

            </table>
              	</td>
              </tr>
              
              <tr>
              	<td><hr />
 
              	</td>
              </tr>
              
              
             {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
</table>        
 </div>
<script type="text/javascript">
	$(document).ready( function(){ 
		$(".cb-enable").click(function(){
			var parent = $(this).parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$('#divaqsection').show('slow');
		});
		$(".cb-disable").click(function(){
			var parent = $(this).parents('.switch');
			$('.cb-enable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox',parent).attr('checked', false);
			$('#divaqsection').hide('slow');
		});
	});
		</script>
 {{if $detail.bsn_readyforsale == 1}}
 <script type="text/javascript">
	$(document).ready( function(){ 
			var parent = $('#bsn_readyforsale').parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$('#bsn_readyforsale').addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$('#divaqsection').show('slow');				
		});
		</script>
 {{/if}}       
        </th>
              </tr>
             
            </table>
         </div> 
        <!--Price Range End-->
         </div> 
        <script type="text/javascript">
			var countries=new ddtabcontent("countrytabs")
			countries.setpersist(true)
			countries.setselectedClassTarget("link") //"link" or "linkparent"
			countries.init()
		</script>
      </th>
    </div>
    </tr>
  </table>
  </div>
  <div align="center" style="background-color:#FFFFFF;"> 
  <table>
    <tr>
      <td colspan="10" align="center">     
         
          <div id="country500" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th><input type="button" name="addfile" value="Compose" onclick="RequestcheckListIframe('nwen','','divnwen','');" id="addfile" class="vsml" /></th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF";> <div id="divnwen"></div>
  <iframe name="nwenIframe" id="nwenIframe" src=""  frameborder="0" scrolling="yes" height="5px;" hspace=10 vspace=5 width="100%" onload="javascript:closeTop();" ></iframe></th>
              </tr>
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
            </table>
          </div>
          <div id="country600" class="tabcontent">
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              {{if $detail.$ID}}
              <tr>
                <th><input type="button" name="addfile" value="Compose & send" onclick="RequestcheckListIframe('truelog','','divtruelog','');" id="addfile" class="vsml" />
                  &nbsp;&nbsp;&nbsp;Auto send e-dossier&nbsp;&nbsp;&nbsp;
                  <input type="checkbox" name="{{$TABLE}}[bsn_auto_edossier]" value="1" {{if $detail.bsn_auto_edossier == 1}} checked="checked" {{/if}} />
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" value="Show Log" onclick="requestbuselogInfo(1);" />
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF";> <div id="divtruelog"></div>
                  <iframe name="truelogIframe" id="truelogIframe" src=""  frameborder="0" scrolling="no" height="5px;" hspace=10 vspace=5 width="100%" onload="javascript:closeTop();" ></iframe></th>
              </tr>
              {{else}}
              <tr>
                <th colspan="10"><div class="savelisting">Must save project first.</div></th>
              </tr>
              {{/if}}
            </table>
          </div>
          <script type="text/javascript">
				var countries=new ddtabcontent("countrytabs2")
				countries.setpersist(true)
				countries.setselectedClassTarget("link") //"link" or "linkparent"
				countries.init()
			</script>
        </div></td>
    </tr>
     <tr>

        <td colspan="10" align="center">
        <div id="michael1" style="width: 1450px; background: #FFFFFF; display: block;" align="center">

          <ul id="countrytabs3" class="shadetabs">
            <li><a href="#" rel="country110" class="selected">Money</a></li>
			<li><a href="#" rel="country120" class="selected">Construction</a></li>
            <li><a href="#" rel="country180">Sales Follow Up</a></li> 
            <li><a href="#" rel="country190">Person Responsible</a></li> 
            <li><a href="#" rel="country210">Email Library</a></li> 
            <li><a href="#" rel="country220">Email Logs</a></li> 
            <li><a href="#" rel="country230">Automated Reports</a></li> 
            <li><a href="#" rel="country240">Video Links</a></li>
            <li><a href="#" rel="country250">Alerts</a></li>  
            <li><a href="#" rel="country260">GCONS Project Logs</a></li> 
            <li><a href="#" rel="country270">Planning Project Checklist </a></li>
            <li><a href="#" rel="country280">Entities</a></li>
            
          </ul>

          <div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px;">
            <div id="country110" class="tabcontent">
                       {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
                <tr>
                  <th colspan="10">
                  <input type="button" name="addenq" value="Update Money" onclick="add_edit_money();" id="addenq" class="vsml" />
              		<!-- &nbsp;<input type="button" value="Show" onclick="requestmoneyInfo(1);" />-->
                  </th>
                </tr>
                <tr>
                  <th colspan="10" height="50">&nbsp;</th>
                </tr>
              <tr>
               <th colspan="10" bgcolor="#FFFFFF"> 
               <div id="divbusinessmoneyInfoToReturn"></div><br />
                <div id="divmoney" style="display:none;">
    			 <iframe name="businessmoney" id="businessmoney" src="{{$BASE_URL}}{{$XFA.money}}/bsn_id/{{$detail.$ID}}" width="100%" height="270" frameborder="0" scrolling="yes" hspace=10 vspace=5 onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll;"></iframe>
                    </div></th>
                </tr>
              </table>
              {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
            <tr>
          <td>
		<strong>Must save business listing first.</strong>            
       </td>
      </tr>
     </table>
            {{/if}}
            </div>
            
            
            <div id="country120" class="tabcontent">
             {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
                <tr>
                  <th height="50" width="150">Project Start Date:</th>
                  <th><input type="text" name="bsn_status_date" value="14-08-2012" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y"/></th>
                  <th width="180">Proposed Complete Date:</th>
                  <th><input type="text" name="business[bsn_proposed_date]" value="0000-00-00" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y"/></th>
                  <th width="180">Project Complete Date:</th>
                  <th><input type="text" name="business[bsn_complete_date]" value="0000-00-00" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y"/></th>
                </tr>
                <tr>
                  <th>Total Team Hours:</th>
                  <th><input type="text" name="business[bsn_total_team_hours]" value="0" /></th>
                  <th>Total Individual Hours:</th>
                  <th><input type="text" name="business[bsn_total_ind_hours]" value="0" /></th>
                  <th></th>
                  <th></th>
                </tr>
                 <tr>
                  <th>Select Work Team:</th>
                  <th>
                  	  <select name="business[bsn_work_team]">
                  		<option value="0">--Select Team--</option>
                      </select>
                  </th>
                  <th>Select Individual Person:</th>
                  <th>
                  	  <select name="business[bsn_ind_per]">
                       <option value="0">--Select--</option>
                       {{foreach from=$salesagents item="item" key="key"}}
                        <option value="{{$item.user_id}}" >{{$item.user_name}}</option>	
                        {{/foreach}}
                      </select>
                  </th>
                  <th></th>
                  <th></th>
                </tr>              
                <tr>
                  <th colspan="6" bgcolor="#FFFFFF"> <div id="divbyersaleInfoToReturn2"></div></th>
                </tr>
              </table>
             {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                     <tr><td><strong>Must save business listing first.</strong></td></tr>
            </table>
            {{/if}}
            </div>
            
             <div id="country180" class="tabcontent" > 
           {{if $detail.bsn_id}}
            <table cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td colspan="2">Sales Follow Up</td>
                <td  width="40%"><!--<input type="button" name="" value="Get New Client" />--></td>
            </tr>
            <tr>
            <td><input type="button" name="Add New" value="Add New" id="add_new" />&nbsp;<input type="button" id="view_log" name="View Log" value="View Log" />
            <input type="button" name="report" value="Print" onclick="javascipt:print_sales_follow_up();" />
            
            <input type="submit" name="sales_story" value="Save Story" />
            </td>
            <td colspan="2"><!--Procedure and Script--></td>	
            </tr>
            <tr> 
            <td colspan="3"> Project Story <br />
            
            <textarea  cols="180" id="editor1" name="{{$TABLE}}[bsn_project_story]" rows="10">{{$detail.bsn_project_story}}</textarea>
            </td>
            </tr>
            
            <tr><td colspan="3">
            <div id="opr"></div>
            <div id="listdiv_new" style="display:none;" onload="javascript:closeTop();return false;"></div>
            <div id="adddiv_new" style="display:none;">
    <iframe name="divfollowups" id="divfollowups" src="" width="100%" height="300"  frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();return false;"></iframe>
          &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="Close" id="divclose" />
            </div> 
            </td></tr>
            </table>
  <script type="text/javascript">
            $('#add_new').click(function(){
			$('#adddiv_new').show('slow');
			showTop();
			$("#divfollowups").attr("src", "{{$BASE_URL}}{{$XFA.common}}?a_req=followups&bus_id={{$detail.$ID}}");
			});
			
			$('#view_log').click(function(){
			$('#listdiv_new').show('slow');
			showTop();
			$("#listdiv_new").load("{{$BASE_URL}}{{$XFA.common}}?a_req=followupslist&bus_id={{$detail.$ID}}" , function(){ closeTop(); });
			});

			$('#divclose').click(function(){
			$('#adddiv_new').hide('slow');
			});
		 function add_edit_followups(id)
				{
				$('#adddiv_new').show('slow');
				showTop();
				$("#divfollowups").attr("src", "{{$BASE_URL}}{{$XFA.common}}?a_req=followups&bus_id={{$detail.$ID}}&sf_id="+id);
				}  	
				
			function requestFollowupsDiv(pagenum)
				{
				$('#listdiv_new').show('slow');
			showTop();
			$("#listdiv_new").load("{{$BASE_URL}}{{$XFA.common}}?a_req=followupslist&bus_id={{$detail.$ID}}&pagenum="+pagenum , function(){ closeTop(); });
				}	
				
		function requestfollowupsDelete(id)		
				{
				//showTop();
			$("#opr").load("{{$BASE_URL}}{{$XFA.common}}?a_req=followupsdel&sf_id="+id , function(){ closeTop(); requestFollowupsDiv();});
			$('#opr').fadeOut(5000);
				}
  </script>          
            
            <div id="allfollowups" align="left"></div>
            {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
              <tr>
                <td><div class="savelisting"> Must save project first. </div></td>
              </tr>
            </table>
            {{/if}} </div>           
            
            <div id="country190" class="tabcontent">
             {{if $detail.bsn_id}} 
              <table id="list-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF" style="border:1px solid #999 !important">
                <tr>
                  <th height="50" width="20%">Stream:</th>
                  <th height="50" width="55%">Position:</th>
                  <th height="50" width="15%">Name:</th>
                  <th height="50" width="10%">Action:</th>
                  
                </tr>
                
              {{foreach from=$person_responsible_detail item="pritem" key="prkey"}}
                <tr>
                  <td>{{$pritem.prd_stream}}</th>
                  <td>{{$pritem.prd_position}}</th>
                  <td>
  <input type="text"  name="person[{{$pritem.prd_id}}][name]" value="{{$pritem.prd_name}}" id ="pr{{$pritem.prd_id}}"  />
                 
                  </th>
                  <td><a href="{{$BASE_URL}}business.delete_pr/prd_id/{{$pritem.prd_id}}/bsn_id/{{$pritem.prd_bsn_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;" title="Delete">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></th>
                 </tr>
              {{/foreach}}         
            <tr> 
            <th colspan="4" align="center"><input type="Submit" name="pr" value="Save Person Responsible" style="margin-top:5px;" /> </th>
            </tr>	
              </table>
             {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                     <tr><td><strong>Must save business listing first.</strong></td></tr>
            </table>
            {{/if}}
            </div>

                  
            
             <div id="country210" class="tabcontent">
             {{if $detail.bsn_id}} 
             <script type="text/javascript">
			
				function setemail(value, bsn_id)
				{
				
				   $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/business.emailsend/id/"+value+"/bsn_id/"+bsn_id,
						   success: function(result){
							    $('#status').html(result);
					   }
					 });
					
				}
			</script>
							 
              <table id="list-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF" style="border:1px solid #999 !important">
                <tr>
                  <th height="50" width="20%">Select Template:
                  
                  <select name="emllib" id="eml_id" onchange="setemail(this.value, {{$detail.bsn_id}})">
                  <option value="0">Email Select Template </option>
                  {{foreach from = $emlibDetail key="ekay" item="eitem" }}
                  <option value="{{$eitem.eml_id}}">{{$eitem.eml_code}}</option>
                  {{/foreach}}
                  </select>
                  </th>
                </tr>
              </table>
              {{if $email_sent_ok}} {{$email_sent_ok}}{{/if}}
              <div id="status"> 
              <!-- do not delete this blank div -->
              </div>
              
             {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                     <tr><td><strong>Must save business listing first.</strong></td></tr>
            </table>
            {{/if}}
            </div>
            
            
                        
    <div id="country220" class="tabcontent">
    
          {{if $detail.bsn_id}}
            <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="1" bgcolor="#FFFFFF">
           
              <tr>
                <th colspan="10">
                                           
                      <table id="elog_table" cellpadding="0" cellspacing="0" width="100%" id="emaillog">
                      <tr>
                 
                      <th width="7%"> Email Code </th>
                      <th width="10%"> Date Sent</th>
                      <th width="8%"> Sent From</th>
                      <th width="8%"> Sent To</th>
					  <th width="8%"> Sent CC</th>
                       <th width="8%"> Subject</th>
                      <th width="15%"> Business</th>
                      <th width="15%"> Document Attached </th>
                      <th width="15%"> Template Attached </th>
                       <th width="6%"> View Content </th>
                      </tr>
                     {{foreach from=$list key="key" item="item"}}
                     <tr>
                     
                     <td style="text-align:left;">{{$item.elog_eml_code}}</td>
                     <td style="text-align:left;">{{$item.elog_date|date_format:"%d-%b-%Y"}}</td>
                     <td style="text-align:left;">{{$item.elog_from}} </td>
                     <td style="text-align:left;">
						{{$item.elog_to}}
						{{if $item.elog_to_secondary}}
							<br />
							{{$item.elog_to_secondary}}
						{{/if}}
						{{if $item.elog_to_email3}}
							<br />
							{{$item.elog_to_email3}}
						{{/if}}
						{{if $item.elog_to_email4}}
							<br />
							{{$item.elog_to_email4}}
						{{/if}}
						{{if $item.elog_to_email5}}
							<br />
							{{$item.elog_to_email5}}
						{{/if}}
					</td>
					<td style="text-align:left;">{{$item.elog_cc}}</td>
                     <td style="text-align:left;">{{$item.elog_subject}} </td>
                     <td style="text-align:left;">{{$item.elog_business}} </td>
                     <td style="text-align:left; word-break: break-all; white-space: wrap;">{{$item.elog_doc_attached}} </td>
                     <td style="text-align:left; word-break: break-all; white-space: wrap;">{{$item.elog_temp_attached}} </td>
                     <td><a href="{{$BASE_URL}}{{$XFA.emailview}}/elog_id/{{$item.elog_id}}" class="various3" title="View Email">
                    <img src="{{$BASE_URL}}css/admin/images/view.png"/></a> </td>
                                          
                     </tr>
                     {{/foreach}}
                      </table>
   {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">    
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'><< previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><< previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next >></span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>

</table> 
{{/if}}

                
                </th>
              </tr>
  
            </table>
            {{else}}
            <div align="left" class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save business listing first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
            </div>
            
             <div id="country230" class="tabcontent">
              {{if $detail.bsn_id}} 
              <table id="list-table" width="100%" cellpadding="5" cellspacing="0"  style="border: 1px #CCCCCC solid;" bgcolor="#FFFFFF">
                <tr>
                  <th width="70%">Report Name</th>
                  <th width="30%">Yes/No</th>
                </tr>
              {{foreach from=$arDetail item="baritem" key="barkey"}}
                  <tr>
                  <td>{{$baritem.bar_report_name}}</td>
<!--                  <td><input type="radio" name="ar{{$baritem.ar_id}}" value="1"  onclick="yesno({{$detail.bsn_id}}, {{$baritem.ar_id}},  this.value)"/>Yes 
                  <input type="radio" name="ar{{$baritem.ar_id}}"  value="0" onclick="yesno({{$detail.bsn_id}}, {{$baritem.ar_id}}, this.value)" />No 
                 <span id="myElem{{$baritem.ar_id}}" style="display:none; padding-left:10px; text-align:center;"><strong>Saving...</strong> </span>-->
                  
              <td><input type="radio" name="ar{{$baritem.bar_id}}" value="1" onclick="yesno({{$detail.bsn_id}}, {{$baritem.bar_ar_id}}, this.value)" {{if $baritem.bar_report_yesno eq 1 }} checked="checked" {{/if}}/>Yes 
                  <input type="radio" name="ar{{$baritem.bar_id}}" value="0" onclick="yesno({{$detail.bsn_id}}, {{$baritem.bar_ar_id}}, this.value)" {{if $baritem.bar_report_yesno eq 0 }} checked="checked" {{/if}} />No 
                 <span id="myElem{{$baritem.bar_ar_id}}" style="display:none; padding-left:10px; text-align:center;"><strong>Saving...</strong> </span>

                  
                  </td>
                   
                </tr>
              
              {{/foreach}}
                
              
              </table>
              {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
            <tr>
          <td>
		<strong>Must save business listing first.</strong>            
       </td>
      </tr>
     </table>
            {{/if}}
            
          <script type="text/javascript">
			 
		   function yesno(bsn_id, ar_id, value)
		   {
			var sa = '#myElem'+ar_id;
			$(sa).css('color', '#00CC66' );
	
		        if(value == 1) {
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);	
						}
				else {
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
		   		     }
		
					
		$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.update_auto_report/bsn_id/"+bsn_id+"/ar_id/"+ar_id+"/value/"+value,
			  // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
				//alert("Open Closed updated successfully");
			   }
			 });
		}
			 
			 
			 </script>
            
            
            </div>      
            
            <div id="country240" class="tabcontent"> {{if $detail.bsn_id}}
			<table  width="100%" cellpadding="5" cellspacing="0" border="0"  bgcolor="#FFFFFF">
            <tr>
       
             <th width="15%">Enter Video Link </th>  
             <td width="65%"> <input type="hidden" name="vl_bsn_id" value="{{$bsn_id}}"  />
                 <input type="text" name="vl_video_link" style="width:750px" /></td>
              <td width="20%">  <input type="submit" name="subAddDetailVideo" value="Save" class="vsml" /> </td>
           </tr>
          </table>
          {{if $video_detail}}
          <table id="list-table" width="100%" cellpadding="5" cellspacing="0"  style="border: 1px #CCCCCC solid;" bgcolor="#FFFFFF">
          <tr><th width="88%">Link </th> <th> Action </th> </tr>
          {{foreach from = $video_detail item = "vitem" key = "keyitem" }}
          <tr> 
          <td> <a href="{{$vitem.vl_video_link}}" target="_blank"> {{$vitem.vl_video_link}}</a></td>
          <td>   <a href="{{$BASE_URL}}business.vlinkdelete/vl_id/{{$vitem.vl_id}}/bsn_id/{{$vitem.vl_bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this video link.')) return false;" title="Delete">
          <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
          </tr>
          {{/foreach}}
          </table>
          {{/if}}
         

            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
            
             </div>
            
             <div id="country250" class="tabcontent">
             {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
              <tr>
                <th colspan="10"> 
       <input type="button" name="addenq" value="Add New" onclick="add_edit_business_alerts();" id="addalert" class="vsml" />
       <!--<input type="button" value="Export to XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.businessalert_list}}/bs_id/{{$detail.bsn_id}}/export/1'" class="vsml" />-->
       <input type="button" value="List" onclick="requestbusalertInfo(1);" />               
                </th>
              </tr>
              <tr>
                <th colspan="10" height="50">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="10" bgcolor="#FFFFFF"> 
                <div id="divbusinessalertInfoToReturn"></div>
                  <div id="divbyeralert" style="display:none;">
                  <iframe name="businessalert" id="businessalert" src="{{$BASE_URL}}{{$XFA.businessalert_detail}}/bsn_id/{{$detail.$ID}}" width="100%" height="280" frameborder="0" scrolling="yes" onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                  </div></th>
              </tr>
            </table>
            {{else}}
            <div align="left"  class="savelisting">
              <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                <tr>
                  <td><div class="savelisting">Must save project first.</div></td>
                </tr>
              </table>
            </div>
            {{/if}}
            </div>
            
            
            <div id="country260" class="tabcontent">
             {{if $detail.bsn_id}} 
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
                <tr>
                <td> Under Construction </td>
                </tr>
                       
              </table>
             {{else}}
            <table cellpadding="0" cellspacing="0" style="border: 0px #CCCCCC solid;">
                     <tr><td><strong>Must save business listing first.</strong></td></tr>
            </table>
            {{/if}}
            </div>
            
            
            <div id="country270" class="tabcontent">
            
            {{if $detail.bsn_id}}
          	<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
            <input type="button" name="CreatePPCheckList" value="Load Project Planning CheckList" onclick="requestPPCheckList('add');" />
                        
    <!--<div id="divbusinessdocInfoToReturn"></div>-->
    <div id="PPCheckListDiv"></div>
    <br />
    <iframe name="adddocumentsIframe" id="adddocumentsIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
    <iframe name="ppcheckListIframe" id="ppcheckListIframe" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
            {{else}}
    <div align="left" class="savelisting">Must save project first.</div>
            {{/if}}
            
            </div>
            
            <div id="country280" class="tabcontent">
            
                {{if $detail.bsn_id}}
                          	<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
                            <input type="button" name="CreatePPCheckList" value="Load Entities" onclick="requestEntitiesList('add');" />
                                        
                    <!--<div id="divbusinessdocInfoToReturn"></div>-->
                    <div id="EntitiesListDiv"></div>
                    <br />
                    <iframe name="entitesListChecklist1" id="entitesListChecklist1" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="100%" height="5px;" onload="javascript:closeTop();" ></iframe>
                    <iframe name="entitesListChecklist2" id="entitesListChecklist2" src=""  frameborder="0" scrolling="no" hspace=10 vspace=5 width="99%" height="5px;" onload="javascript:closeTop();" ></iframe>
                            {{else}}
                    <div align="left" class="savelisting">Must save project first.</div>
                {{/if}}
            
            </div>
            
            
            
            <script type="text/javascript">
			var countries=new ddtabcontent("countrytabs3")
			countries.setpersist(true)
			countries.setselectedClassTarget("link") //"link" or "linkparent"
			countries.init()
			</script>
          </div></td>

      </tr>
    <tr>
      <td colspan="6" style="padding-left:20px; padding-right:20px;">
      	<div style="border:1px solid gray; padding:0px;" align="center">
          <table cellpadding="0" cellspacing="0">
            <tr>
              <th width="100">Show Report</th>
              <td><input type="hidden" name="bsn_id" value="{{$detail.bsn_id}}" />
                <select name="report_opt" id="report_opt">
			  <!--<option value="2">Buyer Feedback</option>
                  <option value="3">Buyer Match</option>-->
                  <option value="4">Tasks All</option>
                  <option value="5">Tasks Incompleted</option>
                  <option value="6">Tasks Completed</option>
                </select>
              </td>
              <td><input type="button" name="report" value="Print" onclick="javascipt:print_report();" /></td>
            </tr>
          </table>
        </div></td>
    </tr>
    <tr>
      <td colspan="3" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
        <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
        <!--<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmation();" />-->
      </td>
    </tr>
    
  </table>
</form>
</div>
<script type="text/javascript" language="javascript">
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[bsn_name]","req", "Please specify Business Name.");
	frmvalidator.addValidation("{{$TABLE}}[bsn_suburb]","req", "Please specify Suburb.");
</script>


<script type="text/javascript"> 
	  		
		function updateCustWWW(doc_id, bsn_id, value)
		{
		  $.ajax({
			   type: "GET",
			   url: "http://www.deckquotes.com.au/business.custwwwupdate/doc_id/"+doc_id+"/bsn_id/"+bsn_id+"/value/"+value,
			  // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
				alert("Updated successfully");
			   }
			 });
		}
		
		function process(bsn_id, doc_id,value)
		{
			var idv = '#notreq'+ doc_id;
			var gr = '#gr'+doc_id
			var sa = '#myElem'+doc_id;
				$(sa).show();
			    setTimeout(function() { $(sa).hide(); }, 3000);
				
				if($(idv).is(':checked')) {
					var value = 1;
						$(gr).css('background', '#CCC')	
						$(sa).css('color', '#0C0' );
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
						
										
					}
				else {
					var value = 0;
				    	$(gr).css('background', '#FFF')
						$(sa).css('color', '#F00');
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
				}
		
			var val = 0;
			if(value==true) { val = 1; } 
			if(value==false) { val = 2; } 
			
			$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}business.not_required_save/bsn_id/"+bsn_id+"/doc_id/"+doc_id+"/value/"+value,
				   success: function(result){
			   }
			 });
			
		}
		
		
		$("#myElem").show().delay(3000).fadeOut();
		
		
		function tasknotrequired(bt_id, bt_complete)
		{
			
			var idv = '#notreqTask'+ bt_id;
			var gr = '#grTask'+bt_id
			var sa = '#myElemTask'+bt_id;
				$(sa).show();
			    setTimeout(function() { $(sa).hide(); }, 3000);
				
				if($(idv).is(':checked')) {
					var value = 1;
						$(gr).css('background', '#CCC')	
						$(sa).css('color', '#0C0' );
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
						
										
					}
				else {
						var value = 0;
						if(bt_complete == 1) {
								$(gr).css('background', '#090')
						}
						else {
							$(gr).css('background', '#FFF')
							$(sa).css('color', '#F00');
							$(sa).show();
							}
			   			setTimeout(function() { $(sa).hide(); }, 4000);
				}
			
		}
		
		
		$("#myElemTask").show().delay(3000).fadeOut();
		
		
		
		function process2(bsn_id, cdc_id)
		{
			var idv1 = '#notreq2'+ cdc_id;
			var gr1 = '#grc'+cdc_id;
			var sa1 = '#myElem2'+cdc_id;
				$(sa1).show();
			    setTimeout(function() { $(sa1).hide(); }, 3000);
				
				if($(idv1).is(':checked')) {
					var value = 1;
						$(gr1).css('background', '#CCC')	
						$(sa1).css('color', '#0C0' );
						$(sa1).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
						
										
					}
				else {
					var value = 0;
				    	$(gr1).css('background', '#FFF')
						$(sa1).css('color', '#F00');
						$(sa1).show();
			   			setTimeout(function() { $(sa1).hide(); }, 4000);
				}
			
		}
		$("#myElem2").show().delay(3000).fadeOut();
		
		
 </script> 

<script type="text/javascript"> 
	  		
		function save_pr(prd_id)
		{
		
		var id = '#pr' + prd_id;
		var value = $(id).val();
		
		url =  "http://www.deckquotes.com.au/business.person_responsible_save/prd_id/"+prd_id+"/value/"+value;
		
		//$(id).remove();
		  $.ajax({
			   type: "GET",
			  url: "http://www.deckquotes.com.au/business.person_responsible_save/prd_id/"+prd_id+"/value/"+value,
			  //url: "http://localhost/gcon_backup_July_2014/business.person_responsible_save/prd_id/"+prd_id+"/value/"+value,
			  // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
				//alert("Updated successfully");
			   }
			 });
		}
</script>	

<script type="text/javascript"> 

function cover(a,b,c)
{
	
	var id = '#dtcl'+b;
	var cl_id = '#cl'+b;
	
	if(c==1) {
		$(id).show();
		$(cl_id).css('background','#F90' );	
	} 
	else 
	{ 
	  $(id).hide(); 
	  $(cl_id).css('background','#F00' );
	 }
}

function emailed(a,b,c)
{
	
	var id = '#emcl'+b;
	var ec_id = '#ec'+b;
	
	if(c==1) {
		$(id).show();
		$(ec_id).css('background','#F90' );	
	} 
	else 
	{ 
	  $(id).hide(); 
	  $(ec_id).css('background','#F00' );
	 }
}

function posted(a,b,c)
{
	
	var id = '#pocl'+b;
	var pc_id = '#pc'+b;
	
	if(c==1) {
		$(id).show();
		$(pc_id).css('background','#F90' );	
	} 
	else 
	{ 
	  $(id).hide(); 
	  $(pc_id).css('background','#F00' );
	 }
}

function cwww(a,b,c)
{
	
	//var id = '#pocl'+b;
	var cw_id = '#cw'+b;
	
	if(c==1) {
		//$(id).show();
		$(cw_id).css('background','#F90' );	
	} 
	else 
	{ 
	  //$(id).hide(); 
	  $(cw_id).css('background','#F00' );
	 }
}

function qed(a,b,c)
{
	var qe_id = '#qe'+b;
	
	if(c==1) {
		$(qe_id).css('background','#F90' );	
	} 
	else 
	{ 
	  $(qe_id).css('background','#F00' );
	 }
}


</script>

<script>
function update_pp(id,value)
{
	if(value==true) { var val = 1 } else { var val = 0 ; }
	var apr = '#app'+id;
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_pp/pc_id/"+id+"/value/"+val,
					   success: function(result){
						  $(apr).html(result);  
					}
				});
					
		
}

function update_ready(id,value)
{
			if(value==true) { var val = 1 } else { var val = 0 ; }	
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_ready/pc_id/"+id+"/value/"+val,
					   success: function(result){
						   
					}
				});
}

function update_qa1(id,value)
{
			if(value==true) { var val = 1 } else { var val = 0 ; }
			var qa1 = '#qa1'+id;	
			
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_qa1/pc_id/"+id+"/value/"+val,
					   success: function(result){
						    $(qa1).html(result); 
						   
					}
				});
}

function update_qa2(id,value)
{
			if(value==true) { var val = 1 } else { var val = 0 ; }
			var qa2 = '#qa2'+id;	
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_qa2/pc_id/"+id+"/value/"+val,
					   success: function(result){
						    $(qa2).html(result); 
						   
					}
				});
}

function update_required(id,value)
{
			if(value==true) { var val = 1 } else { var val = 0 ; }
			var req = '#req'+id;	
			var req_color = '#req_color'+id;	
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_required/pc_id/"+id+"/value/"+val,
					   success: function(result){
						    $(req).html(result); 
							
							if(value == 0 ) {
							$(req_color).css("background","#F00");
						} else {
							$(req_color).css("background","#FFF"); 
						}
						   
					}
				});
}

function update_missing_plans_report(id, value) {
	if (value == true) { var val = 1 } else { var val = 0; }
	var req = '#update_missing_plans_report'+id;	
	var req_color = '#req_color'+id;
	$.ajax({
		type: "GET",
		url: "{{$BASE_URL}}business.update_missing_plans_report/pc_id/" + id + "/value/" + val,
		success: function (result) {
			$(req).html(result);
		}
	});
}



function update_dep_uploaded(id,value)
{
			if(value==true) { var val = 1 } else { var val = 0 ; }
			var dep = '#dep'+id;	
		
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_dep_uploaded/pc_id/"+id+"/value/"+val,
					   success: function(result){
						    $(dep).html(result); 
						   
					}
				});
}

function update_d_type(id,value)
{
					
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}business.update_d_type/bsn_id/"+id+"/value/"+value,
					   success: function(result){
							
							}
				});
}

</script>


{{if !empty($rele)}}
<script>
requestPurchseOrder();
</script>
{{/if}}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

{{/if}}