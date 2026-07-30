<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$doc_name[0].ppc_document}}</h3>
    <table id="list-table" width="98%">
        <tr>
			<th>Breach Text</th>
		</tr>
		{{if $breach_text }}
    		{{ foreach from = $breach_text key="key" item="item" }}
    		<tr>
    			<td>{{ $item.os2_breach_test }}</td>
    		</tr>
    		{{ /foreach }}
		{{else}}
		<tr>
			<td style="text-align: center;"><b>No Data Available</b></td>
		</tr>
		{{/if}}
    </table>
    <br />
    <input type="button" name="btnCancelDetail" value="Close" onclick="parent.$.fancybox.close();" class="vsml" />
    <script type="text/javascript">
        function closepop() {
            window.location.href = "{{$BASE_URL}}planning_only_task_tracker.view_project/bsn_id/{{$bsn_id}}";
        }
    </script>
</div>