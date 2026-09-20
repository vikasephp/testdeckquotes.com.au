{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}

{{if !empty($documents_data_show_fin)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%" border="1" id="divtruelog">

{{if $documents_data_fin}}
  <tr>
    <th width="10%">Action</th>
    <th width="30%">Document Name</th>
    <th width="15%">File Link2</th>
    <th width="6%">When <br />Uploaded</th>
    <th width="8%">Who Uploaded</th>
    <th width="9%">Cover Letter <br />Attached</th>
    <th width="9%">Emailed to Client</th>
    <th width="10%">Posted to Client</th>
    <th width="9%">Uploaded <br />To WWW</th>
    <th width="8%">Q/ED</th>
  </tr>

  {{foreach from=$documents_data_fin item=item key=key}}
  <tr>
    <td> {{if empty($inrenaldocuments)}}<a href="javascript:RequestcheckListIframe('adddocuments_fin','{{$item.bd_id}}','{{$divid}}','');" >{{else}} <a href="javascript:RequestcheckListIframe('intdocuments_fin','{{$item.bd_id}}','{{$divid}}','');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
      {{if $USER_GROUP == 'Administrators'}}
      {{if empty($inrenaldocuments_fin)}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','6');" >{{else}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','6');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
    <td style="text-align:left;">{{if $item.bd_type!='0' AND $item.bd_type!=''}}{{$item.bd_type}}{{/if}}</td>
    <td style="text-align:center;"><a href="{{$BASE_URL}}{{$FILE_PATH}}files/business_documents/{{$item.bd_doc_name}}" title="{{$item.bd_doc_name}}" class="action_small" target="_blank">{{$item.bd_doc_name|truncate:"10"}}</a></td>
    <td style="text-align:center;">{{$item.bd_uploaded_date}}</td>
    <td style="text-align:left;">{{$item.user_name}}</td>
  
   {{if $item.bd_cover_letter eq 1 }} 
    <td style="text-align:center; background:#F90" id ="cl{{$item.bd_id}}">
  {{else}}
  <td style="text-align:center; background: #F00" id ="cl{{$item.bd_id}}">
  {{/if}} 
    <input type hidden name ="finance[{{$item.bd_id}}][bd_id]" value = "{{$item.bd_id}}"  />
    <input type="radio" name="finance[{{$item.bd_id}}][bd_cover_letter]" value="1" {{if $item.bd_cover_letter == 1}} checked="checked" {{/if}}  onclick="cover({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="finance[{{$item.bd_id}}][bd_cover_letter]" value="0" {{if $item.bd_cover_letter == 0}} checked="checked" {{/if}}  onclick="cover({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);" /> NO
  
      {{if $item.bd_cover_letter eq 1 }}
	 <input type="date" name="finance[{{$item.bd_id}}][bd_cover_letter_date]"   id = "dtcl{{$item.bd_id}}" value="{{$item.bd_cover_letter_date}}" style="margin-top:4px;" /> <br />
     <strong>{{$item.bd_cover_user}}</strong>   
     {{else}}
     <input type="date" name="finance[{{$item.bd_id}}][bd_cover_letter_date]" hidden="true" id = "dtcl{{$item.bd_id}}" value="{{$item.bd_cover_letter_date}}" style="margin-top:4px;"  /> 
     {{/if}}
    </td>
 
   {{if $item.bd_emailed_client eq 1 }} 
    <td style="text-align:center; background:#F90" id ="ec{{$item.bd_id}}">
  {{else}}
    <td style="text-align:center; background: #F00" id ="ec{{$item.bd_id}}">
  {{/if}}
    
    <input type="radio" name="finance[{{$item.bd_id}}][bd_emailed_client]" value="1" {{if $item.bd_emailed_client == 1}} checked="checked" {{/if}}  onclick="emailed({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="finance[{{$item.bd_id}}][bd_emailed_client]" value="0" {{if $item.bd_emailed_client == 0}} checked="checked" {{/if}}  onclick="emailed({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);" /> NO
  
      {{if $item.bd_emailed_client eq 1 }}
	 <input type="date" name="finance[{{$item.bd_id}}][bd_emailed_client_date]"   id = "emcl{{$item.bd_id}}" value="{{$item.bd_emailed_client_date}}" style="margin-top:4px;" /> 
      <strong>{{$item.bd_emailed_user}}</strong>    
     {{else}}
     <input type="date" name="finance[{{$item.bd_id}}][bd_emailed_client_date]" hidden="true" id = "emcl{{$item.bd_id}}" value="{{$item.bd_emailed_client_date}}" style="margin-top:4px;"  /> 
     {{/if}} 
    </td>
    
    
   {{if $item.bd_posted_client eq 1 }} 
    <td style="text-align:center; background:#F90" id ="pc{{$item.bd_id}}">
  {{else}}
    <td style="text-align:center; background: #F00" id ="pc{{$item.bd_id}}">
  {{/if}}
    
    <input type="radio" name="finance[{{$item.bd_id}}][bd_posted_client]" value="1" {{if $item.bd_posted_client == 1}} checked="checked" {{/if}}  onclick="posted({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="finance[{{$item.bd_id}}][bd_posted_client]" value="0" {{if $item.bd_posted_client == 0}} checked="checked" {{/if}}  onclick="posted({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);" /> NO
  
     {{if $item.bd_posted_client eq 1 }}
	 <input type="date" name="finance[{{$item.bd_id}}][bd_posted_client_date]"   id = "pocl{{$item.bd_id}}" value="{{$item.bd_posted_client_date}}" style="margin-top:4px;" />   
      <strong>{{$item.bd_posted_user}}</strong>  
     {{else}}
     <input type="date" name="finance[{{$item.bd_id}}][bd_posted_client_date]" hidden="true" id = "pocl{{$item.bd_id}}" value="{{$item.bd_posted_client_date}}" style="margin-top:4px;"  /> 
     {{/if}} 
    </td>
    
     
   {{if $item.bd_www eq 1 }} 
    <td style="text-align:center; background:#F90" id ="cw{{$item.bd_id}}">
   {{else}}
    <td style="text-align:center; background: #F00" id ="cw{{$item.bd_id}}">
   {{/if}}
    
    <input type="radio" name="finance[{{$item.bd_id}}][bd_www]" value="1" {{if $item.bd_www == 1}} checked="checked" {{/if}}  onclick="cwww({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="finance[{{$item.bd_id}}][bd_www]" value="0" {{if $item.bd_www == 0}} checked="checked" {{/if}}  onclick="cwww({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);" /> NO
    </td>
 
 
  {{if $item.bd_qed eq 1 }} 
    <td style="text-align:center; background:#F90" id ="qe{{$item.bd_id}}">
   {{else}}
    <td style="text-align:center; background: #F00" id ="qe{{$item.bd_id}}">
   {{/if}}
    
    <input type="radio" name="finance[{{$item.bd_id}}][bd_qed]" value="1" {{if $item.bd_qed == 1}} checked="checked" {{/if}}  onclick="qed({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="finance[{{$item.bd_id}}][bd_qed]" value="0" {{if $item.bd_qed == 0}} checked="checked" {{/if}}  onclick="qed({{$item.bd_bsi_id}},{{$item.bd_id}}, this.value);" /> NO
    </td>   
  
  
  </tr>
  {{/foreach}}
  <tr> <td colspan="10"> <input type="submit" name="update_checklist" value="Update Financial Checklist" /></td> </tr>
  
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(6,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(6,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(6,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(6,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(6,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(6,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(6,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(6,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}
{{if !empty($success_msg)}}
<script>
		parent.hideiFrame('adddocumentsIframe','{{$success_msg}}');
		parent.iframeRequest(6,'');
</script>
<script>
		parent.hideiFrame('intdocumentsIframe','{{$success_msg}}');
		parent.iframeRequest(3,'');
	</script>
    
{{/if}}

{{if !empty($showDocumentsIframe_fin) AND $showDocumentsIframe_fin == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!-------- Show Document iframe ------>
<div id="checkListIframe" >

                    
  <form name="bd" action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bd_bsi_id}}{{/if}}" name="data[bd_bsi_id]" />
    <input type="hidden" value="{{$detail.bd_id}}" name="data[bd_id]" />
    {{if !empty($inrenaldocuments)}}
    <input type="hidden" value="1" name="data[bd_doc_inner]" />
    {{/if}}
    
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      
      <tr>
        <th width="100"> Document Name: </th>
        <td><input type="text" name="data[bd_type]" value="{{$detail.bd_type}}" style="width:550px;" />
       
        </td>
      </tr>
    

      <tr>
        <th> Type Status: </th>
        <td><select name="data[bd_status]" >
        	{{foreach from=$docstatus key="stid" item="statuses"}}
        	  <option value="{{$stid}}" {{if $detail.bd_status == $stid }} selected="selected" {{/if}}>{{$statuses}}</option>
        	{{/foreach}}
          </select>
        </td>
      </tr>
      <tr>
        <th> File Name: </th>
        <td> {{if !empty($detail.bd_doc_name)}} <a href="{{$BASE_URL}}{{$FILE_PATH}}files/business_documents/{{$detail.bd_doc_name}}" target="_blank">{{$detail.bd_doc_name}}</a>
          <input type="hidden" value="{{$detail.bd_doc_name}}" name="data[bd_doc_name]" />
          {{else}}Document must be saved before being displayed.{{/if}}</td>
      </tr>
      <tr>
        <th> Load File: </th>
        <td><input type="file"  name="document" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      <tr>
      <th> Cover Letter Attached </th>
      <td> <input type="radio" name="data[bd_cover_letter]" value="1" {{if $detail.bd_cover_letter == 1}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> Yes </span> 
           <input type="radio" name="data[bd_cover_letter]" value="0" {{if $detail.bd_cover_letter == 0}} checked="checked" {{/if}} /> NO
          &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Attached Date &nbsp;  <input type="text" autocomplete="off"  name="data[bd_cover_letter_date]" value="{{$detail.bd_cover_letter_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo2" maxlength="25" />
       </td>
      </tr>
    
      <tr>
      <th> Emailed To Client</th>
      <td> <input type="radio" name="data[bd_emailed_client]" value="1" {{if $detail.bd_emailed_client == 1}} checked="checked" {{/if}}  /> <span style="padding-top:5px;"> Yes </span> 
           <input type="radio" name="data[bd_emailed_client]" value="0" {{if $detail.bd_emailed_client == 0}} checked="checked" {{/if}}   /> NO
          &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Emailed Date &nbsp;  <input type="text" autocomplete="off"  name="data[bd_emailed_client_date]" value="{{$detail.bd_emailed_client_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo3" maxlength="25" />
       </td>
      </tr>
    
       <tr>
      <th> Posted To Client</th>
      <td> <input type="radio" name="data[bd_posted_client]" value="1" {{if $detail.bd_posted_client == 1}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> Yes </span> 
           <input type="radio" name="data[bd_posted_client]" value="0" {{if $detail.bd_posted_client == 0}} checked="checked" {{/if}}  /> NO
          &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Posted Date &nbsp;  <input type="text" autocomplete="off"  name="data[bd_posted_client_date]" value="{{$detail.bd_posted_client_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" />
       </td>
      </tr>
 
  
       <tr>
      <th> Uploaded To WWW</th>
      <td> <input type="radio" name="data[bd_www]" value="1" {{if $detail.bd_www == 1}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> Yes </span> 
           <input type="radio" name="data[bd_www]" value="0" {{if $detail.bd_www == 0}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> No </span> 
      </td>
      </tr>
    
           <tr>
      <th> Q/ED</th>
      <td> <input type="radio" name="data[bd_qed]" value="1" {{if $detail.bd_qed == 1}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> Yes </span> 
           <input type="radio" name="data[bd_qed]" value="0" {{if $detail.bd_qed == 0}} checked="checked" {{/if}} /> <span style="padding-top:5px;"> No </span> 
      </td>
      </tr>
    
    
     <tr>
  
        <th> <input type="submit" value="Save" name="subDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('adddocumentsIframe_fin','');" />
        </td>
      </tr>
    </table>
  </form>
</div>

{{/if}} 

{{if !empty($print_data_fin)}}

<table cellpadding="0" cellspacing="0" width="100%" id="divfin">
  <tr>
    <th width="9%">Action</th>
    <th width="20%">Document Name</th>
    <th width="6%">File Link</th>
    <th width="8%">When <br /> Uploaded</th>
    <th width="10%">Who Uploaded</th>
    <th width="10%">Cover Letter Attached</th>
    <th width="10%">Emailed to Client</th>
    <th width="10%">Posted to Client</th>
    <th width="9%">Uploaded <br />To WWW</th>
    <th width="8%">Q/ED</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_fin item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistfinancial','{{$item.doc_id}}','','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
     Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>
    </td>


    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	{{ if !empty($item.doc_file_name)}}
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">Link</a></td>
    {{else}}
    <td style="text-align:left;"><a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}')" class="action_checklist" title="{{$item.doc_file_name}}">Link</a></td>
     {{/if}}
    {{else}} <td> </td>
    {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
    <td>
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_cover_letter]" value="1" {{if $item.doc_cover_letter == 1}} checked="checked" {{/if}}  onclick="cover({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_cover_letter]" value="0" {{if $item.doc_cover_letter == 0}} checked="checked" {{/if}}  onclick="cover({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);" /> NO
      {{if $item.doc_cover_letter eq 1 }}
	 <input type="date" name="not_required[{{$item.doc_id}}][doc_cover_letter_date]"   id = "dt{{$item.doc_id}}" value="{{$item.doc_cover_letter_date}}" style="margin-top:4px;" />    
     {{else}}
     <input type="date" name="not_required[{{$item.doc_id}}][doc_cover_letter_date]" hidden="true" id = "dt{{$item.doc_id}}" value="{{$item.doc_cover_letter_date}}" style="margin-top:4px;"  /> 
     {{/if}}
     
    </td>
    <td>
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_emailed_client]" value="1" {{if $item.doc_emailed_client == 1}} checked="checked" {{/if}}  onclick="emailed({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_emailed_client]" value="0" {{if $item.doc_emailed_client == 0}} checked="checked" {{/if}}  onclick="emailed({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);" /> NO
      {{if $item.doc_emailed_client eq 1 }}
	 <input type="date" name="not_required[{{$item.doc_id}}][doc_emailed_client_date]" id = "email_dt{{$item.doc_id}}" value="{{$item.doc_emailed_client_date}}" style="margin-top:4px;" />    
     {{else}}
     <input type="date" name="not_required[{{$item.doc_id}}][doc_emailed_client_date]" hidden="true" id = "email_dt{{$item.doc_id}}" value="{{$item.doc_emailed_client_date}}"  style="margin-top:4px;"/> 
     {{/if}}
    
    </td>
    <td>
    
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_posted_client]" value="1" {{if $item.doc_posted_client == 1}} checked="checked" {{/if}}  onclick="posted({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);"/> <span style="padding-top:5px;"> Yes </span> 
    <input type="radio" name="not_required[{{$item.doc_id}}][doc_posted_client]" value="0" {{if $item.doc_posted_client == 0}} checked="checked" {{/if}}  onclick="posted({{$item.doc_bsn_id}},{{$item.doc_id}}, this.value);" /> NO
      {{if $item.doc_posted_client eq 1 }}
	 <input type="date" name="not_required[{{$item.doc_id}}][doc_posted_client_date]" id = "post_dt{{$item.doc_id}}" value="{{$item.doc_posted_client_date}}" style="margin-top:4px;" />    
     {{else}}
     <input type="date" name="not_required[{{$item.doc_id}}][doc_posted_client_date]" hidden="true" id = "post_dt{{$item.doc_id}}" value="{{$item.doc_posted_client_date}}" style="margin-top:4px;" /> 
     {{/if}}
    
    </td>
    
 
    <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
<td>
<input type="radio" name="not_required[{{$item.doc_id}}][doc_qed]" value="1" {{if $item.doc_qed  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][doc_qed]" value="0" {{if $item.doc_qed == 0}} checked="checked" {{/if}} /> NO 

  


</td>
  </tr>
  {{/foreach}}

  
   <tr> <td colspan="10"><input type="submit" name="not_required_www_update" value="Update Finance Checklist" /></td>
   <!--<td><input type="submit" name="add_doc_mini" value="Add New Document" /></td>-->
  </tr>
  </form>
</table>
{{/if}}

{{if !empty($iframe_msg)}}
<script>
	parent.hideiFrame('checkListIframe_fin','');
	parent.requestDocumentCheckListFinancial();
</script>
{{/if}}


{{if !empty($iframe_msg_pur)}}
<script>
	parent.hideiFrame('purchaseIframe','');
	parent.requestPurchseOrder();
</script>
{{/if}}


{{if !empty($rele)}}
<script>

	//parent.hideiFrame('purchaseIframe','');
	parent.requestPurchseOrder();
</script>
{{/if}}

{{if !empty($iframe_data_fin) AND $iframe_data_fin==1}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe_fin"  >
  <script>
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
    <table cellpadding="0" cellspacing="0" class="table"  >
      <tr>
        <td><strong>Document Name:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_doc_name}}</td>
      </tr>
      <tr>
        <td><strong>File Name:</strong></td>
        <td>{{$doc_data.doc_file_name}}</td>
      </tr>
      <tr>
        <td><strong>Load File:</strong></td>
        <td><input type="file" name="image" id="doc_file_name" />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="991" cellpadding="0" cellspacing="0" style="border:none;">
            <tr>
              <td width="178"><strong>Upload To Dossier:</strong>
                <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
              <td width="246">&nbsp;</td>
              <td width="23" style="padding-left:15px;"></td>
              <td width="195"><strong>Document Not Available:</strong>
                <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
              <td width="347">&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Date Uploaded:</strong></td>
              <td>{{$doc_data.doc_date_uploaded}}</td>
              <td style="padding-left:15px;"></td>
              <td><strong>Loaded By:</strong></td>
              <td>{{$doc_data.user_name}}</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><strong>Note:</strong></td>
        <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('checkListIframe_fin');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}



{{if !empty($show_quote)}}
<style>
.pur  {
    border:0px solid #FF0000;    
    border-collapse:collapse;
	
}

.pur  th {
    border:1px solid #C1DAD7;    
    border-collapse:collapse;
    text-align:center !important;
	font-weight: bold;
	font-size:12px;
	height:32px;
	font: "Trebuchet MS", Verdana, Arial, Helvetica;
	background-color:#CCCCCC;
}
.pur td {
    border:1px solid #C1DAD7 !important;
    border-collapse:collapse;
	font-weight:normal;
	font-size:12px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	
}

</style>
<div style="float:left;">
&nbsp; <strong> Procedure Link</strong> : <a href = "{{$proc_link}}" target="_blank">{{$proc_link}}</a>  <br><br />
<input type="button" name="CreatePurchaseOrder" value="Show Non Relevant" onclick="requestPurchseOrder('add','NR');" />
<input type="button" name="CreatePurchaseOrder" value="Show Accepted Items" onclick="requestPurchseOrder('add','AI');" />
<input type="button" name="CreatePurchaseOrder" value="Show Pending Items" onclick="requestPurchseOrder('add','PI');" />
<!--&nbsp; &nbsp; Process Street Link : <a href = "https://app.process.st/workflows/GCONS-User-Guide-Quote-Purchase-Order-System-n7U3GkZAR9Bn8x6OMwhPCQ/view" target="_blank">
Click here to open link </a>-->
</div>
<table cellpadding="0" cellspacing="0" width="100%" class="pur" >
  <tr >
 <!--   <th width="5%">Action</th>-->
    <th width="8%">Relevant</th>
    <th width="10%">Component</th>
    <th width="10%">Quote </th>
    <th width="10%">Type</th>

    <th width="10%">Supplier</th>
    <th width="10%">Value ($)</th>
    <th width="9%">Purchase Order</th>
    <th width="11%">Quote Accepted</th>
    <th width="6%">Action</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data item=item key=key}}
 
   <tr>
 
    <td style="text-align:left;">
     <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="hide[{{$item.po_id}}]" value="1" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.po_id}}]" value="0"  onclick="this.form.submit();" {{if $item.po_relevant eq 0 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
      </form>  
    </td>
    <td style="padding-left:5px;">{{$item.pc_name}}</td>
    <td style="text-align:left;">

 {{if $item.po_quote1}}  <a href = "{{$BASE_URL}}{{$FILE_PATH}}files/purchase_order_quote/{{$item.po_quote1}}" target="_blank">View Quote</a> {{/if}} </td>


    <td> {{$item.po_type}}</td>
    <td style="text-align:center;">{{$item.po_supplier1}}</td>
    <td style="text-align:center;">{{$item.po_value1}}</td>
    <td style="text-align:left;">{{ if $item.po_quote_accepted}}<a href="javascript:modelwindow('{{$BASE_URL}}business.quote_detail/bus_id/{{$item.po_bsn_id}}/poid/{{$item.po_id}}','90%','90%', 'yes');">Show Detail</a>{{/if}} </td>
    <td style="text-align:center;"> 
      <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="accepted[{{$item.po_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="accepted[{{$item.po_id}}]" value="1"  onclick="this.form.submit();" {{if $item.po_quote_accepted eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
      </form>
      {{if $item.po_quote_accepted eq 1}} {{$item.po_acceptance_date}} <br /> By : {{$item.po_user_name}} {{/if}}
      
    </td>
    <td style="text-align:center;">
     <a href="javascript:modelwindow('{{$BASE_URL}}business.accept_quote/bus_id/{{$item.po_bsn_id}}/poid/{{$item.po_id}}/qid/1','90%','90%', 'yes');"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
     
     <a href="javascript:parent.requestQuoteDelete({{$item.po_id}},1);" onclick="javascript:if(!confirm('Are you sure you want to delete quote?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
    </td>
  </tr>
  {{/foreach}}

<!---------------Start Adding Custom Component ------------------------->
{{foreach from=$print_data_custom item=item key=key}}
 
   <tr>
 

    <td style="text-align:left;">
     <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="hide_custom[{{$item.po_id}}]" value="1" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide_custom[{{$item.po_id}}]" value="0"  onclick="this.form.submit();" {{if $item.po_relevant eq 0 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
      </form>  
    </td>
    <td style="padding-left:5px;">{{$item.po_component_name }}</td>
    <td style="text-align:left;">

{{if $item.po_quote1}}  <a href = "{{$BASE_URL}}{{$FILE_PATH}}files/purchase_order_quote/{{$item.po_quote1}}" target="_blank">View Quote</a> {{/if}}
</td>
   
   
   <td>{{$item.po_type}} </td>

    <td style="text-align:center;">{{$item.po_supplier1}}</td>
    <td style="text-align:center;">{{$item.po_value1}}</td>
    <td style="text-align:left;">{{ if $item.po_quote_accepted}}<a href="javascript:modelwindow('{{$BASE_URL}}business.quote_detail_custom/bus_id/{{$item.po_bsn_id}}/poid/{{$item.po_id}}','90%','90%', 'yes');">Show Detail</a>{{/if}} </td>
    <td style="text-align:center;">
    <form name ="recmet5" method="post" action="">
     	<input type="hidden" name="accepted_c[{{$item.po_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="accepted_c[{{$item.po_id}}]" value="1"  onclick="this.form.submit();" {{if $item.po_quote_accepted eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
      </form>
       {{if $item.po_quote_accepted eq 1}} {{$item.po_acceptance_date}} <br /> By : {{$item.po_user_name}} {{/if}}
    </td>
    
  
    <td style="text-align:center;">
     <a href="javascript:modelwindow('{{$BASE_URL}}business.accept_quote_custom/bus_id/{{$item.po_bsn_id}}/poid/{{$item.po_id}}/qid/1','90%','90%', 'yes');"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
  <a href="javascript:parent.requestQuoteDelete({{$item.po_id}},2);" onclick="javascript:if(!confirm('Are you sure you want to delete the Alert?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>  
    </td>
  </tr>
  {{/foreach}}


<!---------------End Adding Custom Component ------------------------->


  </form>
</table>
{{/if}}



{{if !empty($iframe_data_pur) AND $iframe_data_pur==1}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="purchaseIframe"  >
  <script>
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="doc[po_id]" value="{{$doc_data.po_id}}" />
    <!-- <input type="hidden" name="doc[doc_id]" value="1000" />-->
    <table cellpadding="5" cellspacing="5" style="font-size:12px;"  >
      <tr>
        <td><strong>Component Name:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.pc_name}}</td>
      </tr>
      
      <tr>
        <td><strong>Upload Quote 1:</strong></td>
        <td><input type="file" name="quote1" id="doc_file_name" />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} 
          
          </td>
      </tr>
      
      <tr>
        <td><strong>Upload Quote 2:</strong></td>
        <td><input type="file" name="quote2" />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} 
          
          </td>
      </tr>
      
      <tr>
        <td><strong>Upload Quote 3:</strong></td>
        <td><input type="file" name="quote3"  />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} 
          
          </td>
      </tr>
      
      <!--<tr>
      <td><strong>Selected Supplier</strong> </td>
      <td> <input type="text" name="doc[po_supplier]" value="{{$doc_data.po_supplier}}"  style="width:300px;"/> </td>
      <tr>-->
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe_pur" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('purchaseIframe');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}


