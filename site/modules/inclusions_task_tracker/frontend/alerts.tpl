<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>


<div align="center" style="padding-top:30px;">
<h3 class="page-title">{{$title}}</h3><br />


 {{assign var=countn value=  1}}          
  <table id="doclist-table"  width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>  <th>SrNo </th> <th>Created Date</th> <th>User Name</th> <th>Alert Text </th>  </tr>
   {{foreach from=$alertData key="key" item="item"}}
   <tr>
   
   <td> {{$countn}}</td>
   <td> {{$item.be_created_date}}</td>
   <td> {{$item.user_name}}</td>
   <td>{{$item.be_alert_text}} </td>
   </tr>
   {{assign var=countn value=$countn+1}}
   {{/foreach}}
   
    </table> 
  	<div style="padding-top:20px;">
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
      </div>
  </div> 