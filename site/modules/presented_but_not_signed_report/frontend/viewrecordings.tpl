<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="z-index:999999999;">
<h3 class="page-title">View Recordings</h3><br />

            
<table id="list-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;border-collapse:collapse;"">
 <tr>
            <th width="10%">Date of Meeting</th>
          
            <th width="15%">Attendees</th>
            <th width="10%">Detail</th>
            <th width="10%">Download Notes</th>
            <th width="10%">File Link</th>
            <th width="10%">Type</th>
   
 </tr>  
{{foreach from=$detail key="key" item="item"}}
   <tr>
   <td>{{$item.rm_date}}</td>
   <td>{{$item.rm_owner}}</td>
     
  <td>{{$item.rm_detail}} </td>
  <td>{{if $item.rm_scribed_file}}
         
    <a href = "{{$BASE_URL}}files/recorded_meetings/{{$item.rm_scribed_file}}" target="_blank"><img src="{{$BASE_URL}}images/download.png"  /></a> 
    {{else}}
    No File
    {{/if}}</td>
    
    <td>{{if $item.rm_file_location}} <a href="{{$item.rm_file_location}}" target="_blank">Link</a>{{/if}} </td>
    <td> {{$item.rm_type}} </td>
   </tr>
 {{/foreach}}
   
 </table>  
  <br />
      <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
 