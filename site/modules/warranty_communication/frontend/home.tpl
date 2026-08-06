<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

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

	function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'manage_status') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.status.view_file_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_schedule_datetime') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.schedule_datetime.view_file_name }}" + "/random/" + Math.random();
        }
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 300,
                'speedOut': 300,
                'overlayShow': true,
                'overlayColor': '#000',
                'hideOnOverlayClick': false,
                'hideOnContentClick': false,
                'type': 'iframe',
                'href': viewurl,
                'scrolling': 'yes'
            });
        });
    }
</script>

<h3 class="page-title" style="margin-bottom: 50px;">{{$title}}</h3>

<form name="mshort" action="" method="post">
	<div style="display: flex; justify-content: space-between;">
		<div style="text-align: left;">
			<div>
				<strong>Communication Type:</strong>
				<select name="communication_type" style="width: 150px;">
                    <option value="">Select All</option>
					<option value="Email" {{if $communication_type == 'Email'}}selected{{/if}}>Email</option>
					<option value="Sms" {{if $communication_type == 'Sms'}}selected{{/if}}>Sms</option>
				</select>
				<input type="submit" value="Search" name="search_communication_type">
				<input type="submit" name="clear" value="Clear Search">
			</div>
			<div>
				<strong>Project Name:</strong>
				<input type="text" name="project_name" style="width: 200px;" value="{{$project_name}}" list="project" autocomplete="off">
				<datalist id='project'>
					{{foreach from=$project_data key="key" item="item"}}
					<option value="{{$item.wa_project}}">
						{{$item.wa_project}}
					</option>
					{{/foreach}}
				</datalist>
				<input type="submit" value="Search" name="search_project_name">
				<input type="submit" name="clear" value="Clear Search">
			</div>
		</div>
	</div>
</form>

<div>
	<table id="list-table" style="width: 100%; margin: auto; margin-top: 20px;">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle">ID</th>
				<th class="topmenu" align="center" valign="middle">Communication type</th>
				<th class="topmenu" align="center" valign="middle">Date & time sent</th>
				<th class="topmenu" align="center" valign="middle">Client name</th>
				<th class="topmenu" align="center" valign="middle">Client contact</th>
				<!-- <th class="topmenu" align="center" valign="middle">Related log</th> -->
				<th class="topmenu" align="center" valign="middle">Project Name</th>
				<th class="topmenu" align="center" valign="middle">Delivery status</th>
				<th class="topmenu" align="center" valign="middle">Message content</th>
			</tr>
		</thead>
		<tbody>
			{{if count($list) > 0}}
				{{foreach from=$list key=index item=row}}
					<tr>
						<td>{{$row.email_id}}</td>
						<td>{{$row.communication_type}}</td>
						<td>{{$row.sent_datetime}}</td>
						<td>{{$row.client_name}}</td>
						<td>{{$row.client_contact}}</td>
						<!-- <td>{{$row.related_log}}</td> -->
						<td>{{$row.project_name}}</td>
						<td>{{$row.delivery_status}}</td>
						<td>{{$row.message_content}}</td>
					</tr>
				{{/foreach}}
			{{else}}
				<tr>
					<th colspan="9">No Record</th>
				</tr>
			{{/if}}
		</tbody>
	</table>

	{{if $last > 1}}
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			{{if $list}}
			<td align="center">
				<div class='pagination'>
					{{if $pagenum == 1}}
						<span class='disabled'>&#171; previous</span>
					{{else}}
						<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
					{{/if}}
					{{if $pagenum != 1}}
						<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
					{{else}}
						<span class='current'>1</span>
					{{/if}}
					{{if $pagenum != 2}}
						<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
					{{else}}
						<span class='current'>2</span>
					{{/if}}
					{{if $paginateprev.0 > 3}}
						...
					{{/if}}
					{{foreach from=$paginateprev key="page_key" item="page_num"}}
						{{if $page_num == $pagenum OR $page_num <= 2}}
						{{elseif $page_num == $lastone}}
						{{else}}
							<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
									<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
							<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
						{{/if}}
					{{/if}}
					{{if $last == 1}}
					{{elseif $last == 2}}
					{{else}}
						{{if $pagenum == $last}}
							<span class='current'>{{$last}}</span>
						{{else}}
							<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
						{{/if}}
					{{/if}}
					{{if $pagenum == $last}}
						<span class='disabled'>next &#187;</span>
					{{else}}
					<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x+y" x=$pagenum y=1}}" title="Next">next &#187;</a>
				</div>
				{{/if}}
			</td>
			{{else}}
				<td align="center" height="300">Record Not found... </td>
			{{/if}}
		</tr>
	</table>
	{{/if}}
</div>
	