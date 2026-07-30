<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<table width="100%" id="viewbus-table" style="background-color:#FFFFFF;">
	<tr>
		<td colspan="4" width="100%">
			<table cellpadding="0" cellspacing="0" border="0" width="22%">
				<tr>
					<th align="left" width="50">
						<a href="javascript:parent.openedit('{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$bsn_id}}');"
							title="Edit">
							<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
					</th>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="width: 50%; vertical-align: top;">
			<div>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">Status:</strong> {{$bsnStatus}}
				</p>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">Project Name:</strong> {{$detail.bsn_name}}
				</p>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">Address:</strong> {{$detail.bsn_address}}
				</p>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">Suburb:</strong> {{$detail.bsn_suburb}}
				</p>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">State:</strong> {{$detail.bsn_state}}
				</p>
				<p style="margin-bottom: 5px;">
					<strong style="width: 200px; text-align: right; display: inline-block;">Post Code:</strong> {{$detail.bsn_pcode}}
				</p>
			</div>
		</td>
		<td style="width: 50%; vertical-align: top;">
			<div>
				{{ foreach from=$detail1 key="key" item="item" }}
					<h3 style="margin-bottom: 5px; text-align: center; font-size: 20px; font-weight: bold;">Customer {{ counter }}</h3>
					<p style="margin-bottom: 5px;">
						<strong style="width: 200px; text-align: right; display: inline-block;">Customer Name:</strong> {{$item.bcust_fname}} {{$item.bcust_lname}}
					</p>
					<p style="margin-bottom: 5px;">
						<strong style="width: 200px; text-align: right; display: inline-block;">Customer Email:</strong> {{$item.bcust_misc_email1}}
					</p>
					<p style="margin-bottom: 10px;">
						<strong style="width: 200px; text-align: right; display: inline-block;">Customer Mobile No.:</strong> {{$item.bcust_misc_moble}}
					</p>
				{{ /foreach }}
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="4"> <input type="button" value="Close" onclick="parent.$.fancybox.close();" /> </td>
	</tr>

	<tr>
		<td colspan="4"> <input type="checkbox" /> Out of date listings</td>
	</tr>
	<tr>
		<td colspan="4"> <input type="button" value="Search" /></td>
	</tr>

</table>