<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">


function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
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


<div style="min-height:350px; z-index:9999999;">
<br /><br />
<form>
<table id="list-table" width="99%">
	<tr>
		<td style="width:100px;">Add Email:</td>
		<td>
			<input type="text" id="send_to" name="to" placeholder="Enter email addresses, separated by commas" style="width:650px;" />
		</td>
	</tr>
</table>
</form>

<h3 class="page-title"><br />Email Preview</h3>
<div class="email_temp">
<style>
.et_table {
width: 100%;
border-collapse: collapse;
table-layout: fixed;
}
.et_table th, .et_table td {
border: 1px solid #ccc;
padding: 8px;
text-align: left;
word-wrap: break-word;
overflow-wrap: break-word;
font-size: 12px;
padding: 5px;
}
.et_table th{
text-align: center;
font-weight: bold;
}
.et_table td{
font-weight: normal;
text-align: left;
}
</style>
<p>
Hi Frank,<br/>
Please find the details for the Appointments booked for the following dates - {{$curDate|date_format:"%d-%m-%Y"}} to {{$endDate|date_format:"%d-%m-%Y"}} (Upcoming 10 Days) 
</p><br/>

{{assign var=last_date value=''}}

{{foreach from=$email_data item=item}}

    {{if $item.bsn_sales_next_meeting_date != $last_date}}

        {{if $last_date != ''}}
            </table><br />
        {{/if}}

        <h3 style="margin-top:20px;margin-bottom: 3px; text-decoration: underline;">
            {{$item.bsn_sales_next_meeting_date|date_format:"%A %d/%m/%Y"}}
        </h3>

        <table class="et_table">
            <tr> 
                <th width="10%">Date and Time</th>
                <th width="20%">Customer Name - Project Address </th>
                <th width="15%">Appointment Type/Where</th>
                <th width="35%">Documents</th>
                <th width="10%">PAR Couriered</th>
                <th width="10%">Intro Box Sent</th>
            </tr>

        {{assign var=last_date value=$item.bsn_sales_next_meeting_date}}
    {{/if}}

    <tr>
        <td>
            {{if $item.bsn_sales_next_meeting_date }}
                {{$item.bsn_sales_next_meeting_date|date_format:"%A"}} <br/>
                {{$item.bsn_sales_next_meeting_date|date_format:"%d/%m/%Y"}}
            {{/if}}
            {{if $item.bsn_sales_next_meeting_time}}
                <br/> {{$item.bsn_sales_next_meeting_time}}
            {{/if}}
        </td>

        <td>
            {{$item.bcust_fname}} {{$item.bcust_lname}}
            {{if $item.bsn_address}}
                <br/><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bs_business_id}}">{{$item.bsn_address}}</a>
            {{/if}}
        </td>

        <td>
            {{foreach from=$appointmentType item=at}}
                {{if $at.splat_id == $item.bsn_splat_id}}
                    {{$at.splat_option}}
                {{/if}}
            {{/foreach}}
			<br/>{{$item.bsn_sales_next_meeting_where}}
        </td>

        <td>
            <b>PAR Report:</b>
            {{if $item.par_report}}
                <br/><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.download_content?file_name={{$item.par_report}}&module_name=business.home" target="_blank">{{$item.par_report}}</a>
            {{else}}<br/>N/A{{/if}}
            <br/>

            <b>Design Agreement:</b>
            {{if $item.design_agreement}}
                <br/><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.download_content?file_name={{$item.design_agreement}}&module_name=business.home" target="_blank">{{$item.design_agreement}}</a>
            {{else}}<br/>N/A{{/if}}
            <br/>

            <b>PAR Proposal:</b>
            {{if $item.par_proposal}}
                <br/><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.download_content?file_name={{$item.par_proposal}}&module_name=business.home" target="_blank">{{$item.par_proposal}}</a>
            {{else}}<br/>N/A{{/if}}
            <br/>

            <b>Meeting Agenda:</b>
            {{if $item.meeting_agenda}}
                <br/><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.download_content?file_name={{$item.meeting_agenda}}&module_name=business.home" target="_blank">{{$item.meeting_agenda}}</a>
            {{else}}<br/>N/A{{/if}}
            <br/>

            <b>UTPAR Report:</b>
            {{if $item.utpar_report}}
                <br/><a href="{{$BASE_URL}}upcoming_10_days_par_appointment.download_content?file_name={{$item.utpar_report}}&module_name=business.home" target="_blank">{{$item.utpar_report}}</a>
            {{else}}<br/>N/A{{/if}}
        </td>

        <td>
            {{if $item.bs_paqr_alertoption neq 6}}
                No
            {{else}}
                {{foreach from=$alertdata item=al}}
                    {{if $al.pa_id == $item.bs_paqr_alertoption}}{{$al.pa_alert}}{{/if}}
                {{/foreach}}
            {{/if}}

            {{if $item.bs_paqr_alertoption neq 0}}
                <br/>{{$item.bs_paqr_alertoption_at|date_format:"%d/%m/%Y"}}<br/>
                {{$item.alert_option_user}}
            {{/if}}
        </td>

        <td>
            {{if $item.boxsent}}
                {{$item.boxsent|date_format:"%d-%m-%Y %H:%M:%S"}}
            {{else}}
                No
            {{/if}}
        </td>
    </tr>

{{/foreach}}
</table>
</div>
<br />
<br />

<input type="button" value="Send Email" onclick="sendEmailNow();" class="vsml" style="margin: 0 auto; display: block;"/><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" style="margin: 0 auto; display: block;"/><br />
<br />
<script type="text/javascript">

function sendEmailNow() {
	var btn = event.target;
    var emails = document.getElementById('send_to').value.trim();

    if (!emails) {
        alert("Please enter at least one email address.");
        return;
    }

	var emailContent = document.querySelector('.email_temp').innerHTML;
	
	btn.value = "Please wait...";
    btn.disabled = true;
	
    $.ajax({
        url: "{{$BASE_URL}}upcoming_10_days_par_appointment.send_email",
        type: "POST",
        data: { 
            emails: emails,
            message: emailContent 
        },
        success: function(res) {
			console.log(res);
            alert("Email sent successfully!");
            closepop();
        },
        error: function(err) {
            alert("Error sending email");
        }
    });
}

</script>

<script type="text/javascript">
	function closepop()
	{
	setTimeout('parent.close_win();', 500);
	}
</script>
</div>