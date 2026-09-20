<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div>
{{if $eml_id eq '0' }}
   <h3><b> Please Select Email Code</b> </h3>
{{else}}  

<form name="emlib" method="post" action="" enctype="multipart/form-data" >
<input type="hidden" name="emailData[subject]"  value="{{$subject}}"  />
<input type="hidden" name="emailData[to_email]" value="{{$to_email}}"  />
<input type="hidden" name="emailData[to_name]"  value="{{$to_name}}"  />
<input type="hidden" name="emailData[eml_id]"  value="{{$eml_id}}"  />
<input type="hidden" name="emailData[eml_code]"  value="{{$eml_code}}"  />
<input type="hidden" name="emailData[eml_ie_email]"  value="{{$emldata.eml_ie_email}}"  />


<table border="1" width="100%" cellpadding="5" cellspacing="0">
<tr><th>Email Type</th><td>{{$emldata.eml_ie_email}} </td><th>Qa ? </th><td>{{$emldata.eml_qa}} </td></tr>
<tr><th>Email Subject</th><td>{{$subject}} </td><th>Status</th><td>{{if $emldata.eml_qa eq 'No'}} InActive {{else}} Active {{/if}} </td></tr>
<tr><th>Select Document to Attach</th> 
<td width="60%">

    <div class="bsearch_scroll_div" style="width:660px;">
       <ul style="margin: 0; padding: 0;">
       {{foreach from = $docdata key="key" item="item" }}
       
        <li><input type="checkbox" name="emailData[bsn_document][]" value="{{$item.doc_file_name}}|{{$item.admin_doc_name}}" >{{$item.admin_doc_name}}</li> 
        {{/foreach}} 
       </ul>
    </div>
</td>  
<th>Select Internal<br /> User </th> <td>
<div class="bsearch_scroll_div" style="width:260px;">
           <ul style="margin: 0; padding: 0;">
           {{foreach from = $users key="key" item="item" }}
           
            <li><input type="checkbox" name="emailData[user_email][]" value="{{$item.user_email}}" >{{$item.user_name}}</li> 
              {{/foreach}} 
           </ul>
</div>

</td></tr>
<tr>
<th>Additional Attachment</th>
<td colspan="3"> <input type="file" name="docs1" /> <input type="file" name="docs2" /><input type="file" name="docs3" /></td>
</tr>

<tr>
<th>Template docs to Attachment</th>
<td colspan="3">
<div class="bsearch_scroll_div" style="width:600px;">
           <ul style="margin: 0; padding: 0;">
           {{foreach from = $templatedocs key="key" item="item" }}
           
            <li><input type="checkbox" name="emailData[template_docs][]" value="{{$item.dhd_name2}}" >
            {{$item.dhd_name2}} &nbsp;|&nbsp;{{$item.dh_title}}</li> 
          
           {{/foreach}} 
           </ul>
</div>


</td>
</tr>

<tr>
<th> Email Body </th>
<td colspan="3"> <textarea name="emailData[bsn_emcontent]" id="editor"  cols="100" rows="15"> {{$emldata.eml_email_content}}</textarea></td>
</tr>
<tr>
<td colspan="4">
<input type="submit" value="Send" name="ems"> &nbsp; &nbsp; <input type="Button" value="Cancel" />
</td> 
</tr>
</table>
</form>
{{/if}}

</div>
<script>
	initSample();
</script>