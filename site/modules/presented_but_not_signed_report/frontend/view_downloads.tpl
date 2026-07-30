<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="z-index:999999999;">
<h3 class="page-title">View Special Conditions</h3><br />

   <table cellpadding="5" cellspacing="0" width="100%" id="divtruelog" >

  <tr>

    <th width="10%">Document Id</th>
    <th width="80%">Document Link</th>

  </tr>

  {{foreach from=$doc_data item=item key=key}}
  <tr>
   
      
    <td style="text-align:left;">{{$item.doc_name_id}}</td>
    <td style="text-align:left;">
    {{if !empty($item.doc_file_name)}} 
    
     <a href = "/presented_but_not_signed_report.download_content?file_name={{$item.doc_file_name}}&module_name=presented_but_not_signed_report.home" target="_blank">{{$item.doc_file_name}}</a>
    
    {{else}} Document Not uploaded{{/if}}</td>

     
  </tr>
  {{/foreach}}
</table>
         
  
  <br />
      <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
 