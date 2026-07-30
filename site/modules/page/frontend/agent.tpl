<div align="center" >
  <table cellpadding="0" cellspacing="0" id="agent_ltable" width="330" bgcolor="#f4f4f4">
  {{if $support}}
  <tr><td colspan="2"><h3>Support Agent</h3></td></tr>
  <tr><td width="50">Phone:</td><th><div>Mob:&nbsp;{{$detail.adv_mobile}}</div><div>Office:&nbsp;{{$detail.adv_office}}</div></th></tr>
  <tr><td style="padding:10px;height:40px;">
  Email:&nbsp;</td><th><div>{{$detail.adv_contact_name1}}</div></th></tr>
  {{else}}
    <tr>
      <td style="padding:10px;height:100px;">
     <!-- {{$detail.page_body}} -->
     <h3>Support Agent Detail</h3>
      </td>
     </tr>
     {{/if}}
    </table>
 </div>