{{if $blank_page}}

{{else}}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/menu_manoj.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
{{if $json_script_data}}
     <script type="application/ld+json">
	     {{ $json_script_data }}
     </script>
{{/if}}
<!-- Beginning of compulsory code below -->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}/js/chrometheme/chromestyle2.css" />
<script type="text/javascript" src="{{$BASE_URL}}/js/chromejs/chrome.js"></script>
<link href="{{$BASE_URL}}css/default/css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="{{$BASE_URL}}css/default/css/dropdown/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
<link href="{{$BASE_URL}}css/default/loader.css" media="screen" rel="stylesheet" type="text/css" />
<link rel="canonical" href="{{$BASE_URL}}" />
<link rel="shortcut icon" href="{{$BASE_URL}}images/favicon.ico" >
<!--[if lt IE 7]>
<script type="text/javascript" src="{{$BASE_URL}}css/default/js/jquery/jquery.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/js/jquery/jquery.dropdown.js"></script>
<![endif]-->
<!-- / END -->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/animatedcollapse.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<style>
     #clearSearchBtn {
          background: url('css/default/images/button1_bg.gif') top repeat-x;
          color: #fff;
          border-top: 1px solid #5C5C5C;
          border-left: 1px solid #5C5C5C;
          border-bottom: 1px solid rgba(0, 0, 0, 0.1);
          border-right: 1px solid rgba(0, 0, 0, 0.1);
          border-radius: 4px;
          padding: 4px 6px;
          text-transform: uppercase;
          cursor: pointer;
     }
     #searchModulesResult {
          width: 300px;
          height: 250px;
          overflow: auto;
          background: white;
          border: 1px solid silver;
          position: absolute; z-index: 9999999999999999;
          display: none;
     }
     #searchModulesResult ul {
          padding: 0;
          margin: 0;
     }
     #searchModulesResult ul li {
          padding: 6px 10px;
     }
     #searchModulesResult ul li a {
          color: #0093ff;
          font-weight: bold;
          text-decoration: none;
          font-size: 13px;
     }
</style>
<script>
     function clearResult() {
          const searchInput = document.getElementById('searchInput');
          searchInput.value = '';
          searchModules('');
     }

     function searchModules(keyword) {
          keyword = keyword.toLowerCase();
          const searchModulesResult = document.getElementById('searchModulesResult');
          if(keyword.length > 0) {
               searchModulesResult.style.display = "block";
               searchModulesResult.innerHTML = '';

               const mainMenu = document.getElementById('menuTable');
               const allLinks = mainMenu.querySelectorAll('a:not([href="javascript:void();"])');
               // console.log(allLinks);
               const listItemArray = [];
               allLinks.forEach(item => {
                    const itemText = item.textContent;
                    const itemHref = item.href;
                    if (itemText.toLowerCase().includes(keyword) && itemHref != '#') {
                         // console.log(item);
                         const listItem  = document.createElement('li');
                         const anchorElement = document.createElement('a');
                         anchorElement.href = itemHref;
                         anchorElement.textContent = itemText;
                         anchorElement.target = '_blank';
                         listItem.appendChild(anchorElement);
                         listItemArray.push(listItem);

                    }
               });
               if(listItemArray.length == 0) {
                    const listItem  = document.createElement('li');
                    const anchorElement = document.createElement('a');
                    anchorElement.href = 'javascript:void(0)';
                    anchorElement.textContent = 'No Result Found';
                    anchorElement.style.color = 'red';
                    listItem.appendChild(anchorElement);
                    listItemArray.push(listItem);
               }
               else {
                    listItemArray.sort((a, b) => {
                         const textA = a.textContent.toLowerCase();
                         const textB = b.textContent.toLowerCase();
                         return textA.localeCompare(textB);
                    })
               }
               const ul = document.createElement('ul');
               listItemArray.forEach(li => {
                    ul.appendChild(li);
               });
               searchModulesResult.appendChild(ul);
          }
          else {
               searchModulesResult.style.display = "none";
          }

          // console.log('searching... ' + keyword);
          // const xhttp = new XMLHttpRequest();
          // xhttp.onreadystatechange = function() {
          //      if (this.readyState == 4 && this.status == 200) {
          //           // console.log(this.responseText, keyword, keyword.length);
          //           if(keyword.length > 0) {
          //                searchModulesResult.style.display = "block";
          //                searchModulesResult.innerHTML = this.responseText;
          //           }
          //           else {
          //                searchModulesResult.style.display = "none";
          //           }
          //      }
          // };
          // xhttp.open("GET", '/pageAdmin.modules_search/keyword/' + keyword, true); // true for asynchronous
          // xhttp.send();
     }
</script>
<script type="text/javascript">
     
animatedcollapse.addDiv('clipboard', 'fade=1')
animatedcollapse.init()
var url = "{{$BASE_URL}}site.clipboard?cb="; // The server-side script
      function handleHttpClipboardResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{//document.getElementById('divCustomerInfo').style.visibility = 'visible';
				document.getElementById('clipboard_data').innerHTML = results;
				closeTop();
				}
            }
          }
        }
        function requestClipboardData() {     
            var clipboard_data = document.getElementById("clipboard_data").value;
			var clipurl =  url + clipboard_data+"&random=" + Math.random();
            http.open("GET",clipurl, true);
            http.onreadystatechange = handleHttpClipboardResponse;
            http.send(null);
			showTop();
        }
<!--Ajax Common function END-->
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
var http = getHTTPObject(); // We create the HTTP Object
</script>
{{if $clipboardData}}
<script type="text/javascript">
	setTimeout("clipbord()", 500);
</script>
{{/if}}
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	bottom:0%;
	width: 100%;
	height: 320%;
	background-color: white;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}
.white_content {
	display: none;
	position: absolute;
	top: 50%;
	left: 45%;
	padding: 0px;
	border: 0px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
nav ul ul li {background:#609 !important; }
nav { background:#154f6c !important ;}
nav ul li { background:#154f6c !important ;}
}
</style>
</head><body scroll="no">
<div id="screenoverlay" style="visibility:hidden;"></div>
<!--StartHTML-->
<div id="wrapper">
<!-- Main Table Starts -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="mainTableBg">
<tr>
<td align="left" valign="top">
  <table  border="0" cellspacing="0" cellpadding="0" align="center" class="subtabel" width="99%">
      <!-- Top Blue Bar Starts -->
    <tr>
      <td width="10" class="blueBarBg"><img src="{{$BASE_URL}}images/blu-strip-top-left.jpg" alt="" height="34"  /></td>
      <td width="100%" align="left" valign="middle" class="blueBarBg">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
               <td align="left">
                    <p>
                         Welcome 
                         <span>
                              {{if isset($_SESSION.user) && $_SESSION.user.user_id > 0}}
                                   {{$_SESSION.user.user_name}} | <a href="{{$BASE_URL}}logout.htm">Log Out</a>
                              {{else}}
                                   Guest! | <a href="{{$BASE_URL}}login.htm">Login</a>
                              {{/if}}
                              | <a href="{{$BASE_URL}}home.htm">Home</a>
                         </span>
                    </p>
               </td>
               {{if isset($_SESSION.user) && $_SESSION.user.user_id > 0}}
               <td align="left">
                    <div>
                         <input id="searchInput" type="text" value="" style="width: 200px;" placeholder="Enter keyword or section name" onkeyup="searchModules(this.value)">
                         <button id="clearSearchBtn" type="button" onclick="clearResult()">Clear</button>
                         <div id="searchModulesResult"></div>
                    </div>
               </td>
               {{/if}}
               <td align="right">
                    <p>
                         <span>
                              {{if $admin_menu}}
                                   <a href="{{$BASE_URL}}admin.home">Admin Panel</a>
                              {{/if}}
                         </span>
                    </p>
               </td>
          </tr>
         </table>
	 </td>
    <td width="2" align="right" class="blueBarBg"><img src="{{$BASE_URL}}images/blu-strip-top-right.jpg" width="12" height="34" />
    </td>
    </tr>
    <!-- Top Blue Bar Ends -->
    <!-- Search Starts -->
    <tr>
    <td align="left" valign="top" colspan="3">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="80">
     <!-- Search Ends -->
     <!-- Breadcrumbs Starts -->
     <tr id="menuTable">
     <td align="left" valign="top" colspan="3" ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
        <!-- <td width="3"><img src="{{$BASE_URL}}images/breadcrumbs-left-corner.jpg" alt="" /></td>-->
         <td width="100%" align="left" valign="middle">
   {{if isset($_SESSION.user) && $_SESSION.user.user_id > 0}}
              <table cellpadding="0" cellspacing="0" border="0" width="1550">
                <tr>
                  <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:2222222" >
      <li style="z-index:222222">
      <!-- First Tier Drop Down -->
      <label for="drop-1" class="toggle">Customers</label>
      <a href="javascript:void();">Customers</a>
       <!-- <span style="color:#FFF; padding-top:3px;"> Customers |</span>-->
      <input type="checkbox" id="drop-1" />
      <ul style="z-index:2222;">
           <li><a href="{{$BASE_URL}}customer.list">Customer Search</a></li>
           <li><a href="{{$BASE_URL}}customer.detail">New Customer</a></li> 
           <li><a href="{{$BASE_URL}}business.list">Project Search</a></li> 
           <li><a href="{{$BASE_URL}}business.detail">New Project</a> </li>
           <li><a href="{{$BASE_URL}}businessqa.list">Project Q & A Search</a> </li>
           <li><a href="{{$BASE_URL}}salutation_report.home">Saluation Report</a> </li>
           <li><a href="{{$BASE_URL}}customer_survey.home">Customer Surveys</a> </li>
           <li><a href="{{$BASE_URL}}customer_nps_report.home">Customer NPS Report</a> </li>
           <li><a href="{{$BASE_URL}}proactive_call_report.home">Proactive Call Report</a></li>
      </ul>
    </li>
    <li>
      <!-- First Tier Drop Down -->
      <label for="drop-2" class="toggle">Business Management</label>
      <a href="javascript:void();">Business Management</a>
      <input type="checkbox" id="drop-2" />
      <ul>
       <li> <a href="{{$BASE_URL}}dochub.home">Procedure Master List</a> </li>
        <li><a href="{{$BASE_URL}}templatedoc.home">Template Master List</a></li>
        <li><a href="{{$BASE_URL}}ai_repository.home">AI Repository</a></li>
        <li><a href="{{$BASE_URL}}chatgpt_interface.home" target="_blank">ChatGPT Interface</a></li>
        <li><a href="{{$BASE_URL}}ohsprocedures.home">OHS Procedures</a> </li>
        <li><a href="{{$BASE_URL}}ohstemplates.home">OHS Templates</a></li> 
        <li><a href="{{$BASE_URL}}people_management.list">People Management</a> </li>
        <li><a href="{{$BASE_URL}}todolist.home">Business TO DO list</a></li>
       <!-- <li><a href="{{$BASE_URL}}docs.home">Business Docs Management</a> </li> -->
        <li><a href="{{$BASE_URL}}guide.home">GCON Guides</a> </li>
        <li><a href="{{$BASE_URL}}reports.home">Production Report</a> </li>
      <!--  <li><a href="{{$BASE_URL}}preports.home">Business Tasks Report</a></li> -->
        <li><a href="{{$BASE_URL}}bustrategydocs.home">Business Strategy Documents</a></li>
        <li><a href="{{$BASE_URL}}policy.home">Supply Agreements</a></li>
        <li><a href="{{$BASE_URL}}laws.home">Legislation, regulations and laws</a></li>
        <li><a href="{{$BASE_URL}}gallery.home">Business Gallery</a></li>
        <li><a href="{{$BASE_URL}}business.subtask_synchronizeall/start/1">Subtask Synchronize</a></li>
      </ul>
    </li>
      <li>
          <label for="drop-12" class="toggle">Air B&B Database</label>
          <a href="javascript:void();">Air B&B Database</a>
          <input type="checkbox" id="drop-12" />
          <ul>
               <li><a href="{{$BASE_URL}}air_bb_database.home">Air B&B Database</a></li>
               <li><a href="{{$BASE_URL}}new_airbnb_report.home">New Airbnb Report</a></li>
          </ul>
      </li>
         <li>
          <label for="drop-4" class="toggle">Airbnb Prospect List</label>
          <a href="javascript:void();">Airbnb Prospect List</a>
          <input type="checkbox" id="drop-4" />
          <ul>
               <li><a href="{{$BASE_URL}}prospect_list.home">Airbnb Prospect List</a></li>
			   <li><a href="{{$BASE_URL}}short_stays_payables_tracker.home">Short Stays Payables Tracker</a></li>
          </ul>
        </li>
    	 <li>
          <label for="drop-81" class="toggle">Asset List</label>
          <a href="javascript:void();">Asset List</a>
          <input type="checkbox" id="drop-81" />
          <ul>
               <li><a href="{{$BASE_URL}}asset_list.home">Asset List</a></li>
               <li><a href="{{$BASE_URL}}mobile_list.home">Mobile List</a></li>
               <li><a href="{{$BASE_URL}}email_list.home">Email List</a></li>
               <li><a href="{{$BASE_URL}}software_list.home">Software List</a></li>
          </ul>
        </li>
      <li>
          <label for="drop-54" class="toggle">Action Plan</label>
          <a href="javascript:void();">Action Plan</a>
          <input type="checkbox" id="drop-54" />
          <ul>
               <li><a href="{{$BASE_URL}}action_plan.home">Action Plan</a></li>
          </ul>
      </li>
     <li>
       <label for="drop-3" class="toggle">Availability List</label>
      <a href="javascript:void();">Availability List</a>
      <input type="checkbox" id="drop-3" />
      <ul>
           <li><a href="{{$BASE_URL}}availability_list.home">Availability List</a></li>
      </ul>
     </li>
      <li>
          <label for="drop-58" class="toggle">Brochure Links</label>
          <a href="javascript:void();">Brochure Links</a>
          <input type="checkbox" id="drop-58" />
          <ul>
               <li><a href="{{$BASE_URL}}brochure_links.home">Brochure Links</a></li>
          </ul>
      </li>
        <li>
          <label for="drop-82" class="toggle">Brief Builder</label>
          <a href="javascript:void();">Brief Builder</a>
          <input type="checkbox" id="drop-82" />
          <ul>
               <li><a href="{{$BASE_URL}}brief_builder.home">Brief Builder</a></li>
          </ul>
        </li>
      <li>
      <!-- Second Tier Drop Down -->
      <label for="drop-1" class="toggle">Customer QA</label>
      <a href="javascript:void();">Customer QA</a>
      <input type="checkbox" id="drop-1" />
      <ul>
           <li><a href="{{$BASE_URL}}customer_qa.home">Customer QA</a></li>
      </ul>
    </li>
     <li>
          <label for="drop-11" class="toggle">Contact List</label>
          <a href="javascript:void();">Contact List</a>
          <input type="checkbox" id="drop-11" />
          <ul style="background:#9F0 !important;">
         <!--      <li><a href="{{$BASE_URL}}contact_list.home">Contact List</a></li>-->
               <li><a href="{{$BASE_URL}}companies.home">Companies</a></li>
               <li><a href="{{$BASE_URL}}contacts.home">Contacts</a></li>
               <li><a href="{{$BASE_URL}}contact_update_log.home">Contact Update Log</a></li>
          </ul>
      </li>
       <li>
          <label for="drop-80" class="toggle">Critical Numbers</label>
          <a href="javascript:void();">Critical Numbers</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}critical_numbers.home">Critical Numbers</a></li>
          </ul>
        </li>
      <li>
          <label for="drop-103" class="toggle">Calculator and Proposal</label>
          <a href="javascript:void();">Calculator and Proposal</a>
          <input type="checkbox" id="drop-103" />
          <ul>
               <li><a href="{{$BASE_URL}}calculator_qa.home">Calculator QandA</a></li>
               <li><a href="{{$BASE_URL}}calculator_fact_sheet.home">Calculator Fact Sheet</a></li>
          </ul>
      </li>
<li>
          <label for="drop-81" class="toggle">Camera Report</label>
          <a href="javascript:void();">Camera Report</a>
          <input type="checkbox" id="drop-81" />
          <ul>
               <li><a href="{{$BASE_URL}}camera_report.home">Camera Report</a></li>
          </ul>
        </li>
  </ul>
</nav>
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  </td>
                </tr>
              </table>
 <table cellpadding="0" cellspacing="0" border="0" width="1550">
 <tr>
 <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:222222" >
 	 <li>
          <label for="drop-82" class="toggle">Camera Log</label>
          <a href="javascript:void();">Camera Log</a>
          <input type="checkbox" id="drop-82" />
          <ul>
               <li><a href="{{$BASE_URL}}site.camera">Camera Update Form</a></li>
               <li><a href="{{$BASE_URL}}site.camera_log">Camera Log</a></li>	
          </ul>
        </li>
      <li>
          <label for="drop-50" class="toggle">Construction Reports</label>
          <a href="javascript:void();">Construction Reports</a>
          <input type="checkbox" id="drop-50" />
          <ul>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_task_tracker.home">Construction Task Tracker</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_report.home">Construction Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_pipeline_report.home">Construction Pipeline Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}quality_assurance_report.home">Quality Assurance Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}quality_inspection_report.home">Quality Insurance Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}progress_payment_report.home">Project Payment Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}certifier_completion_report.home">Certifier Completion Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_procedures.home">Construction Procedures</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}certifier_structural_engineer.home">Certifier and Structural Engineer Inspection Management</a></li>
          </ul>
      </li>
      <li>
          <label for="drop-57" class="toggle">Construction in Progress Report</label>
          <a href="javascript:void();">Construction in Progress Report</a>
          <input type="checkbox" id="drop-57" />
          <ul>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_in_progress_report.home">Construction in Progress Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}project_progress_report.home">Project Progress Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}site_progress_report.home">Site Progress Report</a></li>
               <li style="width:250px;"><a href="#">Construction Timetable Report - TBD</a></li>
               <li style="width:250px;"><a href="#">Site Specific Safety And Compliance Report- TBD</a></li>
          </ul>
      </li>
      <li>
          <label for="drop-104" class="toggle">Construction Alert Report</label>
          <a href="javascript:void();">Construction Alert Report</a>
          <input type="checkbox" id="drop-104" />
          <ul>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_alert_report.home">Construction Alert Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_alert_pending_report.home">Construction Alert Pending Report</a></li>
                <li style="width:250px;"><a href="{{$BASE_URL}}car_email_log.supplier">Construction Alert Email Log - Supplier</a></li>
                <li style="width:250px;"><a href="{{$BASE_URL}}car_email_log.customer">Construction Alert Email Log - Customer</a></li>
                <li style="width:250px;"><a href="{{$BASE_URL}}car_email_log.responsible_staff">Construction Alert Email Log - Res Staff</a></li>
                <li style="width:250px;"><a href="#">CAR Letter</a></li>
                <li style="width:250px;"><a href="{{$BASE_URL}}alert_escalation_report.home">Alert Escalation Report </a></li>
       </ul>
      </li>
        <li>
      <label for="drop-11" class="toggle">CGFB Street Signs</label>
      <a href="javascript:void();">CGFB Street Signs</a>
      <input type="checkbox" id="drop-11" />
      <ul>
        <li style="width:300px;"><a href="{{$BASE_URL}}street_sign.home">CGFB Street Signs</a></li>
        <li style="width:300px;"><a href="{{$BASE_URL}}street_sign_design.home">CGFB Street Signs Report Designs</a></li>
        <li style="width:300px;"><a href="{{$BASE_URL}}street_sign_planning_inclusion.home">CGFB Street Signs Report Planning and Inclusions</a></li>
        <li style="width:300px;"><a href="{{$BASE_URL}}street_sign_construction.home">CGFB Street Signs Report - Construction</a></li>
      </ul>
    </li> 
      <li>
          <label for="drop-51" class="toggle">Complete Reports</label>
          <a href="javascript:void();">Complete Reports</a>
          <input type="checkbox" id="drop-51" />
          <ul>
               <li><a href="{{$BASE_URL}}complete_report.home">Complete Report</a></li>
               <li><a href="{{$BASE_URL}}videos_and_reviews_report.home">Videos and Reviews Report</a></li>
               <li><a href="{{$BASE_URL}}budgeting_report.home">Budgeting Report</a></li>
               <li><a href="{{$BASE_URL}}warranty_and_complete_report.home">Warranty And Complete Report</a></li>
               <li><a href="{{$BASE_URL}}complete_task_tracker.home">Complete Task Tracker</a></li>
               <li><a href="{{$BASE_URL}}customer_complete_followup_report.home">Customer Complete Follow-up Report </a></li>
          </ul>
      </li>
     <li>
      <label for="drop-6" class="toggle">Drawing & Design Details</label>
      <a href="javascript:void();">Drawing & Design Details</a>
      <input type="checkbox" id="drop-6" />
      <ul>
        <li><a href="{{$BASE_URL}}drawing.home">Drawing and Design Details</a></li>
        <li><a href="{{$BASE_URL}}qa.home">Q and A</a></li> 
      </ul>
    </li> 
     <li>
      <label for="drop-8" class="toggle">Design Interface</label>
      <a href="javascript:void();">Design Interface</a>
      <input type="checkbox" id="drop-8" />
      <ul>
        <li><a href="{{$BASE_URL}}design_interface.home">Design Interface</a></li>
        <!--<li><a href="{{$BASE_URL}}design_brochures.home">Design Brochures</a></li>-->
        <li><a href="{{$BASE_URL}}courierbox_design_brochures.home">CourierBox Design Brochures</a></li>
        <li><a href="{{$BASE_URL}}icon_list.home">Icon List</a></li>
        <li><a href="{{$BASE_URL}}design_pricing_update_report.home">Design Inteface Pricing Report</a></li>
        <li><a href="{{$BASE_URL}}repricing_database.home">Repricing Database</a></li>
      </ul>
    </li> 
     <li>
      <label for="drop-8" class="toggle">Design Interface 2</label>
      <a href="javascript:void();">Design Interface 2</a>
      <input type="checkbox" id="drop-8" />
      <ul>
        <li><a href="{{$BASE_URL}}design_interface_2.home">Design Interface 2</a></li>
      </ul>
    </li> 
  <li>
      <label for="drop-9" class="toggle">Design Examples</label>
      <a href="javascript:void();">Design Examples</a>
      <input type="checkbox" id="drop-9" />
      <ul>
        <li><a href="{{$BASE_URL}}design_example.home">Design Examples</a></li>
      </ul>
    </li>  
     <li>
          <label for="drop-42" class="toggle">Design Q/A</label>
          <a href="javascript:void();">Design Q/A</a>
          <input type="checkbox" id="drop-42" />
          <ul>
               <li><a href="{{$BASE_URL}}design_qa.home">Design Q/A</a></li>
          </ul>
      </li>    
       </ul>
</nav>
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  </td>
                </tr>
              </table>
 <table cellpadding="0" cellspacing="0" border="0" width="1550">
 <tr>
 <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:22222" >
       <li>
          <label for="drop-43" class="toggle">Design Fact Sheet</label>
          <a href="javascript:void();">Design Fact Sheet</a>
          <input type="checkbox" id="drop-43" />
          <ul>
               <li><a href="{{$BASE_URL}}design_fact_sheet.home">Design Fact Sheet</a></li>
          </ul>
      </li>    
     <li>
          <label for="drop-8" class="toggle">DA Tracker</label>
          <a href="javascript:void();">DA Tracker</a>
          <input type="checkbox" id="drop-8" />
          <ul>
               <li><a href="{{$BASE_URL}}da_tracker.home">DA Tracker</a></li>
          </ul>
      </li>
        <li>
          <label for="drop-82" class="toggle">Designs Development</label>
          <a href="javascript:void();">Designs Development</a>
          <input type="checkbox" id="drop-82" />
          <ul>
               <li><a href="{{$BASE_URL}}design_development.home">Designs Development</a></li>
          </ul>
        </li>
          <li>
          <label for="drop-46" class="toggle">Design Reports</label>
          <a href="javascript:void();">Design Reports</a>
          <input type="checkbox" id="drop-46" />
          <ul >
               <li style="width:240px;"><a href="{{$BASE_URL}}design_report.home_active">Design Report - ACTIVE</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_report.home_inactive">Design Report - INACTIVE</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}post_hia_design_report.home">Post HIA Design Report</a></li> 
               <li style="width:240px;"><a href="{{$BASE_URL}}variation_design_agreement.home">Variation Design Agreement Report</a></li> 
               <li style="width:240px;"><a href="{{$BASE_URL}}design_report.design_conversion">Design Conversion Report</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_report_renovation.home_active">Renovation Design Report - ACTIVE</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_report_renovation.home_inactive">Renovation Design Report - INACTIVE</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}initial_design_task_report.home">Initial Design Task Report</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_take_off_report.home">Design Take Off Report</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}designs_information_repository.home">Designs Information Repository</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_qa_report.home">Design QA Report</a></li> 
               <li style="width:240px;"><a href="{{$BASE_URL}}site_inspections_report.home">Site Inspections Report</a></li> 
         	     <li style="width:240px;"><a href="{{$BASE_URL}}new_product_report.home">New Product Report</a></li> 
               <li style="width:240px;"><a href="{{$BASE_URL}}archive_checklist_report.home">Archive Checklist Report</a></li>
               <li style="width:240px;"><a href="#">Site Infrastructure Report - TBD</a></li> 
               <li style="width:240px;"><a href="#">Designs Workflow - TBD</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}design_plans_mistake_log.home">Design Plans - Mistake Log</a></li>
			   <li style="width:240px;"><a href="{{$BASE_URL}}design_estimates_report.home">Design Estimates Report</a></li>
          </ul>
      </li>
        <li>
          <label for="drop-52" class="toggle">Design Task Tracker</label>
          <a href="javascript:void();">Design Task Tracker</a>
          <input type="checkbox" id="drop-52" />
          <ul>
               <li><a href="{{$BASE_URL}}designer_tracker.home">Project View</a></li>
              <!-- <li><a href="{{$BASE_URL}}designer_tracker.all">All Tasks</a></li>-->
               <li><a href="{{$BASE_URL}}designer_tracker.mytask">My Tasks</a></li>
               <li><a href="{{$BASE_URL}}designer_tracker.my_projects">My Projects</a></li>
               <li><a href="{{$BASE_URL}}designer_tracker.tasklist_report">Task List Report</a></li>
          </ul>
      </li>
      
    <!--  <li>
          <label for="drop-101" class="toggle">Design Process Task Report</label>
          <a href="javascript:void();">Design Process Task Report</a>
           <input type="checkbox" id="drop-53" />
          <ul>
               <li><a href="{{$BASE_URL}}design_process_task_report.home" id="waiting">Design Process Task Report</a></li>
          </ul>
      </li>-->
      
      
          <li>
          <label for="drop-107" class="toggle">Delivery Tracking Report</label>
          <a href="javascript:void();">Delivery Tracking Report</a>
          <input type="checkbox" id="drop-107" />
          <ul>
               <li><a href="{{$BASE_URL}}delivery_tracking_report.home">Delivery Tracking Report</a></li>
          </ul>
          </li>
           <li>
          <label for="drop-84" class="toggle">Development Log</label>
          <a href="javascript:void();">Development Log</a>
          <input type="checkbox" id="drop-84" />
          <ul>
               <li><a href="{{$BASE_URL}}development_log.home">Development Log</a></li>
          </ul>
        </li>
     <li>
      <label for="drop-9" class="toggle">Email Library</label>
      <a href="javascript:void();">Email Library</a>
      <input type="checkbox" id="drop-9" />
      <ul>
       <!-- <li><a href="{{$BASE_URL}}email_library.home">Email Library</a></li>-->
        <li><a href="{{$BASE_URL}}emaillibrary.home">Email Library</a></li>
        <li><a href="{{$BASE_URL}}emaillibrary.email_log_ms">Email Log MS</a></li>
        <li><a href="{{$BASE_URL}}emaillibrary.email_log_op">Email Log OP</a></li>
        <li><a href="{{$BASE_URL}}emaillibrary.email_log_re">Email Log RE</a></li>
        <li><a href="{{$BASE_URL}}emaillibrary.email_draft">Draft Email</a></li>
		<li><a href="{{$BASE_URL}}emaillibrary.email_failure_log">Email Failure Log</a></li>
      </ul>
    </li> 
        <li>
          <label for="drop-3" class="toggle">EDC</label>
          <a href="javascript:void();">EDC</a>
          <input type="checkbox" id="drop-2" />
          <ul>
               <li><a href="{{$BASE_URL}}edc.home">EDC</a></li>
          </ul>
      </li>
    <!--  <li>
          <label for="drop-84" class="toggle">Entity Referal Report</label>
          <a href="javascript:void();">Entity Referal Report</a>
          <input type="checkbox" id="drop-84" />
          <ul>
               <li><a href="{{$BASE_URL}}entity_referal_report.home">Entity Referal Report</a></li>
            </ul>
        </li>-->
           <li>
          <label for="drop-80" class="toggle">Email List Builder</label>
          <a href="javascript:void();">Email List Builder</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}email_list_builder.home">Email List Builder</a></li>
           </ul>
          </li>
       <li>
      <label for="drop-2" class="toggle">FDCH</label>
      <a href="javascript:void();">FDCH</a>
      <input type="checkbox" id="drop-2" />
      <ul>
           <li><a href="{{$BASE_URL}}fdch.home">FDCH</a></li>
      </ul>
    </li>
       <li>
          <label for="drop-78" class="toggle">Fact Sheets</label>
          <a href="javascript:void();">Fact Sheets</a>
          <input type="checkbox" id="drop-78" />
          <ul>
               <li><a href="{{$BASE_URL}}facts_sheets.home">Fact Sheets</a></li>
          </ul>
        </li>   
        
        <li>
          <label for="drop-41" class="toggle">Gcon User Guide</label>
          <a href="javascript:void();">Gcon User Guide</a>
          <input type="checkbox" id="drop-41" />
          <ul>
               <li><a href="{{$BASE_URL}}gcon_guide.home">Gcon User Guide</a></li>
          </ul>
      </li>   
       </ul>
</nav>
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  </td>
                </tr>
              </table>
 <table cellpadding="0" cellspacing="0" border="0" width="1550">
 <tr>
 <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:2222" >

         <li>
          <label for="drop-49" class="toggle">Inclusions Reports</label>
          <a href="javascript:void();">Inclusions Reports</a>
          <input type="checkbox" id="drop-49" />
          <ul>
               <li><a href="{{$BASE_URL}}inclusions_report.home">Inclusions Report </a></li>
			   <li><a href="{{$BASE_URL}}inclusions_calculation_report.home">Inclusions Calculation Report </a></li>
               <li><a href="{{$BASE_URL}}inclusions_task_tracker.home">Inclusion Task Tracker</a></li>
          </ul>
      </li>
     <li>
          <label for="drop-55" class="toggle">Job Agreement Builder</label>
          <a href="javascript:void();">Job Agreement Builder</a>
          <input type="checkbox" id="drop-55" />
          <ul>
               <li><a href="{{$BASE_URL}}job_agreement_builder.home">Job Agreement Builder</a></li>
          </ul>
      </li>
       <li>
          <label for="drop-56" class="toggle">Letter Text</label>
          <a href="javascript:void();">Letter Text</a>
          <input type="checkbox" id="drop-56" />
          <ul>
               <li><a href="#">Letter Text</a></li>
          </ul>
      </li>
          <li>
          <label for="drop-101" class="toggle">Letter Database</label>
          <a href="javascript:void();">Letter Database</a>
           <input type="checkbox" id="drop-101" />
          <ul>
               <li><a href="{{$BASE_URL}}letter_database.home" id="waiting">Letter Database</a></li>
          </ul>
      </li>
     <li>
      <label for="drop-4" class="toggle">Lead Generations</label>
      <a href="javascript:void();">Lead Generations</a>
      <input type="checkbox" id="drop-4" />
      <ul>
      	      <li><a href="{{$BASE_URL}}referral_log.home">Referral Log</a></li>	
              {{foreach from=$soe key="key" item="item"}}
                 <li>  <a href="{{$BASE_URL}}lead.home/id/{{$item.soe_id}}">{{$item.soe_name}}</a></li>
              {{/foreach}}
      </ul>
 </li>
  <li>
          <label for="drop-80" class="toggle">Letter Delivery</label>
          <a href="javascript:void();">Letter Delivery</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}new_refferal_report.home">Letter Delivery</a></li>
          </ul>
        </li>
       <li>
      <!-- First Tier Drop Down -->
      <label for="drop-1" class="toggle">Meeting Minutes</label>
      <a href="javascript:void();">Meeting Minutes</a>
       <!-- <span style="color:#FFF; padding-top:3px;"> Customers |</span>-->
      <input type="checkbox" id="drop-1" />
      <ul>
           <li><a href="{{$BASE_URL}}meeting_minutes.home">Meeting Minutes</a></li>
           <li><a href="{{$BASE_URL}}meeting_recording_internal.home">Meeting Recording - Internal</a></li>
      </ul>
    </li>
   <li>
          <label for="drop-1" class="toggle">Merge Report</label>
          <a href="javascript:void();">Merge Report</a>
          <input type="checkbox" id="drop-1" />
          <ul>
               <li><a href="{{$BASE_URL}}mergereport.home">Merge Report</a></li>
          </ul>
      </li>
        <li>
      <label for="drop-3" class="toggle">Material Management</label>
      <a href="javascript:void();">Material Management</a>
      <input type="checkbox" id="drop-3" />
      <ul>
             <li><a href="{{$BASE_URL}}suppliers.home">Suppliers</a></li>
             <li><a href="{{$BASE_URL}}brands.home">Brands</a></li> 
             <li><a href="{{$BASE_URL}}materials.home">Materials</a> </li>
             <li><a href="{{$BASE_URL}}material_management.home">Material Management</a></li>
             <li><a href="{{$BASE_URL}}priceing.home">Job Pricing</a> </li>
      </ul>
    </li>
      <li>
          <label for="drop-6" class="toggle">Mistake Log</label>
          <a href="javascript:void();">Mistake Log</a>
          <input type="checkbox" id="drop-6" />
          <ul>
               <li><a href="{{$BASE_URL}}mistake_log.home">Mistake Log</a></li>
               <!-- <li><a href="{{$BASE_URL}}design_plans_mistake_log.home">Design Plans - Mistake Log</a></li> -->

          </ul>
        </li> 
       <li>
          <label for="drop-6" class="toggle">Position Matrix</label>
          <a href="javascript:void();">Position Matrix</a>
          <input type="checkbox" id="drop-6" />
          <ul>
               <li><a href="{{$BASE_URL}}position_matrix.home">Position Matrix</a></li>
          </ul>
      </li>
            <li>
          <label for="drop-2" class="toggle">POINCC</label>
          <a href="javascript:void();">POINCC</a>
          <input type="checkbox" id="drop-2" />
          <ul>
               <li><a href="{{$BASE_URL}}poincc.home">POINCC</a></li>
               <li><a href="{{$BASE_URL}}poincc2.home">POINCC - 2</a></li>
               <li><a href="{{$BASE_URL}}poincc3.home">POINCC - 3</a></li>
               <li><a href="{{$BASE_URL}}rejected_invoice_report.home">Rejected Invoice Report</a></li>
               <li><a href="{{$BASE_URL}}30_days_rec_report.home">All Accounts Receivable Report</a></li>
               <li><a href="{{$BASE_URL}}weekly_payment_report.home">Weekly Payment Report</a></li>
               <li><a href="{{$BASE_URL}}work_in_progress_report.home">Work In Progress Report</a></li>
               <li><a href="{{$BASE_URL}}debt_management_report.home">Debt Management Report</a></li>
               <li><a href="{{$BASE_URL}}xray_report.home">Xray Report</a></li>
               <li><a href="{{$BASE_URL}}xray_report_old.home">Xray Report Old</a></li>
               <li><a href="{{$BASE_URL}}deposite_report.home">Deposit Report</a></li>
               <li><a href="{{$BASE_URL}}xray_overview_report.home">Xray Overview Report</a></li>
               <li><a href="{{$BASE_URL}}net_position_report.home">Net Position Report</a></li>
               <li><a href="{{$BASE_URL}}lateletter_report.home">Late Letter Table</a></li>
               <li><a href="{{$BASE_URL}}lateletter_email_log.home">Late Letter Email Log</a></li>
               <li><a href="{{$BASE_URL}}project_audit_report.home">Project Audit Report</a></li>
               <li><a href="{{$BASE_URL}}ar_invoice_qa_report.home">AR Invoice Q/A Report</a></li>
               <li><a href="{{$BASE_URL}}design_agreement_invoice_report.home">Design Agreement Invoice Report</a></li>
               <li><a href="{{$BASE_URL}}timesheet_database.home">Timesheet Database</a></li>
               <li><a href="{{$BASE_URL}}timesheet_database.archived">Archived Timesheet</a></li>
               <li><a href="{{$BASE_URL}}missing_variation_invoice_report.home">Missing Variation Invoice Report</a></li>
          </ul>
      </li>
     <li>
          <label for="drop-weekly-turnover" class="toggle">Weekly Turnover</label>
          <a href="javascript:void();">Weekly Turnover</a>
          <input type="checkbox" id="drop-weekly-turnover" />
          <ul>
               <li style="display:none;"><a href="{{$BASE_URL}}weekly_turnover_report.home">Weekly Turnover Report</a></li>
			   <li><a href="{{$BASE_URL}}12_week_turnover_forecast.home">12-Week Turnover Forecast</a></li>
			   <li><a href="{{$BASE_URL}}xray_overview_report_2.home">XRay Overview Report 2.0</a></li>
          </ul>
     </li>
  </ul>
</nav>
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  </td>
                </tr>
              </table>
 <table cellpadding="0" cellspacing="0" border="0" width="1550">
 <tr>
 <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:222" >
       <li>
          <label for="drop-48" class="toggle">Planning Reports</label>
          <a href="javascript:void();">Planning Reports</a>
          <input type="checkbox" id="drop-48" />
          <ul>
               <li><a href="{{$BASE_URL}}planning_progress_report.home">Planning Progress Report</a></li>
               <li><a href="{{$BASE_URL}}planning_task_tracker.home">Planning Task Tracker</a></li>
               <li><a href="{{$BASE_URL}}planning_only_task_tracker.home">Planning Only Task Tracker</a></li>
               <li><a href="{{$BASE_URL}}planning_meeting_minutes.home">Planning Meeting Minutes</a></li>
               <li><a href="{{$BASE_URL}}165_report.home">165 Report</a></li>
               <li><a href="{{$BASE_URL}}2025_165_report.home">165 Report 2025</a></li>
               <li><a href="{{$BASE_URL}}planning_dates_central_database.home">Planning Dates Central Database </a></li>
               <li><a href="{{$BASE_URL}}management_report.home">Planning Management Report</a></li>
               <li><a href="{{$BASE_URL}}planning_meeting_list.home">Planning Meeting List</a></li>
               <li><a href="{{$BASE_URL}}home_warranty_database.home">Home Warranty Database</a></li>
               <li><a href="{{$BASE_URL}}home_warranty_policy">Home Warranty Policy</a></li>
               <li><a href="{{$BASE_URL}}engineering_service_mark_report.home">Engineering Service Mark Report</a></li>
               <li><a href="{{$BASE_URL}}block_assessment_report.home">Block Assessment Report</a></li>
               <li><a href="{{$BASE_URL}}entity_referal_report.home">Entity Referal Report</a></li>
               <li><a href="{{$BASE_URL}}cou_component_document_report.home">COU Component Document Report</a></li>
          </ul>
      </li>
     <li>
          <label for="drop-53" class="toggle">Plans Review Report</label>
          <a href="javascript:void();">Plans Review Report</a>
          <input type="checkbox" id="drop-53" />
          <ul>
               <li><a href="{{$BASE_URL}}plans_review_report.home">Plans Review Report</a></li>
          </ul>
      </li>
          <li>
          <label for="drop-53" class="toggle">Purchase Orders</label>
          <a href="javascript:void();">Purchase Orders</a>
          <input type="checkbox" id="drop-53" />
          <ul>
               <li><a href="{{$BASE_URL}}purchase_order.home">Purchase Orders</a></li>
               <li><a href="{{$BASE_URL}}test_page.home">Test Page</a></li>
          </ul>
      </li>
       <li>
          <label for="drop-106" class="toggle">Phone Log</label>
          <a href="javascript:void();">Phone Log</a>
          <input type="checkbox" id="drop-106" />
          <ul>
               <li><a href="{{$BASE_URL}}phone_log.home">Phone Log</a></li>
			   <li><a href="{{$BASE_URL}}auction_advantage_phone_log.home">Auction Advantage Phone Log</a></li>
               <li><a href="{{$BASE_URL}}phone_call_audit.home">Phone Call Audit</a></li>
        </ul>
      </li>
       <li>
          <label for="drop-59" class="toggle">Project Plans Report</label>
          <a href="javascript:void();">Project Plans Report</a>
          <input type="checkbox" id="drop-59" />
          <ul>
               <li><a href="{{$BASE_URL}}project_plans_report.home">Project Plans Report</a></li>
                 <li><a href="{{$BASE_URL}}element_control_panel.home">Element Control Panel</a></li>
                 <li><a href="{{$BASE_URL}}run_new_report.home">Run New Report</a></li>
                 <li><a href="{{$BASE_URL}}project_plans_qa_checklist_report.home">Project Plans Quality Assurance Checklist</a></li>  
          </ul>
      </li>
        <li>
          <label for="drop-7" class="toggle">Partners Agreements</label>
          <a href="javascript:void();">Partners Agreements</a>
          <input type="checkbox" id="drop-7" />
          <ul>
               <li><a href="{{$BASE_URL}}partners_agreements.home">Partners Agreements</a></li>
          </ul>
        </li>
        <li>
          <label for="drop-83" class="toggle">Pre Construction Report</label>
          <a href="javascript:void();">Pre Construction Report</a>
          <input type="checkbox" id="drop-83" />
          <ul>
               <li><a href="{{$BASE_URL}}pre_construction_report.home">Pre Construction Report</a></li>
               <li><a href="{{$BASE_URL}}delivery_confirmation_report.home">Delivery Confirmation Report</a></li>
               <li><a href="{{$BASE_URL}}delivery_schedule_report.home">Delivery Schedule Report</a></li>
               <li><a href="{{$BASE_URL}}item_list_report.home">Item List Report</a></li>
          </ul>
        </li>
<!--       <li>
          <label for="drop-84" class="toggle">Presented But Not Signed Report</label>
          <a href="javascript:void();">Presented But Not Signed Report</a>
          <input type="checkbox" id="drop-84" />
          <ul>
               <li><a href="{{$BASE_URL}}presented_but_not_signed_report.home">Presented But Not Signed Report</a></li>
          </ul>
        </li> -->  
          <li>
          <label for="drop-112" class="toggle">Proposal Reports</label>
          <a href="javascript:void();">Proposal Reports</a>
          <input type="checkbox" id="drop-112" />
          <ul>
                 <li style="width:240px;"><a href="{{$BASE_URL}}proposal_checklist_report.home">Proposal Checklist Report</a></li>
				 <li style="width:240px;"><a href="{{$BASE_URL}}proposal_report.home">Proposal Control Panel Report</a></li> 
				 <li style="width:240px;"><a href="{{$BASE_URL}}proposal_task_tracker.home">Proposal Task Tracker</a></li> 
				 <li style="width:240px;"><a href="{{$BASE_URL}}proposal_document_checklist_report.home">Proposal Document Checklist Report</a></li> 
                 <li style="width:240px;"><a href="{{$BASE_URL}}presented_but_not_signed_report.home">Presented But Not Signed Report</a></li>
                 <li style="width:240px;"><a href="{{$BASE_URL}}special_condition.home">Special Condition Report</a>
          </ul>
        </li>
     <li>
      <label for="drop-7" class="toggle">Q And A</label>
      <a href="javascript:void();">Q And A</a>
      <input type="checkbox" id="drop-7" />
      <ul>
 		<li><a href="{{$BASE_URL}}queans.home">Question and Answer</a></li>
        <li><a href="{{$BASE_URL}}internal_queans.home">Internal Question Answer</a></li>      
      </ul>
    </li> 
 	 <li>
          <label for="drop-83" class="toggle">Quote Builder</label>
          <a href="javascript:void();">Quote Builder</a>
          <input type="checkbox" id="drop-83" />
          <ul>
               <li><a href="{{$BASE_URL}}quote_builder.home">Quote Builder</a></li>
            </ul>
        </li>
       <li>
      <label for="drop-10" class="toggle">Reports</label>
      <a href="javascript:void();">Reports</a>
      <input type="checkbox" id="drop-10" />
      <ul>
        <li><a href="{{$BASE_URL}}automated_reports.home">Automated Reports</a></li>
      </ul>
    </li> 
       <li>
      <label for="drop-4" class="toggle">Recruitment List</label>
      <a href="javascript:void();">Recruitment List</a>
      <input type="checkbox" id="drop-4" />
      <ul>
           <li><a href="{{$BASE_URL}}recruitment_list.home">Recruitment List</a></li>
      </ul>
    </li>
       <li>
          <label for="drop-7" class="toggle">Recorded Meetings</label>
          <a href="javascript:void();">Recorded Meetings</a>
          <input type="checkbox" id="drop-7" />
          <ul>
               <li><a href="{{$BASE_URL}}recorded_meeting.home">Recorded Meetings</a></li>
          </ul>
      </li>
  </ul>
</nav>
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  </td>
                </tr>
              </table>
 <table cellpadding="0" cellspacing="0" border="0" width="1550">
 <tr>
 <td valign="top" width="100%">
  <nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:200" >
  <li>
          <label for="drop-77" class="toggle">Reports Page</label>
          <a href="javascript:void();">Reports Page</a>
          <input type="checkbox" id="drop-77" />
          <ul>
               <li><a href="{{$BASE_URL}}report_page.home">Report Page</a></li>
          </ul>
        </li>
       <li>
          <label for="drop-60" class="toggle">Renovations</label>
          <a href="javascript:void();">Renovations</a>
          <input type="checkbox" id="drop-60" />
          <ul>
               <li><a href="{{$BASE_URL}}renovations.home">Renovations</a></li>
               <li><a href="">Renovation Manual</a></li>
               <li><a href="{{$BASE_URL}}strategic_alliance.home">Strategic Alliance</a></li>
               <li><a href="{{$BASE_URL}}renovation_report.home">Renovation Designs Report</a></li>
               <li><a href="{{$BASE_URL}}renovation_document_report.home">Renovation Document Report</a></li>
               <li><a href="{{$BASE_URL}}renovation_convert_task_report.home">Renovation Convert Task Report</a></li>
          </ul>
      </li>
<!--<li>
          <label for="drop-84" class="toggle">Redundant Reports</label>
          <a href="javascript:void();">Redundant Reports</a>
          <input type="checkbox" id="drop-84" />
          <ul>
               <li><a href="">Redundant Reports</a></li>
            </ul>
        </li>  -->
       <li>
          <label for="drop-105" class="toggle">Renovation Style Guide and Formula</label>
          <a href="javascript:void();">Renovation Style Guide and Formula</a>
          <input type="checkbox" id="drop-105" />
          <ul>
               <li><a href="{{$BASE_URL}}renovation_styleformula.home">Renovation Style Formula</a></li>
               <li><a href="{{$BASE_URL}}renovation_styletextreport.home">Renovation Style Text Report</a></li>
       </ul>
      </li>        
      <li>
          <label for="drop-104" class="toggle">Referral Log</label>
          <a href="javascript:void();">Referral Log</a>
          <input type="checkbox" id="drop-104" />
          <ul>
               <li><a href="{{$BASE_URL}}referral_log.home">Referral Log</a></li>
               <li><a href="{{$BASE_URL}}new_refferal_report.home">New Referral Report</a></li>
       </ul>
      </li>     
 <li>
      <label for="drop-5" class="toggle">Style Guide & Formula</label>
      <a href="javascript:void();">Style Guide & Formula</a>
      <input type="checkbox" id="drop-5" />
      <ul>
        <li><a href="{{$BASE_URL}}styleformula.home">Style Guide and Formula</a></li>
        <li><a href="{{$BASE_URL}}galleries.home">Image Galleries</a></li>
        <li><a href="{{$BASE_URL}}kitomestyleguide.home">Kitome Style Guide</a></li>
        <li><a href="{{$BASE_URL}}styletextreport.home">Style Text Report</a></li>
      </ul>
    </li>
      <li>
          <label for="drop-5" class="toggle">Street Checklist</label>
          <a href="javascript:void();">Street Checklist</a>
          <input type="checkbox" id="drop-5" />
          <ul>
               <li><a href="{{$BASE_URL}}street_checklist.home">Street Checklist</a></li>
          </ul>
      </li>
       <li>
          <label for="drop-9" class="toggle">Staff Bulletin</label>
          <a href="javascript:void();">Staff Bulletin</a>
          <input type="checkbox" id="drop-9" />
          <ul>
               <li><a href="{{$BASE_URL}}staff_bulletin.home">Staff Bulletin</a></li>
          </ul>
      </li>
 <li>
          <label for="drop-10" class="toggle">Style Guide & Formula FPL</label>
          <a href="javascript:void();">Style Guide & Formula FPL</a>
          <input type="checkbox" id="drop-10" />
          <ul>
               <li><a href="{{$BASE_URL}}styleformula_fpl.home">Style Guide & Formula FPL</a></li>
               <li><a href="{{$BASE_URL}}styleformula_fpl.listimage">Image Galleries</a></li>
               <li><a href="{{$BASE_URL}}styleformula_fpl.listunitvalue">Unit Values</a></li>
               <li><a href="{{$BASE_URL}}styleformula_fpl.styletextreport">Style Text Report</a></li> 
          </ul>
      </li>
         <li>
          <label for="drop-85" class="toggle">Support List</label>
          <a href="javascript:void();">Support List</a>
          <input type="checkbox" id="drop-85" />
          <ul>
               <li><a href="{{$BASE_URL}}support_list.home">Support List</a></li>
          </ul>
         </li> 
             <li>
          <label for="drop-45" class="toggle">Sales Reports</label>
          <a href="javascript:void();">Sales Reports</a>
          <input type="checkbox" id="drop-45" />
          <ul>
               <li style="width:210px;"><a href="{{$BASE_URL}}planning_assesment_quickreport.home">Planning Assessmet Quick Report</a></li>
			   <li style="width:210px;"><a href="{{$BASE_URL}}nsw_planning_assesment_quickreport.home">NSW Planning Assessment Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}planning_assesment_oldreport.home">Planning Assessmet Old Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}post_par_report.home">Post PAR Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}watch_list_report.home">Watch List</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}real_estate_report.home">Real Estate Report</a>
               <li style="width:210px;"><a href="{{$BASE_URL}}special_condition.home">Special Condition Report</a>
               <li style="width:210px;"><a href="{{$BASE_URL}}lead_generation_report.home">Lead Report</a>
               <li style="width:210px;"><a href="{{$BASE_URL}}proposal_report.home">Proposal Control Panel Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}presented_but_not_signed_report.home">Presented But Not Signed Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}cancelled_par_report.home">Cancelled PAR Report</a></li>
               <li style="width:210px;"><a href="{{$BASE_URL}}lvc_ut_report.home">LVC UT Report</a></li>
			   <li style="width:210px;"><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.home">Upcoming 10 Days PAR Appointment</a></li>
			   <li style="width:210px;"><a href="{{$BASE_URL}}hia_signups_2026.home">HIA SIGNUPS 2026</a></li>
          </ul>
      </li> 
         <li>
          <label for="drop-85" class="toggle">Task Unanswered Question Report</label>
          <a href="javascript:void();">Task Unanswered Question Report</a>
          <input type="checkbox" id="drop-85" />
          <ul>
               <li style="width:300px;"><a href="{{$BASE_URL}}pp_task_unasnwerd_qa_report.home">Project Status And Proposal Status Task Unanswered Question Report</a></li>
          </ul>
         </li>   
  </ul>
</nav>   
    </td>
                </tr>
              </table>
  <table cellpadding="0" cellspacing="0" border="0" width="1550">
<tr>
<td valign="top" width="100%">
<nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:190">
         <li>
          <label for="drop-52" class="toggle">Timeline Change Clearing Centre</label>
          <a href="javascript:void();">Timeline Change Clearing Centre</a>
          <input type="checkbox" id="drop-52" />
          <ul>
				<li style="width:200px;"><a href="{{$BASE_URL}}timeline_report.home">Timeline Change Clearing Centre</a></li>
				<li style="width:200px;"><a href="{{$BASE_URL}}project_delay_register.home">Project Delay Register</a></li>
          </ul>
      </li>
        <li>
          <label for="drop-52" class="toggle">Vehicle Log</label>
          <a href="javascript:void();">Vehicle Log</a>
          <input type="checkbox" id="drop-52" />
          <ul>
               <li><a href="{{$BASE_URL}}vehicle_log.home">Vehicle Log</a></li>
          </ul>
      </li>
         <li>
          <label for="drop-79" class="toggle">Warranty Log</label>
          <a href="javascript:void();">Warranty Log</a>
          <input type="checkbox" id="drop-79" />
          <ul>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_log.home">Warranty Log</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_log2.home">Warranty Log 2.0</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}inspection_warranty_log.home">Inspection Warranty Log</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_escalation_report.home">Warranty Escalation Report</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_communication.home">Warranty Communication</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_log_clearing_center.home">Warranty Log Clearing Center</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}trade_responsibility.home">Trade Responsibility</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_email_log.trade_partner">Warranty Email Log - Trade Partner</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_email_log.customer">Warranty Email Log - Customer</a></li>
               <li style="width:240px;"><a href="{{$BASE_URL}}warranty_email_log.responsible_staff">Warranty Email Log - Responsible Staff</a></li>
			   <li style="width:240px;"><a href="{{$BASE_URL}}warranty_priority_list.home">Warranty Priority List</a></li>
          </ul>
        </li>
 	  <li>
          <label for="drop-80" class="toggle">Roofing Report</label>
          <a href="javascript:void();">Roofing Report</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}roofing_report.home">Roofing Report</a></li>
          </ul>
          </li>
         <li>
          <label for="drop-80" class="toggle">Construction Scheduler Report</label>
          <a href="javascript:void();">Construction Scheduler Report</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}construction_scheduler_report.home">Construction Scheduler Report</a></li>
           </ul>
          </li> 
 	     <li>
          <label for="drop-80" class="toggle">Construction Calendar</label>
          <a href="javascript:void();">Construction Calendar</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li style="width:250px;"><a href="{{$BASE_URL}}default_event.home">Default Event</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}project_qa.home">Project Q/A Clearing Center</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}construction_calendar_update_report.home">Construction Calendar Update Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}customer_details_report.home">Customer Details Report</a></li>
               <li style="width:250px;"><a href="{{$BASE_URL}}smartsheet_accuracy_report.home">Smartsheet Accuracy Report</a></li>
			   <li style="width:250px;"><a href="{{$BASE_URL}}event_log_clearing_center.home">Event Log Clearing Center</a></li>
           </ul>
          </li> 
          <li>
          <label for="drop-82" class="toggle">Letter Boxing</label>
          <a href="javascript:void();">Letter Boxing</a>
          <input type="checkbox" id="drop-80" />
          <ul>
               <li><a href="{{$BASE_URL}}letterboxing.home">Letter Boxing</a></li>
               <li><a href="{{$BASE_URL}}letterboxing_planning.home">Letter Boxing Planning</a></li>
               <li><a href="">Suburb List</a></li>
           </ul>
          </li> 
          <li>
          <label for="drop-83" class="toggle">DA Builder</label>
          <a href="javascript:void();">DA Builder</a>
          <input type="checkbox" id="drop-83" />
          <ul> 
               <li><a href="{{$BASE_URL}}da_builder.report_name">Report Name Table</a></li>
               <li><a href="{{$BASE_URL}}da_builder.home">Add New Report</a></li>
               <li><a href="{{$BASE_URL}}da_builder.rules_central">Rules List</a></li>
           </ul>
          </li> 
         <li>
          <label for="drop-84" class="toggle">Variations Report</label>
          <a href="javascript:void();">Variations Report</a>
          <input type="checkbox" id="drop-84" />
          <ul> 
               <li><a href="{{$BASE_URL}}variations_report.home">Variations Report</a></li>
			   <li><a href="{{$BASE_URL}}variations_in_progress.home">Variations In progress</a></li>
           </ul>
          </li> 
         <li>
          <label for="drop-85" class="toggle">Quote Tracking Report</label>
          <a href="javascript:void();">Quote Tracking Report</a>
          <input type="checkbox" id="drop-85" />
          <ul> 
               <li><a href="{{$BASE_URL}}quote_tracking_report.home">Quote Tracking Report</a></li>
               <li><a href="{{$BASE_URL}}quote_management_report.home">Quote Management Report</a></li>
           </ul>
          </li> 
          <li>
          <label for="drop-86" class="toggle">Sub Pages</label>
          <a href="javascript:void();">Sub Pages</a>
          <input type="checkbox" id="drop-85" />
          <ul> 
               <li><a href="{{$BASE_URL}}sub_pages.home">Sub Pages</a></li>
           </ul>
          </li> 
       <li>
          <label for="drop-87" class="toggle">Email Response Tracker</label>
          <a href="javascript:void();">Email Response Tracker</a>
          <input type="checkbox" id="drop-87" />
          <ul> 
               <li><a href="{{$BASE_URL}}email_response_tracker.home">Email Response Tracker - Accounts</a></li>
               <li><a href="{{$BASE_URL}}email_response_tracker_construction.home">Email Response Tracker - Construction</a></li>
           </ul>
          </li> 
  </ul>
</nav>   
    </td>
 </tr>
</table>  
  <table cellpadding="0" cellspacing="0" border="0" width="1550">
<tr>
<td valign="top" width="100%">
<nav>
  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:180">
         <li>
          <label for="drop-52" class="toggle">Planning Approvals Canberra</label>
          <a href="javascript:void();">Planning Approvals Canberra</a>
          <input type="checkbox" id="drop-52" />
          <ul>
             <!--  <li style="width:200px;"><a href="{{$BASE_URL}}planning_customer_report.home">Planning Customer Detail Report</a></li> -->
               <li style="width:200px;"><a href="{{$BASE_URL}}design_phase_customer_report.home">Design Phase Customer Report</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}latest_merge_plan.home">Latest Merge Plan</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}latest_meeting_minutes.home">Lastest Meeting Minutes</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}design_meeting_list.home">Design Meeting List</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}project_planning_qa.home">Design Q/A Clearing Centre</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_activity_log.home">Activity Log</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_feedback_and_questions.home">Feedback and Questions</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_client_alerts.home">Client Alerts</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}sales_phase_logon.home">Sales Phase Logon</a></li>               
               <li style="width:200px;"><a href="{{$BASE_URL}}sales_document_explained.home">Sales Document Explained</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}sales_process_explained.home">Sales Process Explained</a></li> 
               <li style="width:200px;"><a href="{{$BASE_URL}}design_documents.home">Design Documents</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}design_timeline.home">Design Timeline</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}proposal_documents.home">Proposal Documents</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}proposal_timeline.home">Proposal Timeline</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_documents.home">Planning Documents</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_timeline.home">Planning Timeline</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}inclusion_timeline.home">Inclusion Timeline</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}sample_project_guidance.home">Sample Project Guidance</a></li> 
               <li style="width:200px;"><a href="{{$BASE_URL}}explanation_videos.home">Explanation Videos</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}planning_approval_common_questions.home">Most Common Questions</a></li>
          </ul>
        </li>
          <li>
          <label for="drop-53" class="toggle">Finance Procedures</label>
          <a href="javascript:void();">Finance Procedures</a>
          <input type="checkbox" id="drop-53" />
          <ul>
               <li style="width:200px;"><a href="{{$BASE_URL}}finance_procedure_report.home">Finance Procedures Report</a></li>
               <li style="width:200px;"><a href="{{$BASE_URL}}suspense_account_payment.home">Suspence Account Payment</a></li>
               <li style="width:200px;"><a href="">Bank Statements - TBD</a></li>
               <li style="width:200px;"><a href="">Finance Meetings  - TBD</a></li>
               <li style="width:200px;"><a href="">Daily Bank Reconciliation Report  - TBD</a></li>
          </ul>
        </li>
          <li>
               <label for="drop-54" class="toggle">Legal Dispute Database</label>
               <a href="javascript:void();">Legal Dispute Database</a>
               <input type="checkbox" id="drop-54" />
               <ul>
                    <li style="width:200px;"><a href="{{$BASE_URL}}legal_dispute_database.home">Legal Dispute Database</a></li>
                    <li style="width:200px;"><a href="{{$BASE_URL}}claim_against_us.home">Claims Against Us</a></li>
                    <li style="width:200px;"><a href="{{$BASE_URL}}our_claims.home">Our Claims</a></li>
					<li style="width:200px;"><a href="{{$BASE_URL}}construction_invoice_disputes.home">Construction Invoice Disputes</a></li>
                    <li style="width:200px;"><a href="{{$BASE_URL}}debt_recovery_report.home">Debt Recovery Report</a></li>
					<li style="width:200px;display:none;"><a href="{{$BASE_URL}}disputes_less_than_25k.home">Disputes &lt; $25,000</a></li>
					<li style="width:200px;display:none;"><a href="{{$BASE_URL}}disputes_more_than_25k.home">Disputes &gt; $25,000</a></li>
               </ul>
          </li>
          <li>
               <label for="drop-design-reports" class="toggle">Designs - Architects</label>
               <a href="javascript:void();">Designs - Architects</a>
               <input type="checkbox" id="drop-design-reports" />
               <ul>
                    <li style="width: 320px;"><a href="{{$BASE_URL}}missing_plans_database.home">Missing Plans Database</a></li>
                    <li style="width: 320px;"><a href="{{$BASE_URL}}design_plans_mistake_log.home">Design Plans - Mistake Log</a></li>
                    <li style="width: 320px;"><a href="#">Master List of Design And Plannign Documents (TBD)</a></li>
                    <li style="width: 320px;"><a href="{{$BASE_URL}}designs_information_repository.home">Designs Information Repository (TBD)</a></li>
               </ul>
          </li>
          <li>
              <label for="drop-108" class="toggle">Central Letter Database</label>
              <a href="javascript:void();">Central Letter Database</a>
              <input type="checkbox" id="drop-108" />
              <ul>
                   <li><a href="{{$BASE_URL}}central_letter_database.home">Central Letter Database</a></li>	
              </ul>
          </li>
          
          <li>
              <label for="drop-109" class="toggle">Real Estate</label>
              <a href="javascript:void();">Real Estate</a>
              <input type="checkbox" id="drop-109" />
              <ul>
                   <li><a href="{{$BASE_URL}}property_price_report.home">Property Price Report</a></li>	
              </ul>
          </li>
          
          <li>
              <label for="drop-109" class="toggle">Ephp Development Log</label>
              <a href="javascript:void();">Ephp Development Log</a>
              <input type="checkbox" id="drop-109" />
              <ul>
                   <li><a href="{{$BASE_URL}}development_log_ephp.home">Ephp Development Log</a></li>	
              </ul>
          </li>
          
          <li>
              <label for="drop-109" class="toggle">Franks Recordings Report</label>
              <a href="javascript:void();">Franks Recordings Report</a>
              <input type="checkbox" id="drop-109" />
              <ul>
                   <li><a href="{{$BASE_URL}}franks_recording_report.home">Franks Recordings Report</a></li>	
              </ul>
          </li>
          
           <li>
              <label for="drop-109" class="toggle">Property Sale Project Tracker</label>
              <a href="javascript:void();">Property Sale Project Tracker</a>
              <input type="checkbox" id="drop-109" />
              <ul>
                   <li style="width:200px;"><a href="{{$BASE_URL}}property_sale_project_tracker.home">Property Sale Project Tracker</a></li>
                   <li style="width:200px;"><a href="{{$BASE_URL}}properties_sale_reports.home">Properties for Sale Report</a></li>
				   <li style="width:200px;"><a href="{{$BASE_URL}}central_sms_database.home">Central SMS Database</a></li>
              </ul>
          </li>
		  
           <li>
              <label for="drop-110" class="toggle">Supplier Report</label>
              <a href="javascript:void();">Supplier Report</a>
              <input type="checkbox" id="drop-110" />
              <ul>
                   <li><a href="{{$BASE_URL}}supplier_report.home">Supplier Report</a></li>	
              </ul>
          </li>

     </ul>
</nav>   
    </td>
 </tr>
</table> 
<table cellpadding="0" cellspacing="0" border="0" width="1550">
	<tr>
		<td valign="top" width="100%">
			<nav>
			<label for="drop" class="toggle">Menu</label>
			<input type="checkbox" id="drop" />
				<ul class="menu" style="z-index:179">
					<li>
					<label for="drop-111" class="toggle">Buyer's Agent Canberra</label>
					<a href="javascript:void();">Buyer's Agent Canberra</a>
					<input type="checkbox" id="drop-111" />
					<ul>
						<li style="width:150px;"><a href="{{$BASE_URL}}buyers_agent_canberra.home">Buyer's Agent Canberra</a></li>
						<li style="width:150px;"><a href="{{$BASE_URL}}members.home">Members</a></li>
					</ul>
					</li>
                    
                    <li>
						<label for="drop-112" class="toggle">Insurance Manager</label>
						<a href="javascript:void();">Insurance Manager</a>
						<input type="checkbox" id="drop-112" />
						<ul>
							<li style="width:150px;"><a href="{{$BASE_URL}}insurance_manager.home">Insurance Manager</a></li>
				
						</ul>
					</li>
					
					<li>
						<label for="drop-113" class="toggle">Dual Occupancy Canberra</label>
						<a href="javascript:void();">Dual Occupancy Canberra</a>
						<input type="checkbox" id="drop-113" />
						<ul>
							<li style="width:150px;"><a href="{{$BASE_URL}}dual_occupancy_lead_report.home">Dual Occupancy Lead Report</a></li>
							<li style="width:150px;"><a href="{{$BASE_URL}}dual_occupancy_canberra_q_and_a.home">Dual Occupancy Canberra Q and A</a></li>
						</ul>
					</li>
					
					<li>
						<label for="drop-115" class="toggle">AI</label>
						<a href="javascript:void();">AI</a>
						<input type="checkbox" id="drop-115" />
						<ul>
							<li style="width:150px;"><a href="{{$BASE_URL}}mistake_log.home">Mistake Log</a></li>
							<li style="width:150px;"><a href="{{$BASE_URL}}ai_repository.home">AI Repository</a></li>
							<li style="width:150px;"><a href="{{$BASE_URL}}chatgpt_interface.home">ChatGPT Interface</a></li>
						</ul>
					</li>
                    
                    <li>
						<label for="drop-116" class="toggle">Planning Legislation Register </label>
						<a href="javascript:void();">Planning Legislation Register </a>
						<input type="checkbox" id="drop-116" />
						<ul>
							<li style="width:210px;"><a href="{{$BASE_URL}}planning_legislation_register.home">Planning Legislation Register </a></li>
                            <li style="width:210px;"><a href="{{$BASE_URL}}planning_definations_database.home">Planning Definitions Database </a></li>
						</ul>
					</li>
					
					<li>
						<label for="drop-117" class="toggle">Planning Knowledge Library </label>
						<a href="javascript:void();">Planning Knowledge Library </a>
						<input type="checkbox" id="drop-117" />
						<ul>
							<li style="width:180px;"><a href="{{$BASE_URL}}planning_knowledge_library.home">Planning Knowledge Library</a></li>
						</ul>
					</li>
				</ul>
			</nav>   
		</td>
	</tr>
</table> 
 <script type="text/javascript" language="javascript">
$(document).ready(function(){
    $("#waiting").click(function(){        
			 $('#show').css('display', 'block');
    });
});
</script>
    {{/if}} 
              </td>
          <!--  <td width="10%"><img src="{{$BASE_URL}}images/breadcrumbs-right-corner.jpg" alt="" /></td>-->
          </tr>
          <!-- Shadow Starts -->
          <tr>
            <td colspan="3"><img src="{{$BASE_URL}}images/horizental-shadow.jpg" height="13" width="100%"  alt="" /></td>
          </tr>
          <!-- Shadow Ends -->
        </table></td>
    </tr>
    <!-- Breadcrumbs Ends -->
    <!-- Content Area Starts -->
    <tr>
      <td align="left" valign="top" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="580">
          <tr>
               <td width="80%" align="center" valign="top" height="5">
                    <div class="clipboard_call" style="margin-top: 15px;">
                         <a href="javascript:clipbord();">Show clipboard ...</a>
                         <input type="button" name="" value="Hide Menu" id="menuToggleBtn" onclick="toggleMenu();" data-show="false" style="margin-left: 20px; float: left; margin-top: -5px;">
                         <script>
                              function toggleMenu() {
                                   const btn = $('#menuToggleBtn');
                                   if(btn.val() == 'Hide Menu') {
                                        btn.val('Show Menu');
                                   }
                                   else {
                                        btn.val('Hide Menu');
                                   }
                                   $('#menuTable').slideToggle();
                              }
                         </script>
                    </div>
                    <div id="clipboard" style="width: 99%; background: #FFFFFF; display:none;">
                         <textarea id="clipboard_data" cols="20" rows="5" style="width:95%;" onkeyup="javascript:requestClipboardData();">{{$clipboardData}}</textarea>
                    </div>
                    <div id="show" style="display:none; text-align:center; margin-bottom:15px;"><img src="{{$BASE_URL}}images/loading.gif" /> </div>  
               </td>
          </tr>
          {{if isset($_SESSION.user) && $_SESSION.user.user_id > 0}}
          <tr>
            <td width="80%" align="center" valign="top" height="500"> {{foreach from=$fwSubViews item="fwSubView"}}
              <!-- sub-view start -->
              {{include file=$fwSubView}}
              <!-- sub-view end -->
              {{/foreach}} </td>
          </tr>
          {{else}}
          <tr>
            <td width="80%" align="left" valign="top"> {{foreach from=$fwSubViews item="fwSubView"}}
              <!-- sub-view start -->
              {{include file=$fwSubView}}
              <!-- sub-view end -->
              {{/foreach}} </td>
          </tr>
          {{/if}}
        </table></td>
    </tr>
    <!-- Content Area Ends -->
    <!-- Footer Starts -->
    <tr>
      <td colspan="3" align="left" valign="top" class="footer"><table width="974" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td colspan="14" align="left" valign="top" class="copyrights"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td width="259" align="center"><p>Copyright &#169; 2010-{{$smarty.now|date_format:"%Y"}}. {{$SITE_NAME}}. All Rights Reserved. Developed By <a href="http://www.ephpsolutions.com" target="_blank">EPHPSolutions</a></p></td>
                  <td width="15"></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <!-- Footer Ends -->
  </table></td>
</tr>
</table>
    <!-- Main Table Ends -->
</div>
<!--EndHTML-->
<div id="topbox" style="visibility:hidden;" align="center" style="vertical-align:middle;"></div>
</body>
</html>
{{/if}}