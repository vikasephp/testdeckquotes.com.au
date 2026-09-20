<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
	<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
    </script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action=""  enctype="multipart/form-data">
        <table id="list-table" width="60%">

           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
       <tr> <td width="50%"><strong>Design Number</strong> </td> <td> </td>
            
    {{foreach from=$didetail key="key" item="item"}}
    <tr> <td> {{$item.di_design_number}}</td>
         <td>
<input type="checkbox" value="{{$item.di_design_number}}"  name="{{$TABLE}}[do{{$item.di_id}}]" {{foreach from=$design_num key="key1" item="item1"}} {{if $item1 eq $item.di_design_number}} checked="checked" {{/if}} {{/foreach}} /> 
         </td>
    </tr>  
    {{/foreach}}       
                 
		<br />  <br />
          
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
	
   {{/if}} 
</div>