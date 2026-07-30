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
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />{{ $page_title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<thead>
                <tr>
                    <th class="topmenu_list" align="center" valign="middle">
                        <div align="center">Action</div>
                    </th>
                    <th class="topmenu_list" align="center" valign="middle">
                        <div align="center">Category</div>
                    </th>
                    <th class="topmenu_list" align="center" valign="middle">
                        <div align="center">Item</div>
                    </th>
                    <th class="topmenu_list" align="center" valign="middle">
                        <div align="center">Will It Come With a Manual</div>
                    </th>
                    <th class="topmenu_list" align="center" valign="middle">
                        <div align="center">For Inclusions</div>
                    </th>
                </tr>
            </thead>
            <tbody>
                {{foreach from=$list item="item" key="key"}}
                <tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
                    <td>
                        <a onclick="open_popup('', '{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}')" href="javascript:void(0);" title="Edit" class="various"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
                        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete the Task?')) return false;"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
                    </td>
                    <td>{{$item.ic_name}}</td>
                    <td>{{$item.il_name}}</td>
                    <td>{{$item.il_is_manual_available == 1 ? 'Yes' : 'No'}}</td>
                    <td>{{$item.il_is_inclusions == 1 ? 'Yes' : 'No'}}</td>
                </tr>
                {{/foreach}}
            </tbody>
		</table>
        <br />
        <br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");
	</script>
</div>
<script>
	initSample();
</script>