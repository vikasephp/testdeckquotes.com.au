<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3>

{{if !$opr}}
   
<form name="detail" method="post" action="{{$XFA.home}}" enctype="multipart/form-data">
	<div style="width:100%;display:inline-block;">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
			<a href="{{$BASE_URL}}watch_list_report.add_wlai/wlai_bsn_id/{{$wlai_bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Action Item</a>
		</div>
	</div>
	<input type="hidden" name="pm[wlai_bsn_id]" value="{{$detail.wlai_bsn_id}}" id="dh_id"/>
    <table id="list-table" width="90%" cellpadding="0" cellspacing="0" height="350" style="border:1px solid #CCC;">
		<tr>
			<th width="35%">Action Name</th>
			<th width="35%">Status</th>
			<th width="20%">Action</th>
		</tr>
		{{if $wlai}}
			{{foreach from=$wlai key="key" item="item"}}
			<tr>
				<td>{{$item.wlai_action_name}}</td>
				<td>
					{{$item.wlai_action_status}}<br/>
					{{if $item.wlai_action_status eq 'Complete'}}
						{{if $item.wlai_action_status_user}}<br/>{{$item.wlai_action_status_user}}{{/if}}
						{{if $item.wlai_action_status_date}}<br/>{{$item.wlai_action_status_date}}{{/if}}
					{{/if}}
				</td>
				<td>
					<a href="{{$BASE_URL}}watch_list_report.add_wlai/wlai_bsn_id/{{$wlai_bsn_id}}/wlai_id/{{$item.wlai_id}}" class="various" title="Edit">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png">
					</a>
					<a href="{{$BASE_URL}}watch_list_report.delete_wlai/wlai_bsn_id/{{$wlai_bsn_id}}/wlai_id/{{$item.wlai_id}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete this Action with Name {{$item.wlai_action_name}}?')) return false;">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png">
					</a>
                </td>
			</tr>
			{{/foreach}}
		{{else}}
		<tr>
			<td colspan="3" style="text-align: center;">No Content</td>
		</tr>
		{{/if}}
	</table>
</form>

{{else}}
  	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>

{{if !$opr}}
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
    </script>
{{/if}}