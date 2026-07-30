<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>
.tooltip {
    position: relative;
   /* display: inline-block;*/
	border:0px solid !important;
	margin-top:5px;
    
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 500px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 5px;
	display:block;
	margin-left:20px;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%" cellspacing="10" cellpadding="3" >
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="33%">
        	<a href="{{$BASE_URL}}planning_progress_report.home">Planning Progress Report</a>
        </th>
        <th class="topmenu" align="center" valign="middle" width="33%">
         	<a href="{{$BASE_URL}}planning_assesment_quickreport.home">Planning Assessmet Quick Report</a><br /><br />
                <a href="{{$BASE_URL}}planning_assesment_oldreport.home">Planning Assessmet Old Report</a><br />
         </th>
        <th class="topmenu" align="center" valign="middle" width="33%">
        	 <a href="{{$BASE_URL}}proposal_checklist_report.home">Proposal Checklist Report</a>
         </th>
      </tr>
 <tr>
        <th class="topmenu" align="center" valign="middle">
         <a href="{{$BASE_URL}}inclusions_report.home">Inclusions Report </a></th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}construction_report.home">Construction Report</a></th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}complete_report.home">Complete Report</a></th>
      </tr>

 <tr>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}post_par_report.home">Post PAR Report</a>
        </th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}design_report.home">Designs Report</a>
       </th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}cma2.home">CMA</a>
        </th>
      </tr>

 <tr>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}inclusions_task_tracker.home">Inclusion Task Tracker</a>
        </th>
        <th class="topmenu" align="center" valign="middle">
         <a href="{{$BASE_URL}}construction_task_tracker.home">Construction Task Tracker</a>
       </th>
        <th class="topmenu" align="center" valign="middle">
       <a href="{{$BASE_URL}}planning_task_tracker.home">Planning Task Tracker</a>
        </th>
      </tr>

 <tr>
        <th class="topmenu" align="center" valign="middle">
        <a href="#">Designs Workflow</a>
        </th>
        <th class="topmenu" align="center" valign="middle">
   <a href="{{$BASE_URL}}watch_list_report.home">Watch List</a>
       </th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}initial_design_task_report.home">Initial Design Task Report</a>
        </th>
      </tr>

       <tr>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}design_take_off_report.home">Design Take Off Report</a>
        </th>
        <th class="topmenu" align="center" valign="middle">
        <a href="{{$BASE_URL}}real_estate_report.home">Real Estate Report</a>
       </th>
        <th class="topmenu" align="center" valign="middle">
         <a href="{{$BASE_URL}}proposal_report.home">Proposal Control Panel Report</a>
        </th>
      </tr>


  </table>

 
</div>