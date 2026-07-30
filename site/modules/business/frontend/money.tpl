<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<!--{{if $msg != 0}}
<script type="text/javascript">
	parent.requestmoneyInfo(1);
</script>
<script type="text/javascript">
	parent.toggleLayer('divmoney','addenq');
	closeTop();
</script>
{{/if}}-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
  <form name="detail" method="post" action=""  onsubmit="showTop();return false;">
  <input type="hidden" name="{{$TABLE}}[pm_id]" value="{{$detail.pm_id}}" id="pm_id"/>
  <input type="hidden" name="{{$TABLE}}[pm_business_id]" value="{{$detail.pm_business_id|default:$bsn_id}}" id="pm_business_id"/>
    <tr>
      <td colspan="3" width="100%">
      	<table width="100%" height="200" style="background-color:#FFFFFF; border:1px solid #c1dad7;">
          <tr>
            <td width="300">5% Amount:&nbsp;AUD ($)&nbsp;<input type="text" name="" value="{{$5perval}}" />&nbsp;</td>
            <th colspan="3" class="">
            <p class="field switch">
                <label class="cb-enable" id="pm_5per_amt"><span>YES</span></label>
                <label class="cb-disable selected"><span>NO</span></label>
                <input type="checkbox" id="pm_5per_amt" class="checkbox" value="1" name="{{$TABLE}}[pm_5per_amt]" {{if $detail.pm_5per_amt == 1}}  checked="checked" {{/if}}/>
            </p>
     &nbsp;&nbsp;&nbsp;&nbsp;<span class="disable"><input type="text" class="notes" name="{{$TABLE}}[pm_5per_note]" value="{{$detail.pm_5per_note}}" style="width:600px;" /></span>
        	</th>
          </tr>
          <tr>
            <td>45% Amount:&nbsp;AUD ($)&nbsp;<input type="text" name="" value="{{$45perval}}" />&nbsp;</td>
         <th colspan="3">
         <p class="field switch">
            <label class="cb-enable" id="pm_45per_amt"><span>YES</span></label>
            <label class="cb-disable selected"><span>NO</span></label>
            <input type="checkbox" id="pm_45per_amt" class="checkbox" value="1" name="{{$TABLE}}[pm_45per_amt]" {{if $detail.pm_45per_amt == 1}}  checked="checked" {{/if}}/></p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="disable"><input type="text" class="notes" name="{{$TABLE}}[pm_45per_note]" value="{{$detail.pm_45per_note}}" style="width:600px;"/></span>
        </th>
          </tr>
          <tr>
            <td>50% Amount:&nbsp;AUD ($)&nbsp;<input type="text" name="" value="{{$50perval}}" />&nbsp;</td>
            <th colspan="3">
            <p class="field switch">
            <label class="cb-enable" id="pm_50per_amt"><span>YES</span></label>
            <label class="cb-disable selected"><span>NO</span></label>
            <input type="checkbox" id="pm_50per_amt" class="checkbox" value="1" name="{{$TABLE}}[pm_50per_amt]" {{if $detail.pm_50per_amt == 1}}  checked="checked" {{/if}}/>
			</p>
  &nbsp;&nbsp;&nbsp;&nbsp;<span class="disable"><input type="text" class="notes" name="{{$TABLE}}[pm_50per_note]" value="{{$detail.pm_50per_note}}" style="width:600px;"/></span>
            </th>
          </tr>
		</table>
        <script type="text/javascript">
	$(document).ready( function(){ 
		$(".cb-enable").click(function(){
			var parent = $(this).parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$(parent).next('span').show();
		});
		
		$(".cb-disable").click(function(){
			var parent = $(this).parents('.switch');
			$('.cb-enable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox',parent).attr('checked', false);
			$(parent).next('span').hide();
		});
	});
	</script>
    {{if $detail.pm_5per_amt == 1}} 
    <script type="text/javascript">
		$(document).ready( function(){	
			var parent = $('#pm_5per_amt').parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$('#pm_5per_amt').addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$(parent).next('span').show();
		});
    </script>
    {{/if}}
    {{if $detail.pm_45per_amt == 1}} 
    <script type="text/javascript">
		$(document).ready( function(){	
			var parent = $('#pm_45per_amt').parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$('#pm_45per_amt').addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$(parent).next('span').show();
		});
    </script>
    {{/if}}
    {{if $detail.pm_50per_amt == 1}} 
    <script type="text/javascript">
		$(document).ready( function(){	
			var parent = $('#pm_50per_amt').parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$('#pm_50per_amt').addClass('selected');
			$('.checkbox',parent).attr('checked', true);
			$(parent).next('span').show();
		});
    </script>
    {{/if}}
    </td>
    </tr>
    <tr>
      <td colspan="2"><div align="left"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>&nbsp;
          <input type="button" name="cancel" value="Cancel" onclick="javascript:parent.add_edit_money();" class="sml"/></div></td>
    </tr>
  </form>
</table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.addValidation("{{$TABLE}}[pm_type]","req", "Please specify type.");
    frmvalidator.addValidation("{{$TABLE}}[pm_amount]","req", "Please specify amount.");
</script>
</div>