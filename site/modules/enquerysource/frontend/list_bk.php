<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$tablePages->setOrderBy($ID.' DESC');
$export = $fwRequest->getParam('export', '');
$print = $fwRequest->getParam('print', '');
$logged_username = $_SESSION['user']['user_name'];

//////////////////////////////////// Export Print Start///////////////////////////////////////////

if(($export || $print) && empty($_SESSION['last_sql']) )
	{Location(BASE_URL . $XFA['list']);}


if(!empty($print))
	{
/////////////////////////////////////////////
if($_SESSION['last_sql']){$exportdata = $fwDb->query($_SESSION['last_sql']);}			
////////////////////////////////////////////
$pdf = pdf_new();

// open a file
pdf_open_file($pdf, "");

// Set Info
pdf_set_info($pdf, "Author", "Frank Walmsley");
pdf_set_info($pdf, "Title", "Buyer Enquiry Call Sheet");
pdf_set_info($pdf, "Creator", $logged_username);
pdf_set_info($pdf, "Subject", "Buyer Enquiry Call Sheet");

// start a new page (A4)
pdf_begin_page($pdf, 800, 902);
$fontdir = BASE_DIR."/Fonts";
//pdf_set_parameter($pdf, "FontOutline", "ArialItalic=$fontdir\ariali.ttf");
pdf_set_parameter($pdf, "FontOutline", "ArialBold=$fontdir\ARIALBD.TTF");
pdf_set_parameter($pdf, "FontOutline", "Arial=$fontdir\arial.TTF");
$font = pdf_findfont($pdf, "ArialBold", "host",0); 
pdf_setfont($pdf, $font, 26);  
pdf_show_xy($pdf, "Buyer Enquiry Call Sheet", 250, 848);
pdf_moveto($pdf, 10, 800);
pdf_lineto($pdf, 785, 800);
pdf_stroke($pdf);



// set the font - Arial Italic 12
$font = pdf_findfont($pdf, "Arial", "host",0); pdf_setfont($pdf, $font, 16);
$y = 770;
// output data header
$count =1;

foreach($exportdata as $k => $v)
		{

		if(($count % 5) == 0)
			{
			pdf_end_page($pdf);
			pdf_begin_page($pdf, 800, 902);
			$font = pdf_findfont($pdf, "Arial", "host",0); pdf_setfont($pdf, $font, 13);
			$y = 880;
			}
		$z = $y-25;
		$x = $y-50;
		$w = $y -75;
		$u = $y - 100;
		pdf_setfont($pdf, $font, 16);
		$custname = $v['bcust_fname']. " ".$v['bcust_lname'];

		if($v['bcust_gendec_sent_date'] == '0000-00-00'){$gendes = "No";}else{$gendes = "Yes";}
		if($v['buse_initial_phone_call_date'] == '0000-00-00'){$initialcall = "No";}else{$initialcall = "Yes";}	

		pdf_show_xy($pdf, "Business", 18, $y);
		pdf_show_xy($pdf, $v['bsn_name'], 139, $y);
				pdf_setfont($pdf, $font, 12);
		pdf_show_xy($pdf, "Customer", 18, $z);
		pdf_show_xy($pdf, "General Disclaimer", 90, $z);
		pdf_show_xy($pdf, "Mobile Number", 200, $z);
		pdf_show_xy($pdf, "Business Number", 300, $z);
				pdf_show_xy($pdf, "Phone Number", 428, $z);
						pdf_show_xy($pdf, "Email", 582, $z);
								pdf_show_xy($pdf, "Date Enquired", 685, $z);
							pdf_setfont($pdf, $font, 11);			
								pdf_show_xy($pdf, $custname, 13, $x);
		pdf_show_xy($pdf, $gendes, 120, $x);
		pdf_show_xy($pdf, $v['bcust_misc_moble'], 210, $x);
		pdf_show_xy($pdf, $v['bcust_misc_business'], 307, $x);
		pdf_show_xy($pdf, $v['bcust_misc_home'], 430, $x);
		pdf_show_xy($pdf, $v['bcust_misc_email1'], 530, $x);
		pdf_show_xy($pdf, $v['buse_created_date'], 700, $x);
		
		pdf_setfont($pdf, $font, 12);
		
		pdf_show_xy($pdf, "Initial Phone Call", 18, $w);
		pdf_show_xy($pdf, "Feedback", 140, $w);
		pdf_show_xy($pdf, "Question asked information request", 300, $w);
		pdf_show_xy($pdf, "New feedback", 600, $w);
		pdf_setfont($pdf, $font, 11);
			pdf_show_xy($pdf, $initialcall, 53, $u);
		pdf_show_xy($pdf, $v['bsn_description'], 140, $u);
		
		$y = $u-50;		
		$count ++;
		unset($custname);
		unset($gendes);
		unset($initialcall);
		}
		pdf_end_page($pdf);

// close and save file
pdf_close($pdf);

$buf = pdf_get_buffer($pdf);
$len = strlen($buf);

header("Content-type: application/pdf");
header("Content-Length: $len");
header("Content-Disposition: inline; filename=reports.pdf");
echo $buf;
pdf_delete($pdf);
exit;
}


if($export)
	{
$csv_output = "";
if($_SESSION['last_sql'])
{	
$exportdata = $fwDb->query($_SESSION['last_sql']);

	$fields = array( "bcust_fname", "bcust_lname","buse_created_date","cs_name", "buse_initial_phone_call_date", "buse_requested_information", "buse_answ_required", "bcust_gendec_sent_date",  "buse_sent_dossier_date", "buse_email_advice_sent_to_seller_date", "bsn_name","soe_name");	
$csv_output .= strtoupper(implode("\t", $fields));
$csv_output .= "\n";	
foreach($exportdata as $k => $v)
		{
			foreach($v as $k2 => $v2)
					{
						if(in_array($k2, $fields))
						{
						$csv_output .= trim($v2)."\t";
						}
					}
			$csv_output .= "\n";	
		}
$filename ="export"."_".date("YmdHi",time()).".xls";
$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
echo $csv_output;
exit;
}

}

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}
if(!empty($submit))
{
    
    $detail = $fwRequest->getParam($TABLE, array());


$orderby = $detail['short_type'];

	
		switch($orderby)
			{
				case 1:
				$sor_data = "ORDER BY byer_enquiry.be_ipc_date DESC";
				break;
				
				case 2:
				$sor_data = "ORDER BY byer_enquiry.be_created_date DESC";
				break;
				
				case 3:
				$sor_data = "ORDER BY business.bsn_name ASC";
				break;
				
				case 4:
				$sor_data = "ORDER BY bus_customers.bcust_fname ASC";
				break;
				
				case 5:
				$sor_data = "ORDER BY enquirysource.soe_name ASC";
				break;
			}

$string ="";
	if($detail['bcust_fname']){$string.= "bcust_fname LIKE '%".trim($detail['bcust_fname'])."%' AND ";}
	if($detail['bcust_lname']){$string.= "bcust_lname LIKE '%".trim($detail['bcust_lname'])."%' AND ";}
	if($detail['bcust_misc_email1']){$string.= "bcust_misc_email1 LIKE '%".trim($detail['bcust_misc_email1'])."%' AND ";}
	if($detail['bcust_status']){$string.= "bcust_status = ".trim($detail['bcust_status'])." AND ";}
//	if($detail['bcust_type']){$string.= "bcust_type = ".trim($detail['bcust_type'])." AND ";}
	if($detail['bcust_misc_logged_date_date_from'] AND empty($detail['bcust_misc_logged_date_date_to'])){$string.= "bcust_misc_logged_date_date >= '".trim($detail['bcust_misc_logged_date_date_from'])."' AND ";}
	
	if(empty($detail['bcust_misc_logged_date_date_from']) AND $detail['bcust_misc_logged_date_date_to']){$string.= "bcust_misc_logged_date_date <= '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_misc_logged_date_date_from'] AND $detail['bcust_misc_logged_date_date_to']){$string.= "bcust_misc_logged_date_date BETWEEN '".trim($detail['bcust_misc_logged_date_date_from'])."' AND '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_isbuyer']){$string.= "bcust_isbuyer = 1 AND ";}
	
	if($detail['bcust_isseller']){$string.= "bcust_isseller = 1 AND ";}	
	
	if($detail['phones']){$string.= "bcust_misc_moble LIKE '%".trim($detail['phones'])."%' OR bcust_misc_business LIKE '%".trim($detail['phones'])."%' OR bcust_misc_home LIKE '%".trim($detail['phones'])."%' AND ";}

	$string = substr($string, 0, -5);
	unset($_SESSION['last_sql']);

    $string2="";
	if($detail['disclamer_type'] == 1)
	{
	$string2 = "bus_customers.bcust_gendec_signed_date LIKE '%0000-00-00%'";
	}
    else if($detail['disclamer_type'] == 2)
	  {
		 $string2 = "byer_enquiry.be_ipc_date LIKE '%0000-00-00%'";
      } 
	else if($detail['disclamer_type'] == 3)
	{
	    $string2 = "byer_enquiry.be_easts_date LIKE '%0000-00-00%'";
	}
   else if($detail['disclamer_type'] == 4)
	{
    $string2 = "bus_customers.bcust_id NOT IN (SELECT distinct bef_cust_id from befollowups)";
	}
	 else if($detail['disclamer_type'] == 5)
	{
    $string2 = "bus_customers.bcust_id IN (Select distinct bef_cust_id from befollowups WHERE bef_create_date NOT LIKE '%0000-00-00%' AND bef_done_date LIKE '%0000-00-00%')";
	}
	else if($detail['disclamer_type'] == 6)
	{
	    $string2 = "byer_enquiry.be_answer_required = 1 ";
	}
	

$fwViewData['detail'] = $detail;
if($string)
			{
				if($string2)
				{
					$sql = "SELECT  byer_enquiry.*,  bus_customers.*,customers_status.*, customers_type.*, business.bsn_id, business.bsn_name, enquirysource.*
			FROM byer_enquiry 
			LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id   
			LEFT JOIN customers_status ON byer_enquiry.be_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE " .$string ." AND ".$string2." ".$sor_data;
				}
				else
				 {
					$sql = "SELECT  byer_enquiry.*,  bus_customers.*,customers_status.*, customers_type.*, business.bsn_id, business.bsn_name, enquirysource.*
			FROM byer_enquiry 
			LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id   
			LEFT JOIN customers_status ON byer_enquiry.be_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE " .$string." ".$sor_data; 
				 }
			}
			else if($string2)
			{
			
				
			
			$sql = "SELECT  byer_enquiry.*,  bus_customers.*,customers_status.*, customers_type.*, business.bsn_id, business.bsn_name, enquirysource.*
			FROM byer_enquiry 
			LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id   
			LEFT JOIN customers_status ON byer_enquiry.be_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE ".$string2." ".$sor_data;
			}
			else
			{
			$sql = "SELECT  byer_enquiry.*,  bus_customers.*,customers_status.*, customers_type.*, business.bsn_id, business.bsn_name, enquirysource.*
			FROM byer_enquiry 
			LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id   
			LEFT JOIN customers_status ON byer_enquiry.be_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry ".$sor_data; 
}

}
if($_SESSION['last_sql'])
{
$sql = $_SESSION['last_sql'];		
}

if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 10;
    $last = ceil($rows/$page_rows); 
    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
}

DB($fwViewData['list']);
$fwViewData['title'] = $MODULE_PLURAL;
$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();
$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');