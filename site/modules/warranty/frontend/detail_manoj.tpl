<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>

#list-table2 {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 th {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 td {border: 1px solid #9CF; border-collapse:collapse; }
</style>






<form name="detail" method="post" action="" enctype="multipart/form-data" id="pp">
  <table id="product-table" width="1250" cellpadding="0" cellspacing="0" border="0">
    <tr><td>
      <div style="border:1px solid gray; margin-bottom: 1em; padding-top:20px;">
         
      <table id="none-table" width="100%" cellpadding="0" cellspacing="5" border="0">
      <tr>
     <th width="25%">Project Name</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wa_project]" style ="width:700px" value="{{$detail.wa_project}}" />
      </td>
      
      <th>Tenanted</th>
     <td>
         <input type="checkbox" name="{{$TABLE}}[wa_tenanted]" {{if $detail.wa_tenanted eq 1 }} checked="checked" {{/if}}  />
      </td>
    </tr>
    
     <tr>
        <th>Complete and Close Letter</th>
        <td><input type="file" name="cc_letter" />
        {{if $detail.wa_cc_letter}} <a href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_cc_letter}}" target="_blank">Download</a>{{/if}}
        </td>
     </tr>  
    
        <tr>
        <th>Problem Description</th>
        <td><textarea cols="120" rows="16" name="{{$TABLE}}[wa_prob_desc]" id="editor1" class="ckeditor" >{{$detail.wa_prob_desc|stripslashes}}</textarea>    
 </td>
     </tr> 
    
    </table>           
               
      </td>   
         
          
           </tr>
           </table>
     
 