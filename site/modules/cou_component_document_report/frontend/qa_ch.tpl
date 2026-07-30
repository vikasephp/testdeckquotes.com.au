<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">


	function add_new(url) {
		//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
		var viewurl = url;
		$(document).ready(function () {
			$.fancybox({
				'width': '99%',
				'height': '99%',
				'autoScale': false,
				'transitionIn': 'elastic',
				'transitionOut': 'elastic',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'overlayColor': '#000',
				'hideOnOverlayClick': false,
				'hideOnContentClick': false,
				'type': 'iframe',
				'href': viewurl,
				'scrolling': 'yes'

			});
		});
	}


</script>


<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />Q/A</h3>

	<div style="float:left; margin-bottom:10px; font-size:14px;">
		<strong>Project Address : {{$proj_name}}</strong>
	</div>

	<form name="detail" method="post" action="" enctype="multipart/form-data">

		<table id="list-table" width="99%">

			<tr>
				<td style="width:40%">Building Approval</td>
				<td>
					<select name="ba_appro[doc_not_required]">
						<option value="0" {{if $detail232.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail232.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Commencement Notice</td>
				<td>
					<select name="com_notice[doc_not_required]">
						<option value="0" {{if $detail235.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail235.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">BA stamped plans</td>
				<td>
					<select name="ba_stamp[doc_not_required]">
						<option value="0" {{if $detail231.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail231.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Latest Merged Plans</td>
				<td>
					<select name="lmp[doc_not_required]">
						<option value="0" {{if $detail491.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail491.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">COU Requirements</td>
				<td>
					<select name="detail655[doc_not_required]">
						<option value="0" {{if $detail655.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail655.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Customer Walkthrough</td>
				<td>
					<select name="cuwal[doc_not_required]">
						<option value="0" {{if $detail172.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail172.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Inspections Records</td>
				<td>
					<select name="detail169[doc_not_required]">
						<option value="0" {{if $detail169.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail169.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Icon Water Condition</td>
				<td>
					<select name="detail627[doc_not_required]">
						<option value="0" {{if $detail627.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail627.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Tree Protection Condition</td>
				<td>
					<select name="detail382[doc_not_required]">
						<option value="0" {{if $detail382.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail382.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Driveway</td>
				<td>
					<select name="detail272[doc_not_required]">
						<option value="0" {{if $detail272.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail272.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<!--<tr>
				<td>Final Building Certifier Inspection Record</td>
				<td>
					<select name="fbcir[doc_not_required]">
						<option value="0" {{if $detail169.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail169.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Building Certifier Pre-Sheet Inspection Record</td>
				<td>
					<select name="bcpsir[doc_not_required]">
						<option value="0" {{if $detail152.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail152.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>-->
			
			<tr>
				<td style="width:40%">Pier Inspection Certificate</td>
				<td>
					<select name="detail653[doc_not_required]">
						<option value="0" {{if $detail653.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail653.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Survey ID Document</td>
				<td>
					<select name="siddoc[doc_not_required]">
						<option value="0" {{if $detail261.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail261.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Termite protection Certificate - Penetrations</td>
				<td>
					<select name="tpc_pene[doc_not_required]">
						<option value="0" {{if $detail155.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail155.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Termite Protection Certificate - Perimeter </td>
				<td>
					<select name="tpc_peri[doc_not_required]">
						<option value="0" {{if $detail295.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail295.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>


			<tr>
				<td>Glazing Certificate - Shower Screens</td>
				<td>
					<select name="gc_ss[doc_not_required]">
						<option value="0" {{if $detail413.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail413.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Glazing Certificate - Windows</td>
				<td>
					<select name="gc_win[doc_not_required]">
						<option value="0" {{if $detail156.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail156.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Glazing Certificate - Glass Wardrobe Doors</td>
				<td>
					<select name="detail735[doc_not_required]">
						<option value="0" {{if $detail735.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail735.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Glazing Certificate - Glass Mirror & Splashback</td>
				<td>
					<select name="detail736[doc_not_required]">
						<option value="0" {{if $detail736.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail736.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Glazing Certificate - Skylight</td>
				<td>
					<select name="detail737[doc_not_required]">
						<option value="0" {{if $detail737.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail737.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Glazing Certificate - Glass Balustrade</td>
				<td>
					<select name="detail738[doc_not_required]">
						<option value="0" {{if $detail738.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail738.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Wall and Roof Frames Detail Plans</td>
				<td>
					<select name="wwfdp[doc_not_required]">
						<option value="0" {{if $detail289.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail289.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Framing Installation Certificate - Signed by Builder</td>
				<td>
					<select name="detail678[doc_not_required]">
						<option value="0" {{if $detail678.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail678.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Insulation Certificate</td>
				<td>
					<select name="inccer[doc_not_required]">
						<option value="0" {{if $detail162.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail162.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Insulation Installation Certificate - Signed by builder</td>
				<td>
					<select name="detail679[doc_not_required]">
						<option value="0" {{if $detail679.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail679.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Under Slab Insulation Certificate</td>
				<td>
					<select name="detail795[doc_not_required]">
						<option value="0" {{if $detail795.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail795.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Waterproofing Certificate</td>
				<td><select name="watcer[doc_not_required]">
						<option value="0" {{if $detail163.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail163.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Smoke Alarm Certificate</td>
				<td>
					<select name="sacer[doc_not_required]">
						<option value="0" {{if $detail296.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail296.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Condensation Management Roof Ventilation Installation Certificate</td>
				<td>
					<select name="detail788[doc_not_required]">
						<option value="0" {{if $detail788.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail788.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Slip Resistance Certificate - Interior Stairs</td>
				<td>
					<select name="detail713[doc_not_required]">
						<option value="0" {{if $detail713.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail713.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Slip Resistance Certificate - Exterior Stairs and Landing</td>
				<td>
					<select name="detail714[doc_not_required]">
						<option value="0" {{if $detail714.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail714.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Fire Rated Certificate</td>
				<td>
					<select name="detail739[doc_not_required]">
						<option value="0" {{if $detail739.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail739.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Fireplace Installation Certificate</td>
				<td>
					<select name="detail777[doc_not_required]">
						<option value="0" {{if $detail777.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail777.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Application of certificate of occupancy - signed by customer</td>
				<td>
					<select name="detail274[doc_not_required]">
						<option value="0" {{if $detail274.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail274.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Certificate of Electrical Safety Electrician</td>
				<td>
					<select name="coese[doc_not_required]">
						<option value="0" {{if $detail294.doc_not_required eq 0 }} selected="selected" {{/if}}>Required </option>
						<option value="1" {{if $detail294.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Certificate of Electrical Safety Air Conditioning</td>
				<td>
					<select name="coesac[doc_not_required]">
						<option value="0" {{if $detail167.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail167.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Asbestos Clearance Certificate</td>
				<td>
					<select name="detail318[doc_not_required]">
						<option value="0" {{if $detail318.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail318.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<!--<tr>
				<td>Application of certificate of occupancy signed by customer</td>
				<td>
					<select name="aocoosbc[doc_not_required]">
						<option value="0" {{if $detail274.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail274.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>-->

			<tr>
				<td>Box Gutter Certificate</td>
				<td>
					<select name="boxgutter[doc_not_required]">
						<option value="0" {{if $detail626.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail626.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>Final Plumbing Certificate</td>
				<td>
					<select name="plumbing[doc_not_required]">
						<option value="0" {{if $detail749.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail749.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Post-Construction Dilapidation Report</td>
				<td>
					<select name="detail691[doc_not_required]">
						<option value="0" {{if $detail691.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail691.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Driveway/Verge Crossing Formwork Inspection Report</td>
				<td>
					<select name="detail783[doc_not_required]">
						<option value="0" {{if $detail783.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail783.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Amended Development Approval</td>
				<td>
					<select name="detail657[doc_not_required]">
						<option value="0" {{if $detail657.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail657.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Building Approval Amendment Authorisation</td>
				<td>
					<select name="detail637[doc_not_required]">
						<option value="0" {{if $detail637.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail637.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width:40%">Amended Drainage Plan</td>
				<td>
					<select name="detail149[doc_not_required]">
						<option value="0" {{if $detail149.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
						<option value="1" {{if $detail149.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
					</select>
				</td>
			</tr>

			<tr>
				<td><input type="checkbox" name="checkbox" value="check" /> : I confirm the QA for all the fields has been completed </td>
				<td> </td>
			</tr>
		</table>
		<br />
		<br />
		<input type="submit" name="savedrop" value="submit" onclick="if(!this.form.checkbox.checked){alert('Please confirm the QA is complete before saving.');return false}" />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>

	<!--    <form method="POST" action="http://www.cs.tut.fi/cgi-bin/run/~jkorpela/echo.cgi">
 <input type="checkbox" name="checkbox" value="check"  />
 <input type="submit" name="email_submit" value="submit" onclick="if(!this.form.checkbox.checked){alert('You must agree to the terms first.');return false}"  />
</form>-->


	<script type="text/javascript">


		function closepop() {
			setTimeout('parent.close_win();', 500);
		}



	</script>

	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");

	</script>
</div>

<script>
	initSample();
</script>