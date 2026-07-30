<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
	html {
		scroll-behavior: smooth;
	}
	#menuTable, .clipboard_call, #searchInput, #clearSearchBtn {
		display: none;
	}
	a {
		text-decoration: none;
	}
	p, h1, h2, h3, h4, h5, h6, ol, ul {
		text-align: left;
		margin-top: 0;
	}
	h1, h2, h3, h4, h5, h6 {
		margin-bottom: .5rem;
		font-weight: 500;
		line-height: 1.2;
	}
	p, ol, ul {
		margin-bottom: 1rem;
	}
	ol, ul {
		padding-left: 2rem;
	}
	ul {
		list-style: disc;
	}
	ol {
		list-style: decimal;
	}
	table {
		caption-side: bottom;
		border-collapse: collapse;
	}
	
	.align-items-start {
  		align-items: flex-start !important;
	}
	.bg-light-blue {
		background: #e8ebf3;
	}
	.bg-navy {
		background: #163c6d;
	}
	.border-b-0 {
		border-top: none !important;
	}
	.border-t-0 {
		border-top: none !important;
	}
	.border-x-0 {
		border-left: none !important;
		border-right: none !important;
	}
	
	.d-flex {
		display: flex;
	}
	.flex-column {
		flex-direction: column;
	}
	.flex-row {
		flex-direction: row;
	}
	.fs-20 {
		font-size: 20px;		
	}
	.fs-24 {
		font-size: 24px;		
	}
	.fw-bold {
		font-weight: bold;
	}
	.gap-3 {
		gap: 1rem !important;
	}
	.gap-4 {
		gap: 1.5rem !important;
	}
	.m-0 {
		margin: 0;
	}
	.position-sticky {
		position: -webkit-sticky !important;
		position: sticky !important;
	}
	.p-4 {
		padding: 1.5rem !important;
	}
	.py-5 {
		padding-top: 3rem !important;
		padding-bottom: 3rem !important;
	}
	.table {
		width: 100%;
	}
	.table > :not(caption) > * > * {
		padding: .5rem .5rem;
		padding-top: 0.5rem;
		padding-right: 0.5rem;
		padding-bottom: 0.5rem;
		padding-left: 0.5rem;
		text-align: left;
		border: 1px solid rgb(222, 226, 230);
		border-collapse: collapse;
	}
	.text-center {
		text-align: center !important;
	}
	.text-end {
		text-align: right !important;
	}
	.text-muted {
		color: #6c757d;
	}
	.text-navy {
		color: #163c6d;
	}
	.text-start {
		text-align: left !important;
	}
	.text-white {
		color: #fff;
	}
	.top-0 {
		top: 0;
	}
	.top-4 {
		top: 1.5rem !important;
	}
	.w-50 {
		width: 50% !important;
	}
	.z-10 {
		z-index: 10;
	}
	
</style>

<!-- <section style="width: 100%; height: 100%; margin: 0; padding: 0;">
	<iframe src="https://domaindatahub.com" style="width: 100%; height: 100%; margin: 0; padding: 0; border: none; box-shadow: none;"></iframe>
</section> -->

<div class="d-flex flex-column gap-4 p-4 py-5">
    <section id="header" class="py-4">
		<!-- <h2 class="fs-24 text-navy text-start fw-bold">Actioning New Customer Enquiry - Task UID 204 - Procedure</h2> -->
		<table class="table">
			<tr>
				<td class="text-start border-x-0 border-t-0">
					<span class="text-muted">Procedure ID:</span> <span class="text-dark">PROC-001</span>
				</td>
				<td class="text-end border-x-0 border-t-0"></td>
			</tr>
			<tr>
				<td class="text-start text-navy fs-24 fw-bold border-x-0">Actioning New Customer Enquiry - Task UID 204 - Procedure</td>
				<td class="text-end border-x-0">Linked Tasks: <span style="color: green;">&check;</span> <span style="color: green;">&check;</span></td>
			</tr>
			<tr>
				<td class="text-start border-x-0">Owner: Sales Operations</td>
				<td class="text-end border-x-0">Last Updated: 2026-02-09</td>
			</tr>
		</table>
	</section>
    <section id="body">
		<div class="d-flex flex-row gap-3 align-items-start">
			<div id="content-section" class="position-sticky top-4 z-10">
				<table class="table" style="width: 300px;">
					<tr>
						<th class="bg-navy text-white">Table of Contents</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-1" class="text-navy">Result – who – who for – writing style – task or process – business stream?</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-2" class="text-navy">Who created it and when was it last updated and what format?</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-3" class="text-navy">What pre-requisite skills and systems are required</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-4" class="text-navy">Step 1: Identifying New Customer Enquiries</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-5" class="text-navy">Step 2: How to Add Customer and project in GCON</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-6" class="text-navy">Step 3: When Book the First Contact Appointment</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-7" class="text-navy">Step 4: Sending initial emails to Customer</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7a" class="text-navy">1. When to send MS10 – Missing Customer Details</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7b" class="text-navy">2. When to Send MS 11 – What do you want to Achieve?</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7c" class="text-navy">3. When to Send MS 12.1 – Survey Text Remainder Email</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7d" class="text-navy">4. When to Send MS 600 – Text CGFB Username and Logon Email</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7e" class="text-navy">5. When to send MS17 - Friday Enquiry Template</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7f" class="text-navy">6. When to send - (MS-0335) - Unable to Create a Free Planning Assessment Report</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue" style="padding-left: 1.5rem;">
							<a href="#section-7g" class="text-navy">7. When to send - (MS-0426) - Interstate Customer Email</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-8" class="text-navy">Step 5: Adding sales notes in Sales Follow Up section</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-9" class="text-navy">Step 6: If a Customer Re-Enquiry</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-10" class="text-navy">Question and Answer component</a>
						</th>
					</tr>
					<tr>
						<th class="bg-light-blue">
							<a href="#section-11" class="text-navy">Improvement Suggestion</a>
						</th>
					</tr>
				</table>
			</div>
			<div id="body-section" style="width: 100%;">

				<div id="section-1" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Result – who – who for – writing style – task or process – business stream?</h3>
					<table class="table" style="width:100%; border:1px solid #ccc; border-collapse:collapse;">
						<tr>
							<td style="width:220px; font-weight:bold; background:#f5f5f5;">Procedure Result Statement:</td>
							<td>The objective of this procedure is to identify new customer enquiries for CGFB and FPE and adding them in Database GCON</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">Who was the procedure written for &amp; writing style</td>
							<td>
								The procedure has been created for everyone within the Turnkey business and the writing style is easy to understand as its written for people of all culture backgrounds.<br><br>
								This includes people for which English is not a first language and people with varying skills.
							</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">Task or process type</td>
							<td>This procedure is linked to a project related to task UID 204</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">Business stream</td>
							<td>Sales</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">Primary Position appointed to complete this task</td>
							<td>Support Sales Initial</td>
						</tr>
					</table>
				</div>

				<hr>

				<div id="section-2" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Who created it and when was it last updated and what format?</h3>
					<table class="table" style="width:100%; border:1px solid #ccc; border-collapse:collapse;">
						<tr>
							<td style="width:250px; font-weight:bold; background:#f5f5f5;">Who is the original creator of this procedure</td>
							<td>Frank Walmsley – <a href="mailto:clientservices@cgfb.com.au">clientservices@cgfb.com.au</a><br>07/09/2016</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">Who last updated the procedure and when</td>
							<td>Saurabh – <a href="mailto:Supportsales@cgfb.com.au">Supportsales@cgfb.com.au</a><br>10/03/2025</td>
						</tr>
					</table>
				</div>

				<hr>

				<div id="section-3" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">What pre-requisite skills and systems are required</h3>
					<table class="table" style="width:100%; border:1px solid #ccc; border-collapse:collapse;">
						<tr>
							<td style="width:250px; font-weight:bold; background:#f5f5f5;">What systems will you need access to be able to complete the task or process</td>
							<td>
								<ul>
									<li>Internet</li>
									<li>Email</li>
									<li>All homes website</li>
									<li>GCONS</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td style="font-weight:bold; background:#f5f5f5;">What skills will you need to have to be able to successfully complete the procedure</td>
							<td>Determination</td>
						</tr>
					</table>
				</div>

				<hr>

				<div id="section-4" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 1: Identifying New Customer Enquiries</h3>
					<p>Check the folders - "Inbox", "Phone Log" and "Junk Emails" folders in <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a> for New <strong>Customer Enquiry Emails</strong></p>
					<p style="color:red;"><strong>If in enquiry form that customer has filed has the notes that is important for CGFB staff for future use, then add that notes as Sales notes in Sales Follow Up section of project profile in GCON after adding the project.</strong></p>
					<p><strong>New Customer Enquiry Emails</strong> are emails that contain information regarding a new customer. These may come from one of five sources: Internal Email from Staff, Office HQ, Website Enquiry Form Email, Live Chat messages, Facebook leads, Google Leads or Direct Email.</p>
					<ol>
						<li><strong>Internal Staff Email</strong> – When received in <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a> or <a href="mailto:supportsales@cgfb.com.au">supportsales@cgfb.com.au</a>, must be processed as a New Customer Enquiry.</li>
						<li><strong>Office HQ Email</strong> – When an email is received from OfficeHQ in <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a>, it might be actioned as a New Customer Enquiry where a Phone Number, Address, and/or Email has been provided.</li>
						<li><strong>Website Enquiry Form Email</strong> – When an email is received from <a href="http://www.cgfb.com.au">www.cgfb.com.au</a> website, this email must be actioned as a New Customer Enquiry.</li>
						<li><strong>Direct Email</strong> – When a Direct Email is received in <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a> from a Customer, it must be actioned as a New Customer Enquiry.</li>
						<li><strong>Live Chat Emails</strong> – When Live Chat email received asking for information regarding Granny Flat or extension, it must be actioned as New Customer Enquiry.</li>
						<li><strong>Facebook Leads (Owen Walter)</strong> – New enquiries also received in Facebook. These enquiries come from Owen Walter (<a href="mailto:owen@oculodigital.com">owen@oculodigital.com</a>).</li>
						<li><strong>Google Leads</strong> – New enquiries also received in Google account. These come from <strong>Google Lead Form Submission &lt;<a href="mailto:grannyflatbuildersaustralia@gmail.com">grannyflatbuildersaustralia@gmail.com</a>&gt;</strong>.</li>
						<li><strong>Website emails received in Junk Email folder</strong> – Support needs to check Junk Email folder daily for any Website enquiries. Also check Website Admin panel &gt; REPORTS &gt; Form Submissions Record for new enquiries not received in email for last 7 days.</li>
					</ol>
					<p style="color:red;"><strong>Note:</strong> Sometimes client sends House plans/other documents along with enquiry email. Support needs to rename these documents and upload in Document Checklist. Follow procedure <strong>DID 363 - GCON User Manual – Procedure</strong>, Step 4: How to Upload a Document into the Document Checklist.</p>
				</div>

				<hr>

				<div id="section-5" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 2: How to Add Customer and project in GCON</h3>
					<p>Support will complete this procedure once they have identified a customer to add to GCON. Both the Customer Profile and Customer Project profile must be created in GCON. Follow procedure:</p>
					<p><a href="https://cgfb.sharepoint.com/:w:/s/TemplateMasterList-GCONS/EYgtxIP4dxJDpgO2Zt0G-u8BQIQFgfBMc0PYMsAA5mwGbQ?e=3DPKsp" target="_blank"><strong>DID 333 - Add New Customer in GCON – Procedure</strong></a></p>
					<p style="color:red;"><strong><u>Always Place Female First Rule:</u></strong><br>
					While creating customer profile, if a project has 2 customers, then make sure to write Female name first in GCON. This should be applied for all project documents, emails, appointments, etc.<br><br>
					Eg, Ulrike Mathesius and Ron Henry - 80 Onkaparinga Crescent, Kaleen ACT 2617</p>
				</div>

				<hr>

				<div id="section-6" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 3: When Book the First Contact Appointment</h3>
					<p>When a customer is added to GCON, we need to create and save First Contact Appointment for next day in <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a> Calendar and these appointments start from 9:00 AM onwards. Each appointment is of half an hour. We don't book First contact appointment on Saturday and Sunday.</p>
					<p style="color:red;"><strong>Note:</strong> While creating customer profile, if a project has 2 customers then make sure to write Female name first in GCON. This should be applied for all project documents, emails, appointments, etc.</p>
				</div>

				<hr>

				<div id="section-7" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 4: Sending initial emails to Customer</h3>
					<p>After adding Customer and Project in GCON, support needs to send initial emails to Customer as per information provided.</p>
					<p style="color:red;"><strong>Note:</strong> While creating customer profile, if a project has 2 customers then make sure to write Female name first in GCON. This should be applied for all project documents, emails, appointments, etc.</p>

					<div id="section-7a" class="py-5">
						<h4 class="text-navy">1. When to send MS10 – Missing Customer Details</h4>
						<p>If any of "Address" or "Contact Number" details are missing, customize and send the "MS 10 - Missing Customer Details" email to the customer's email address and Cced to <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a>.</p>
						<p><em style="color:red;">(Note: if we received survey for the customer, no need to send MS 10)</em></p>
					</div>

					<div id="section-7b" class="py-5">
						<h4 class="text-navy">2. When to Send MS 11 – What do you want to Achieve?</h4>
						<p>When a customer is added to GCON, support will need to send the email "MS 11 - What do you want to achieve" to the customer's email address and Cced to <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a>.</p>
						<p><em style="color:red;">(Note: if we received survey for the customer, no need to send MS 11)</em></p>
						<p style="color:red;"><strong><em>Important Note: Don't send this email to customer enquiries for DUAL OCCUPANCY until next instructions.</em></strong></p>
					</div>

					<div id="section-7c" class="py-5">
						<h4 class="text-navy">3. When to Send MS 12.1 – Survey Text Remainder Email</h4>
						<p>MS 12.1 Survey Text Reminder email is a text message and needs to be sent on Phone number of customer using "<a href="mailto:mobilenumber@e2s.pcsms.com.au">mobilenumber@e2s.pcsms.com.au</a>" format.<br>
						e.g. <a href="mailto:0407237765@e2s.pcsms.com.au">0407237765@e2s.pcsms.com.au</a></p>
						<p>If mobile number not provided then send this email to Email address of customer.</p>
						<p style="color:red;"><strong><em>Important Note: Don't send this email to customer enquiries for DUAL OCCUPANCY until next instructions.</em></strong></p>
						<p><strong><u style="color:red;">Note:</u></strong> We will send Two Survey Reminders to Customer when the Customer added in GCON, if it has not submitted a survey at first day, then sent out Next Day.</p>
						<p><em style="color:red;">(Note: if we received survey for the customer, no need to send MS 12.1)</em></p>
					</div>

					<div id="section-7d" class="py-5">
						<h4 class="text-navy">4. When to Send MS 600 – Text CGFB Username and Logon Email</h4>
						<p>MS 600 email template is the text email that contains login details of Customer Home Page of CGFB Website.</p>
						<p>Before sending this email to customer, create customer profile in Admin Panel of CGFB website using procedure <a href="https://cgfb.sharepoint.com/:w:/s/TemplateMasterList-GCONS/EcAKZh4hDgNFukPeipRaZkMB9u3bSE4JgMI8IisF6GFD3Q?e=dZ2vNh" target="_blank"><strong>DID 411 - Create User Document Logon Task UID 304 - Procedure</strong></a></p>
						<p>After creating user logon on website amend the email <strong>MS 600 - Text - CGFB Logon and Username</strong> and add customer's Username and Password of website logon section.</p>
						<p>Send this email to customer's email address as well as mobile number using "<a href="mailto:mobilenumber@e2s.pcsms.com.au">mobilenumber@e2s.pcsms.com.au</a>" format. e.g. <a href="mailto:0407237765@e2s.pcsms.com.au">0407237765@e2s.pcsms.com.au</a></p>
						<p>Before sending email to customer make sure that login details are working properly.</p>
						<p style="color:red;"><strong>(Note: We don't send dummy email address login details to customer. Wait for genuine email address from customer.)</strong></p>
					</div>

					<div id="section-7e" class="py-5">
						<h4 class="text-navy">5. When to send MS17 - Friday Enquiry Template</h4>
						<p>This step only needs to be actioned if there is a <strong>New Customer Enquiry</strong> on a Friday. Support will need to send a message letting them know when we will get in contact with them. Send this to the customer's email address and Cced to <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a>.</p>
						<p><em style="color:red;">(Note: if we received survey for the customer, no need to send MS 17)</em></p>
					</div>

					<div id="section-7f" class="py-5">
						<h4 class="text-navy">6. When to send - (MS-0335) - Unable to Create a Free Planning Assessment Report</h4>
						<p>Any new enquiries within the below suburbs should have <strong>MS-0335</strong> sent out to them. These are suburbs that we do not provide planning assessments.</p>
						<p><strong>The below suburbs we don't provide planning assessments for:</strong></p>
						<ul>
							<li>Bonner ~2005</li>
							<li>Casey 2010</li>
							<li>Crace 2009</li>
							<li>Forde 2006</li>
							<li>Franklin 2007</li>
							<li>Harrison 2006</li>
							<li>Jacka 2013</li>
							<li>Kenny ^</li>
							<li>Kinlyside ^</li>
							<li>Mitchell</li>
							<li>Moncrieff ~2005</li>
							<li>Taylor 2017</li>
							<li>Throsby 2005</li>
							<li>Denman Prospect</li>
							<li>Coombs</li>
							<li>Molonglo ^</li>
							<li>Sulman ^</li>
							<li>Whitlam ^</li>
							<li>Wright</li>
						</ul>
						<p>This email needs to be sent out from GCON Email Library.</p>
						<ol>
							<li>Go to Email Library and search email template MS-0335 in the search box.</li>
							<li>Then compose the email by referring to <a href="https://cgfb.sharepoint.com/:w:/s/TemplateMasterList-GCONS/EQQ0RWw8_dBKl12j2Tm0nhMB-KVPlLyynZCDGkes3qen3w?e=HdpHeR" target="_blank">DID 676 - How To Use and Send Email From Email Library Section In GCON – Procedure</a> and send copy of email to <a href="mailto:info@cgfb.com.au">info@cgfb.com.au</a></li>
						</ol>
					</div>

					<div id="section-7g" class="py-5">
						<h4 class="text-navy">7. When to send - (MS-0426) - Interstate Customer Email</h4>
						<ul>
							<li>We identify that the customer is wanting to build outside Canberra</li>
							<li>We send them the interstate email MS-0426 from email library by referring to <a href="https://cgfb.sharepoint.com/:w:/s/TemplateMasterList-GCONS/EQQ0RWw8_dBKl12j2Tm0nhMB-KVPlLyynZCDGkes3qen3w?e=HdpHeR" target="_blank">DID 676 - How To Use and Send Email From Email Library Section In GCON – Procedure</a></li>
							<li>The details are entered into the deckquotes database (GCON)</li>
							<li>Then changed to lost</li>
							<li>Inform CSS person that you have added project in GCON, sent MS-0426 email and marked project as lost.</li>
						</ul>
					</div>
				</div>

				<hr>

				<div id="section-8" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 5: Adding sales notes in Sales Follow Up section</h3>
					<p>After sending emails to customer, support needs to add sales notes in Sales Follow Up section in GCON project profile.</p>
					<p style="color:red;"><strong>Note: If in enquiry form that customer has filed has the notes that is important for CGFB staff for future use, then add that notes as Sales notes in Sales Follow Up section for project in GCON.</strong></p>
					<ol>
						<li>Go to the Customer Project profile in GCON.</li>
						<li>At the bottom of the Project you will see <strong>Sales Follow up</strong> Tab.</li>
						<li>You will see the interface of Sales Follow up Tab.</li>
						<li>After that click on <strong>Add New Button</strong>.</li>
						<li>Add sales notes about what emails you have sent to customer and select the date of adding sales notes.</li>
					</ol>
					<p>Click on <strong>SAVE &amp; CLOSE</strong>.<br>Click on <strong>SAVE</strong>.</p>
					<p style="color:#FF2D21;"><strong>Now Open The Project Status Task In Project Page.</strong></p>
					<p>Done the Task</p>
					<ul>
						<li>204 - Convert - Support Sales Initial - Creates customer in GCONS</li>
						<li>304 - Convert - Support Sales Initial Overseas - Creates Username and logon for cgfb.com.au and texts to customers</li>
					</ul>
				</div>

				<hr>

				<div id="section-9" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Step 6: If a Customer Re-Enquiry</h3>
					<p>Content for Step 6: If a Customer Re-Enquiry will be populated here.</p>
				</div>

				<hr>

				<div id="section-10" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Question and Answer component</h3>
					<p>Content for the Question and Answer component will be populated here.</p>
				</div>

				<hr>

				<div id="section-11" class="py-5">
					<h3 class="fs-20 text-start fw-bold text-navy">Improvement Suggestion</h3>
					<p>Content for Improvement Suggestion will be populated here.</p>
				</div>

			</div>
		</div>
	</section>
<script>
	document.querySelectorAll('#content-section a[href^="#"]').forEach(function(link) {
		link.addEventListener('click', function(e) {
			e.preventDefault();
			var targetId = this.getAttribute('href').substring(1);
			var target = document.getElementById(targetId);
			if (target) {
				target.scrollIntoView({ behavior: 'smooth', block: 'start' });
			}
		});
	});
</script>
</div>