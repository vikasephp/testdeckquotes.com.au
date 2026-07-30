<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Plan Breach</h3>
    <table id="list-table" width="98%">
        {{if $opr}}
        <tr>
            <th colspan="2" style="color:#FF0000;">{{$opr}}</th>
        </tr>
        {{/if}}
        <tr>
			<th>Document Name</th>
			<th>Breach Test</th>
		</tr>
		<!-- <tr>
			<td>Please Select</td>
			<td>{{ $please_select_plan_breach[0].os2_breach_test }}</td>
		</tr> -->
		{{ foreach from = $plan_breach key="key" item="item" }}
		<tr {{ if $item.ppc_id eq $doc_name }}style="background: blue; color: white;"{{ /if }}>
			<td doc_name="{{ $doc_name }}" ppc_document="{{ $item.ppc_document }}">{{ $item.ppc_document }}</td>
			<td>{{ $item.os2_breach_test }}</td>
		</tr>
		{{ /foreach }}
    </table>
    <br />
    <input type="button" name="btnCancelDetail" value="Close" onclick="parent.$.fancybox.close();" class="vsml" />
    <script type="text/javascript">
        function closepop() {
            window.location.href = "{{$BASE_URL}}project_planning_checklistAdmin.view_ppt";
        }
    </script>
</div>