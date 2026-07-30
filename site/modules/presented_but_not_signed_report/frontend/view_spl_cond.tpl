<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="z-index:999999999;">
<h3 class="page-title">View Special Conditions</h3><br />

   <table cellpadding="5" cellspacing="0" width="100%" id="divtruelog" >

  <tr>

    <th width="20%">Document Name</th>
    <th width="10%">When Uploaded</th>
    <th width="14%">Who Uploaded</th>
    <th width="15%">Word Doc</th>
    <th width="15%">PDF Doc</th>
    <th width="10%">Status</th>
  </tr>

  {{foreach from=$special_data item=item key=key}}
  <tr>
   
      
    <td style="text-align:left;">{{$item.sp_doc_name}}</td>
    <td style="text-align:left;">{{$item.sp_date}}</td>
    <td style="text-align:left;">{{$item.sp_who}}</td>
    <td style="text-align:center;">
  
  <a href="/presented_but_not_signed_report.download_content_sc?file_name={{$item.sp_word}}&module_name=presented_but_not_signed_report.home" title="{{$item.sp_word}}" class="action_small" target="_blank">{{$item.sp_word|truncate:"30"}}</a>
    
    </td>
    
     <td style="text-align:center;">

  
    <a href="/presented_but_not_signed_report.download_content_sc?file_name={{$item.sp_pdf}}&module_name=presented_but_not_signed_report.home" title="{{$item.sp_pdf}}" class="action_small" target="_blank">{{$item.sp_pdf|truncate:"30"}}</a>   
     
     </td>
    <td style="text-align:center;">{{$item.sp_status}}</td>
     
  </tr>
  {{/foreach}}
</table>
         
  
  <br />
      <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
 