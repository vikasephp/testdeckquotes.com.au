<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>

input[type=radio] {
    border: 0px;
    width : 3em;
    height: 3em;
}
</style>

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
parent.$.fancybox.close();
</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3><br />
<form name="detail" method="post" action="{{$XFA.alert}}" enctype="multipart/form-data" id="test">

  {{if !$opr}}
   
   
   
   <table id = "product-table">
   <tr>
   <td colspan="2">
  
        <form name="followups" method="post" action="">
        <input type="hidden" name="follows[sf_id]" value="{{$followupsdetail.sf_id}}" />
        <table cellpadding="0" cellspacing="0" >
        <tr>
        <td colspan="2">
         <input type="radio" name="follows[sf_source]" value="4" /> <span style="font-size:20px; padding-right:60px;" > Spoke to Customer </span>
         <input type="radio" name="follows[sf_source]" value="3" /> <span style="font-size:20px; padding-right:60px;" > Lift Message  </span>
         <input type="radio" name="follows[sf_source]" value="2" /> <span style="font-size:20px;" > NA </span>
        </td>
        </tr>
        
        <tr>
        <!--<td>Source:&nbsp;
            <select name="follows[sf_source]" style="width:150px;">
                <option value="0">--select--</option>
                {{foreach from=$alltablefollowsource item="item" key="key"}}
                <option value="{{$item.sfo_id}}" {{if $item.sfo_id == $followupsdetail.sf_source}} selected="selected" {{/if}}>
                 {{$item.sfo_name}}
                </option>
                 {{/foreach}}
            </select>	
         </td>-->
         <td>Type:&nbsp;
         <select name="follows[sf_types]" style="width:150px;">
            	<option value="0">--select--</option>
                {{foreach from=$alltablefollowtypes item="item" key="key"}}
                 <option value="{{$item.tfo_id}}" {{if $item.tfo_id == $followupsdetail.sf_types}} selected="selected" {{/if}}>
                 {{$item.tfo_name}}
                 </option>
                {{/foreach}}
          </select>	
          </td>
                            
         <td>
     Date:&nbsp;<input type="text" name="follows[sf_date]" value="{{$followupsdetail.sf_date}}" class="w16em dateformat-d-ds-m-ds-Y" maxlength="25" id="demo5" readonly="readonly" style="width:100px;"/>
         </td>
         <td></td>
         </tr>
        <tr><td colspan="3">
        <textarea cols="125" rows="10" name="follows[sf_notes]">{{$followupsdetail.sf_notes}}</textarea></td></tr>
        
        </table>
             
</td>
<td>
        
        
</td></tr>
     
</table>

            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>
   
    
    
     <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="feedbacksave" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
      </tr>
    
    </table>  
      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}


  </form>


<script type="text/javascript" language="javascript" >
function show1(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#one').show();
	 } else if(val==0) {
		 $('#one').hide();
	 }
}

function show2(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#two').show();
	 } else if(val==0) {
		 $('#two').hide();
	 }
}

function show3(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#three').show();
	 } else if(val==0) {
		 $('#three').hide();
	 }
}
</script>


</div>