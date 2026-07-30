<?php
/* common stuff to both admin and frontend */
// load table model
//require_once(LIB_DIR . 'Fw/Db/Table.php');
$fwViewData['tiny_editor'] = 'default/editor.tpl';
$fwViewData['tiny_basic'] = 'default/basic.tpl';
// user logging
$urloguser = $_SESSION['user'];
if($urloguser)
{
$tableuser_logged = new Fw_Db_Table('user_logged');

$loguserdata['ul_user_id'] = $urloguser['user_id'];
$loguserdata['ul_date'] = date('Y-m-d');
$loguserdata['ul_time'] = date('H:i');
$loguserdata['ul_date_time'] = $urloguser['::lastLogin::'];
$logusergdata = array_keys($_SESSION['user']['::groups::']);
$loguserdata['ul_group'] = $logusergdata[0];

$tableuser_logged->setWhere("ul_user_id = ".$loguserdata['ul_user_id']);
		if($tableuser_logged->rowExists())
			{
				$tableuser_logged->updateRow($loguserdata);
			}else{
				$tableuser_logged->insertRow($loguserdata);
			}
}
// user logging

// function to send email

function sendEmail($to, $to_name, $from, $from_name, $subject, $html, $text = '')
	{
		require_once(LIB_DIR.'/PEAR/PEAR/Mail.php');
		require_once(LIB_DIR.'/PEAR/PEAR/Mail/mime.php');
	
	if($html){ $html = stripslashes($html);}
	
		
		if (empty($text))
		{
			$text = 'Please use an HTML capable email client to view this email.';
		}
		// mime message
		$mime = new Mail_mime();
		// body
		$mime->setTXTBody($text);
		$mime->setHTMLBody($html);
		$body = $mime->get();    
		// headers
		$headers = array('From'    => $from,
						 'Subject' => $subject);
		$headers = $mime->headers($headers); 
		// send mail
		$mail =& Mail::factory('mail');
		$mail->send($to, $headers, $body);
		return true;
	}

function cleacn_numdec($number)
	{
	$number = str_replace("$", "", $number);
	return  number_format($number, 2, '.', '');
	}



 function strip_javascript($filter)
{
  
    // realign javascript href to onclick
    $filter = preg_replace("/href=(['\"]).*?javascript:(.*)?\\1/i", "onclick=' $2 '", $filter);

    //remove javascript from tags
    while( preg_match("/<(.*)?javascript.*?\(.*?((?>[^()]+)|(?R)).*?\)?\)(.*)?>/i", $filter))
        $filter = preg_replace("/<(.*)?javascript.*?\(.*?((?>[^()]+)|(?R)).*?\)?\)(.*)?>/i", "<$1$3$4$5>", $filter);
            
    // dump expressions from contibuted content
    if(0) $filter = preg_replace("/:expression\(.*?((?>[^(.*?)]+)|(?R)).*?\)\)/i", "", $filter);

    while( preg_match("/<(.*)?:expr.*?\(.*?((?>[^()]+)|(?R)).*?\)?\)(.*)?>/i", $filter))
        $filter = preg_replace("/<(.*)?:expr.*?\(.*?((?>[^()]+)|(?R)).*?\)?\)(.*)?>/i", "<$1$3$4$5>", $filter);
       
    // remove all on* events   
    while( preg_match("/<(.*)?\s?on.+?=?\s?.+?(['\"]).*?\\2\s?(.*)?>/i", $filter) )
       $filter = preg_replace("/<(.*)?\s?on.+?=?\s?.+?(['\"]).*?\\2\s?(.*)?>/i", "<$1$3>", $filter);

    return $filter;
} 

function cleanQuery($string)
{
  if(get_magic_quotes_gpc())  // prevents duplicate backslashes
  {
    $string = stripslashes($string);
  }
  if (phpversion() >= '4.3.0')
  {
    $string = mysql_real_escape_string($string);
  }
  else
  {
    $string = mysql_escape_string($string);
  }
  
  $string=strip_tags($string);
  $string = eregi_replace("<script[^>]*>.*</script>", "", $string);
  
  $string= strip_javascript($string);
  
  
  return $string;
}


function search_query($string)
	{
	 $string=strip_tags($string);
  $string = str_replace ("'", "", $string );
  return $string;
	}

function ymddate($value)
	{
		list($day, $month, $year) = explode("/", $value);
		
		$date = $year."-".$month."-".$day;
		
		return($date);
		}


							
	function clean_query_for_insert($value)
			{
				foreach($value as $k => $v){$data[$k] = addslashes($v);}
			return($data);
			}


			function clean_query_for_show($value)
				{
					foreach($value as $k => $v)
						{
										$v = str_replace("'", "&#146;",$v);	
									$data[$k] = stripslashes($v);
						}
				return($data);
				}
			
			
			
			
function remove_empty_element($data)			
			{
			foreach($data as $key=>$value)
					{
					if(!empty($value))
						{
						$detail[$key]=$value;
						}
					}
			return($detail);		
			}
			
 
/******* Begin Change date - d-m-Y to Y-m-d ********/		
	function changedate_y_m_d($x)
	{
		if($x!=0)
		{
			$temp = date("Y-m-d", strtotime($x));
		}
		else
		{
			$temp = '';
		}
		return $temp;
	}
	
	function changedate_d_m_Y($x)
	{
		if($x!=0)
		{
			$temp = date("d-m-Y", strtotime($x));
		}
		else
		{
			$temp = '';
		}
		return $temp;
	}
	
	function changetime_h_m($x)
	{
		if($x!=0)
		{
			$temp = date("H:i", strtotime($x));
		}
		else
		{
			$temp = '';
		}
		return $temp;
	}
function r_date($x)	
		{
		if($x!=0)
		{
			$temp = date("m/d/Y h:i", strtotime($x));
		}
		else
		{
			$temp = '';
		}
		return $temp;
	}
	
function rd_date($x)	
		{
		if($x!=0)
		{
			$temp = date("m/d/Y", strtotime($x));
		}
		else
		{
			$temp = '';
		}
		return $temp;
	}	
/******* End Change date - d-m-Y to Y-m-d  ********/		
		
	

// function to send email
function send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='')
{
    require_once('gcon/site/lib/PEAR/PEAR/Mail.php');
    require_once('gocn/site/lib/PEAR/PEAR/Mail/mime.php');
	
	if($html){ $html = stripslashes($html); $html = '<html><head></head><body>'.$html.'</body></html>';	}
	  if($attachment)
		{
		$attached = unserialize($attachment);
		if(is_array($attached))
			{
			foreach($attached as $k => $v)
				{
				$npath = str_replace(BASE_URL, "", $v);
				$attdata['path'] = BASE_DIR.$npath;	
				$filename =  substr(strrchr($npath, "/"), 1); 
				list($name, $ext) = explode(".", $filename);
				$nmaw = (strlen($name) > 54) ? substr($name, 0, 54) : $name;
				$attdata['name'] = 	$nmaw.".".$ext; 
				$newpathattach[] = 	$attdata;
				}
   		   }
	    }

    if (empty($text)){ $text = 'Please use an HTML capable email client to view this email.'; }
    
    // mime message
    $mime = new Mail_mime();
    
    // body
    $mime->setTXTBody($text);
    $mime->setHTMLBody($html);
  //$mime->addAttachment($file, 'text/plain');
	
	 if($newpathattach && is_array($newpathattach))
		{
			foreach($newpathattach as $key => $val){
			$mime->AddAttachment($val['path'], '', $val['name']);      // attachment
			}
		}
	
    $body = $mime->get();
     if($from_name){$from = $from_name.'<'.$from.'>';}
    // headers
    $headers = array('From'    => $from,
                     'Subject' => $subject,
					 //'Return-Receipt-To' => 'dhirephp@gmail.com',
					 'Bcc' => 'frank@businessbuys.com.au',
					 //'Bcc' => 'dharmendrap@ephpsolutions.com'
					 );
    $headers = $mime->headers($headers);
    if($to_name){$to = $to_name.'<'.$to.'>';}
    // send mail
    $mail =& Mail::factory('mail');
    $mail->send($to, $headers, $body);
    return true;
}
	
function get_icon_path($type, $name, $Document_path='')	
		{
			$pdfarray = array("application/pdf");
			$wordarray = array("application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			$excelarray = array("application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			$imagearray = array("image/png","image/jpg","image/jpeg","image/gif");

			if(in_array($type, $pdfarray))
				{
				$iconpath = BASE_URL."images/pdf.png";
				}
			elseif(in_array($type, $wordarray))
				{
				$iconpath = BASE_URL."images/word.png";
				}
			elseif(in_array($type, $excelarray))
				{
				$iconpath = BASE_URL."images/excel.png";
				}
			elseif(in_array($type, $imagearray))
				{
				$iconpath = BASE_URL.FILE_PATH."files/".$Document_path."/".$name;
				}	
			else
				{
				$iconpath = BASE_URL."images/attachment.png";
				}	
	return $iconpath;	
		}
/******************SEND EMAIL************************/


function email_tracking($toname, $email, $fromname, $from, $subject, $message, $attachment, $type)
			{	
			$etdata['et_user_name'] ="Auto";
			$etdata['et_user_id'] = $_SESSION['user']['user_id'];
			$etdata['et_user_name'] = $_SESSION['user']['user_name'];
			if(empty($etdata['et_user_id'])){$etdata['et_user_id'] = 1;}
			if(empty($etdata['et_user_name'])){$etdata['et_user_name'] ="Auto";}
			$etdata['et_type'] = $type;
			$etdata['et_to_name'] =$toname;
			$etdata['et_to_email'] =$email;
			$etdata['et_from_name'] =$fromname;
			$etdata['et_from_email'] =$from;
			$etdata['et_subject'] =$subject;
			$etdata['et_body'] = stripslashes($message);
			$etdata['et_attachment'] =$attachment;
			$etdata['et_ip'] =$_SERVER['REMOTE_ADDR'];
			$tableTemp = new Fw_Db_Table('email_tracking'); 
			$tableTemp->insertRow($etdata);
			return true;
			}
		

function substring_between($haystack,$start,$end) {
if (strpos($haystack,$start) === false || strpos($haystack,$end) === false) {
return false;
} else {
$start_position = strpos($haystack,$start)+strlen($start);
$end_position = strpos($haystack,$end);
return substr($haystack,$start_position,$end_position-$start_position);
}
}


	function multi_unique($array) {
        foreach ($array as $k=>$na)
            $new[$k] = serialize($na);
        $uniq = array_unique($new);
        foreach($uniq as $k=>$ser)
            $new1[$k] = unserialize($ser);
        return ($new1);
    }
	
$LOGO = "<img src='http://www.businessbuys.com.au/emaillogo.jpg' >"; 	
$cur_dt = date('d-m-Y H:i');	
function clean_array($data)
		{
		foreach($data as $k => $v)
				{				
				$cd[$k] = trim($v);	
				}
		return $cd;
		}
		
$fwViewData['email_temp_vars'] = array('First name' => '{{customerfname}}',
										'Full name' => '{{customerfullname}}',
										'Source of enquiry' => '{{enquirysource}}',
										'Current time' => '{{currenttime}}',
										'Logo url' => '{{logourl}}',
										'Project name' => '{{projectname}}' ); 

$fwViewData['email_temp_vars_buyers'] = array('First name' => '{{customerfname}}',
										'Last name' => '{{customerlname}}',
										'Current time' => '{{currenttime}}',
										'Logo url' => '{{logourl}}',
										'Project name' => '{{projectname}}' ); 

$fwViewData['approvals'] = array(1 => 'Building Approval', '2' => 'Development Approval'); 


$fwViewData['docs_folders'] = array('TODO_LIST_DOCS' =>
								array(
									'Folder_Name' => 'To Do List', 
									'Gcode' => '0BxaYGchgRQruUk4zQ3FLalZhSWs'
									)
									
									, 'PROCEDURE_MASTER_DOCS' =>
								array(
									'Folder_Name' => 'Procedure Master',
									'Gcode' => '0BxaYGchgRQruMnJuQXV0aWh4NTg')
									
									, 'TEMPLATE_MASTER_DOCS' =>
								array(
									'Folder_Name' => 'Template Master',
									'Gcode' => '0BxaYGchgRQrudm5nVVkySVdWVzQ')
																	
									, 'OHS_PROCEDURE_DOCS' =>
								array(
									'Folder_Name' => 'OHS Procedures',
									'Gcode' => '0BxaYGchgRQrubW4tanh4QUlwVDA')
									
									, 'OHS_TEMPLATE_DOCS' =>
								array(
									'Folder_Name' => 'OHS Templates',
									'Gcode' => '0BxaYGchgRQrudDAzR2V1SmNmZEU')
									
									, 'GCON_GUIDE' =>
								array(
									'Folder_Name' => 'GCON Guides',
									'Gcode' => '0BxaYGchgRQruMmFqa2lsSHV1bVk')
									
									, 'STRATEGY_DOCS' =>
								array(
									'Folder_Name' => 'Projects Strategy',
									'Gcode' => '0BxaYGchgRQruNjJ1aC1BYjctaUU')
								
									, 'POLICY_DOCS' =>
								array(
									'Folder_Name' => 'Project Policies',
									'Gcode' => '0BxaYGchgRQruaGFJNFJoSVFGNFE')
								
									, 'LAWS_DOCS' =>
								array(
									'Folder_Name' => 'Project Laws',
									'Gcode' => '0BxaYGchgRQrucVZPdXZTd2E3SFU')
								
									, 'GALLERY_DOCS' =>
								array(
									'Folder_Name' => 'Gallery documents',
									'Gcode' => '0BxaYGchgRQrucVZPdXZTd2E3SFU')
									);
	
	
$fwViewData['Decking_types'] = array(1 => '84mm - 90mm', 2 => '125mm - 135mm', 3 => '63mm - 65mm'); 	

$fwViewData['report_types'] = array("1" => "24 Hours", "2" => "Seven Day", "3" => "Selected Dates");

$fwViewData['report_filters'] = array("0" => "All production summary", "1" => "Feedback production summary", "2" => "Task Complete production summary", "3" => "Question and Answer production summary");

	
function create_PDF($heading, $html, $fname)
		{
		
		//require_once('gcon/tcpdf/config/lang/eng.php');
		//require_once('gcon/tcpdf/tcpdf.php');
		$PDF_PAGE_ORIENTATION = "R";
		// Extend the TCPDF class to create custom Header and Footer
		class MYPDF extends TCPDF {

   
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}
		
$nameoffile = str_replace(" ", "_",$fname);		
$filename = $nameoffile."_".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('TurnKeyDecks Project Sales');
$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyDecs Project Sales');
$pdf->SetSubject('Seller answer');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "TurnKeyDecs Project Sales");

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

// set JPEG quality
$pdf->setJPEGQuality(105);	
// output the HTML content
//$pdf->writeHTML($html, true, false, true, false, '');

$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 8pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #fff;
    }
	 th {
        border: 0px solid #fff;
        background-color: #fff;
    }
    td.second {
        border: 2px dashed green;
    }
   
</style>
$html		
EOF;
	
$pdf->writeHTML($vbody, true, false, true, false, '');		

//Close and output PDF document
$filepath = 'reports/'.$filename;
$filepath_save = 'gcon/'.$filepath;
$filepath_url = BASE_URL.$filepath;

$pdf->Output($filepath_save, 'F');
 return $filepath_url;

		}	
		
function clean_data_special($string)		
		{
		$stringdata = preg_replace('/“/', '"', $string);
		$stringdata  = preg_replace('/”/', '"', $stringdata );
		$stringdata = preg_replace("/’/", "'", $stringdata );
		 return $stringdata;	
		}	

	function PHPTruncate($string, $limit, $break=" ", $pad="...") {
	// return with no change if string is shorter than $limit 
	if(strlen($string) <= $limit) return $string; $string = substr($string, 0, $limit); if(false !== ($breakpoint = strrpos($string, $break))) { $string = substr($string, 0, $breakpoint); } return $string . $pad; }

function replace_string($data)
		{
		return strtolower(preg_replace('/[^a-z0-9]/i', '_', $data));
		}	


	///////////Generate filtered production report


	
function generate_all_users_filter_production_report($report_type, $report_filters,  $toDate = 0, $fromDate = 0)
			{
			
		  $fwDb = new Fw_Db();
          $tableUserreport =  new Fw_Db_Table('user_reports');
		  $fwViewData['report_filters'] = array("0" => "All production summary", "1" => "Feedback production summary", "2" => "Task Complete production summary", "3" => "Question and Answer production summary");	

$reportfiltername = $fwViewData['report_filters'][$report_filters];
		  switch($report_type)
				{
					case 1:
					$reporttype ="All users ".$reportfiltername.' 24 Hours ';
					$between = " DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() ";
					break;
					
					case 2:
					$reporttype = "All users ". $reportfiltername." Seven day ";
					$between = " DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() ";
					break;	
					
					case 3:
					$reporttype = "All users ". $reportfiltername." Seleceted Date {".$toDate." To ".$fromDate."} ";
					$toDate = 	changedate_y_m_d($toDate);
					$fromDate = 	changedate_y_m_d($fromDate);
					$between = " '".$toDate."' AND '".$fromDate."' ";
					$urdata['ur_start_date'] = $toDate; 
					$urdata['ur_end_date'] = $fromDate;  
					break;	
					
				}
 
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$AlluserSql = "SELECT users.user_id, users.user_name FROM users LEFT JOIN users_groups ON users_groups.user_id = users.user_id WHERE users_groups.group_id = 3 OR users_groups.group_id = 1";
$allusers = $fwDb->query($AlluserSql);
		
$today = date('d/m/Y');

//$reporttype = "24";

$headtext = $reporttype." - ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Users production Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

switch ($report_filters)
	{
		case 1:
		

	if($allusers)
		{
			
		foreach($allusers  as $k => $v)
				{	
		$user_id = $v['user_id'];		
		$username = $v['user_name'];	
		$followcountsql = "SELECT befollowups.bef_create_date, befollowups.bef_comments, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_name, enquirysource.soe_name FROM befollowups 
		LEFT JOIN bus_customers ON bus_customers.bcust_id = befollowups.bef_cust_id 
		LEFT JOIN business ON business.bsn_id = befollowups.bef_bus_id 
		LEFT JOIN enquirysource ON enquirysource.soe_id = befollowups.bef_source 
		WHERE befollowups.bef_create_date BETWEEN ".$between." AND befollowups.bef_create_user=".$user_id;
		$feedbackdata = $fwDb->query($followcountsql);
$bfcount = count($feedbackdata);		
$data[] = <<<EOF
		<!-- EXAMPLE OF CSS STYLE -->
		<style>
			   div.test {
				color: #CC0000;
				background-color: #fff;
				font-family: helvetica;
				font-size: 16pt;
				border: 0px solid #fff;
				text-align: left;	
			}
		</style>
		<div class="test">Total No. Buyer Follow Ups Added: $bfcount - $username </div><br>
EOF;


if($feedbackdata)
	{
foreach($feedbackdata as $k => $v)
		{
		$Business = $v['bsn_name'];		
		$Customer = $v['bcust_fname']." ".$v['bcust_lname'];		
		$How = $v['soe_name'];	
		$Feedback = $v['bef_comments'];	
		
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
        width:240px;
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
   
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
	 div.test2 {
        color: #008000;
        background-color: #ffffee;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #ffffee;
        text-align: left;
		padding:3pt;	
    }
</style>
<table class="first">
	<tr><th class="first"><strong>Project:</strong></th><td class="second">$Business</td> 
		<th class="first"><strong>Buyer:</strong></th><td class="second">$Customer</td>
		<th class="first"><strong>How:</strong></th><td class="second"> $How</td>
	</tr>
</table>
<div><strong>Buyer Feedback:</strong></div>
<div class="test2">$Feedback</div>
<br />
EOF;
$data[] = $body; 
	}	
   }
  } 
 }

$header = <<<EOF
		<!-- EXAMPLE OF CSS STYLE -->
		<style>
			   div.test {
				color: #CC0000;
				background-color: #fff;
				font-family: helvetica;
				font-size: 16pt;
				border: 0px solid #fff;
				text-align: left;	
			}
		</style>
		<div class="test">$reporttype Report </div><br>
		<br />
EOF;

$pdf->writeHTML($header, true, false, true, false, '');	

foreach($data as $k11 => $v11)	
	{
$pdf->writeHTML($v11, true, true, true, true, '');
	}

break;

 	case 2:
		if($allusers)
		{
			
		foreach($allusers  as $k => $v)
				{
		$user_id = $v['user_id'];		
		$username = $v['user_name'];	
		$taskssql = "SELECT business_tasks.bt_completed_date, business_tasks.bt_comment, business.bsn_name, busness_status.st_name, busness_status_task.bst_task_name FROM business_tasks 
		LEFT JOIN business ON business.bsn_id = business_tasks.bt_bsn_id
		LEFT JOIN busness_status_task ON busness_status_task.bst_id = business_tasks.bt_task_id  
		LEFT JOIN busness_status ON busness_status.st_id = business_tasks.bt_task_status_id 
		WHERE business_tasks.bt_completed_date BETWEEN ".$between." AND business_tasks.bt_completed_by=".$user_id;
		$tacksdata = $fwDb->query($taskssql);
$tccount = count($tacksdata);		
$data[]  = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
	th.first {
        width:20%;
		height:40pt;
    }
	
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">Total No. Task completed: $tccount  -  $username</div><br>
<br />
<table class="first">
	<tr>
	<th class="first"><strong>Task Name</strong></th>
	<th class="first"><strong>Project Name</strong></th>
	<th class="first"><strong>Status</strong></th>
	<th class="first"><strong>Notes/Comments</strong></th>
	<th class="first"><strong>Time</strong></th>
	</tr>
</table>
EOF;

if($tacksdata)
	{	
foreach($tacksdata as $k => $v)
		{
		$Business = $v['bsn_name'];		
		$st_name = $v['st_name'];		
		$bst_task_name = $v['bst_task_name'];	
		$bt_comment = $v['bt_comment'];	
		$bt_completed_date = $v['bt_completed_date'];	
$data[] = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
   
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
	 div.test2 {
        color: #008000;
        background-color: #ffffee;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #ffffee;
        text-align: left;
		padding:3pt;	
    }
</style>
<div></div>
<table class="first">
	<tr><td class="second">$bst_task_name</td>
	<td class="second">$Business</td>
	<td class="second">$st_name</td>
	<td class="second">$bt_comment</td>
	<td class="second">$bt_completed_date</td>
	</tr>
</table>
EOF;
}
}
}
}	


$header = <<<EOF
		<!-- EXAMPLE OF CSS STYLE -->
		<style>
			   div.test {
				color: #CC0000;
				background-color: #fff;
				font-family: helvetica;
				font-size: 16pt;
				border: 0px solid #fff;
				text-align: left;	
			}
		</style>
		<div class="test">$reporttype Report </div><br>
		<br />
EOF;
		$pdf->writeHTML($header, true, false, true, false, '');	

foreach($data as $k11 => $v11)	
	{
$pdf->writeHTML($v11, true, true, true, true, '');
	}
	break;
	
	case 3:
	
	if($allusers)
		{
			
		foreach($allusers  as $k => $v)
				{
				
		$user_id = $v['user_id'];		
		$username = $v['user_name'];	
				
	
		$qandaSql = "SELECT business_qa.bqa_que, business_qa.bqa_ans, business_qa.bqa_ans_date,bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_name FROM business_qa 
		LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
		LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id 
		WHERE business_qa.bqa_ans_date BETWEEN ".$between." AND business_qa.bqa_ans_user_id=".$user_id;
	
		$qandadata = $fwDb->query($qandaSql);
$qacount = count($qandadata);		
$data[]='
<!-- EXAMPLE OF CSS STYLE -->
<style>
	   div.test {
		color: #CC0000;
		background-color: #fff;
		font-family: helvetica;
		font-size: 16pt;
		border: 0px solid #fff;
		text-align: left;	
	}
</style>
<br>
<div class="test">Total No. Q/A: '.$qacount.' - '.$username.' </div>
';	
	

if($qandadata)
	{
foreach($qandadata as $k => $v)
		{
		$Businessname = $v['bsn_name'];		
		$custname = $v['bcust_fname']." ".$v['bcust_lname'];		
		$bqa_que = $v['bqa_que'];	
		$bqa_ans = $v['bqa_ans'];	
		$bqa_ans_date = $v['bqa_ans_date'];	
		
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
</style>
<table class="first">
	<tr><td class="second">$Businessname</td>
	<td class="second">$custname</td>
	<td class="second">$bqa_que</td>
	<td class="second">$bqa_ans</td>
	<td class="second">$bqa_ans_date</td>
	</tr>
</table>
EOF;

$data[] = $body; 
	}
  }
 }
}	
	
$header = <<<EOF
		<!-- EXAMPLE OF CSS STYLE -->
		<style>
			   div.test {
				color: #CC0000;
				background-color: #fff;
				font-family: helvetica;
				font-size: 16pt;
				border: 0px solid #fff;
				text-align: left;	
			}
		</style>
		<div class="test">$reporttype Report </div><br>
		<br />
EOF;
		$pdf->writeHTML($header, true, false, true, false, '');	

foreach($data as $k11 => $v11)	
	{
$pdf->writeHTML($v11, true, true, true, true, '');
	}	
	break;
}
			//Close and output PDF document
$fname = $reporttype;	
$fileusername = str_replace(" ", "_", $fname);			
$filename = date('His')."_".strtolower($fileusername.'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$urdata['ur_user_id'] =0; 
$urdata['ur_type'] = $report_type;
$urdata['ur_feature'] = $report_filters;
$urdata['ur_report_name'] =$filename; 
$tableUserreport->insertRow($urdata);
$pdf->Output($filenamepath , 'F');
//$pdf->Output('example_003.pdf', 'I');
//exit;	

return $filename;
			
			}
	////// Generate filtered production report 

	function generate_singel_user_filter_production_report($user_id, $report_type, $report_filters,  $toDate = 0, $fromDate = 0)
			{
			
		  $fwDb = new Fw_Db();
          $tableUserreport =  new Fw_Db_Table('user_reports');
		  $fwViewData['report_filters'] = array("0" => "All production summary", "1" => "Feedback production summary", "2" => "Task Complete production summary", "3" => "Question and Answer production summary");	
	  
$reportfiltername = $fwViewData['report_filters'][$report_filters];
		  switch($report_type)
				{
					case 1:
					$reporttype = $reportfiltername.' 24 Hours ';
					$between = " DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() ";
					break;
					
					case 2:
					$reporttype =  $reportfiltername." Seven day ";
					$between = " DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() ";
					break;	
					
					case 3:
					$reporttype =  $reportfiltername." Seleceted Date {".$toDate." To ".$fromDate."} ";
					$toDate = 	changedate_y_m_d($toDate);
					$fromDate = 	changedate_y_m_d($fromDate);
					$between = " '".$toDate."' AND '".$fromDate."' ";
					$urdata['ur_start_date'] = $toDate; 
					$urdata['ur_end_date'] = $fromDate;  
					break;	
				}
   
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

		$userSql = "SELECT users.user_name, users.user_email FROM users WHERE users.user_id =".$user_id;
   		$usersdata = $fwDb->queryOne($userSql);
		
		
$today = date('d/m/Y');

$username = $usersdata['user_name'];
//$reporttype = "24";

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Users production Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');



switch($report_filters)
	  {
		case 1:
		
		$followcountsql = "SELECT befollowups.bef_create_date, befollowups.bef_comments, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_name, enquirysource.soe_name FROM befollowups 
		LEFT JOIN bus_customers ON bus_customers.bcust_id = befollowups.bef_cust_id 
		LEFT JOIN business ON business.bsn_id = befollowups.bef_bus_id 
		LEFT JOIN enquirysource ON enquirysource.soe_id = befollowups.bef_source 
		WHERE befollowups.bef_create_date BETWEEN ".$between." AND befollowups.bef_create_user=".$user_id;
		$feedbackdata = $fwDb->query($followcountsql);
$bfcount = count($feedbackdata);		

$header = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report -  $username</div><br>
<div class="test">Total No. Buyer Follow Ups Added: $bfcount </div><br>
<br />
EOF;
$pdf->writeHTML($header, true, false, true, false, '');	

if($feedbackdata)
	{
foreach($feedbackdata as $k => $v)
		{
		$Business = $v['bsn_name'];		
		$Customer = $v['bcust_fname']." ".$v['bcust_lname'];		
		$How = $v['soe_name'];	
		$Feedback = $v['bef_comments'];	
		
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
        width:240px;
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
   
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
	 div.test2 {
        color: #008000;
        background-color: #ffffee;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #ffffee;
        text-align: left;
		padding:3pt;	
    }
</style>
<table class="first">
	<tr><th class="first"><strong>Project:</strong></th><td class="second">$Business</td> 
		<th class="first"><strong>Buyer:</strong></th><td class="second">$Customer</td>
		<th class="first"><strong>How:</strong></th><td class="second"> $How</td>
	</tr>
</table>
<div><strong>Buyer Feedback:</strong></div>
<div class="test2">$Feedback</div>
<br />
EOF;

$data[] = $body; 

}	
	
foreach($data as $k => $v)	
	{
$pdf->writeHTML($v, true, false, true, false, '');
	}
}
break;

 	case 2:
		$taskssql = "SELECT business_tasks.bt_completed_date, business_tasks.bt_comment, business.bsn_name, busness_status.st_name, busness_status_task.bst_task_name 
			FROM business_tasks 
			LEFT JOIN business ON business.bsn_id = business_tasks.bt_bsn_id
			LEFT JOIN busness_status_task ON busness_status_task.bst_id = business_tasks.bt_task_id  
			LEFT JOIN busness_status ON busness_status.st_id = business_tasks.bt_task_status_id 
			WHERE business_tasks.bt_completed_date BETWEEN ".$between." AND business_tasks.bt_completed_by=".$user_id;
		$tacksdata = $fwDb->query($taskssql);
		$tccount = count($tacksdata);		

$header = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report -  $username</div><br>
<div class="test">Total No. Task completed: $tccount </div><br>
<br />
<table class="first">
	<tr>
	<th class="first"><strong>Task Name</strong></th>
	<th class="first"><strong>Project Name</strong></th>
	<th class="first"><strong>Status</strong></th>
	<th class="first"><strong>Notes/Comments</strong></th>
	<th class="first"><strong>Time</strong></th>
	</tr>
</table>
EOF;
$pdf->writeHTML($header, true, false, true, false, '');	

if($tacksdata)
	{
	
foreach($tacksdata as $k => $v)
		{
		$Business = $v['bsn_name'];		
		$st_name = $v['st_name'];		
		$bst_task_name = $v['bst_task_name'];	
		$bt_comment = $v['bt_comment'];	
		$bt_completed_date = $v['bt_completed_date'];	
		
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
   
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
	 div.test2 {
        color: #008000;
        background-color: #ffffee;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #ffffee;
        text-align: left;
		padding:3pt;	
    }
</style>
<div></div>
<table class="first">
	<tr><td class="second">$bst_task_name</td>
	<td class="second">$Business</td>
	<td class="second">$st_name</td>
	<td class="second">$bt_comment</td>
	<td class="second">$bt_completed_date</td>
	</tr>
</table>
EOF;

$data[] = $body; 

}	
	
foreach($data as $k => $v)	
	{
$pdf->writeHTML($v, true, false, true, false, '');
	}
}
	break;

	case 3:
	
	$qandaSql = "SELECT business_qa.bqa_que, business_qa.bqa_ans, business_qa.bqa_ans_date,bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_name 
		FROM business_qa 
		LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
		LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id 
		WHERE business_qa.bqa_ans_date BETWEEN ".$between." AND business_qa.bqa_ans_user_id=".$user_id;
	
		$qandadata = $fwDb->query($qandaSql);
$qacount = count($qandadata);		
	
$header = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
	th.first {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40pt;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report -  $username</div><br>
<div class="test">Total No. Q/A: $qacount </div>
<br />
<table class="first">
	<tr>
	<th class="first"><strong>Project Name</strong></th>
	<th class="first"><strong>Customer Name</strong></th>
	<th class="first"><strong>Question</strong></th>
	<th class="first"><strong>Answer</strong></th>
	<th class="first"><strong>Date</strong></th>
	</tr>
</table>
EOF;
$pdf->writeHTML($header, true, false, true, false, '');	
if($qandadata)
	{
foreach($qandadata as $k => $v)
		{
		$Businessname = $v['bsn_name'];		
		$custname = $v['bcust_fname']." ".$v['bcust_lname'];		
		$bqa_que = $v['bqa_que'];	
		$bqa_ans = $v['bqa_ans'];	
		$bqa_ans_date = $v['bqa_ans_date'];	
		
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
		width:100%;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;
			
		text-align:left;	
    }
	 td.second {
		text-align:left;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
		text-align:left;
    }
	
	th.first {
        border: 0px solid #fff;
       width:80px;
		text-align:left;
    }
</style>
<table class="first">
	<tr><td class="second">$Businessname</td>
	<td class="second">$custname</td>
	<td class="second">$bqa_que</td>
	<td class="second">$bqa_ans</td>
	<td class="second">$bqa_ans_date</td>
	</tr>
</table>
EOF;

$data[] = $body; 

}	
	
foreach($data as $k => $v)	
	{
$pdf->writeHTML($v, true, false, true, false, '');
	}
}	
	break;
}
			//Close and output PDF document
$fname = $username." ".$reporttype;	
$fileusername = str_replace(" ", "_", $fname);			
$filename = date('His')."_".strtolower($fileusername.'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$urdata['ur_user_id'] =$user_id; 
$urdata['ur_type'] = $report_type;
$urdata['ur_feature'] = $report_filters;
$urdata['ur_report_name'] =$filename; 
$tableUserreport->insertRow($urdata);
$pdf->Output($filenamepath , 'F');
//$pdf->Output('example_003.pdf', 'I');
//exit;	

return $filename;
			
			}
	/// user productivity report generate
	function generate_singel_user_production_report($user_id, $report_type,  $toDate = 0, $fromDate = 0)
		{
		$fwDb = new Fw_Db();
		$tableUserreport =  new Fw_Db_Table('user_reports');
		  switch($report_type)
				{
					case 1:
					$reporttype = '24 Hours';
					$between = " DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() ";
					break;
					
					case 2:
					$reporttype = "Seven day";
					$between = " DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() ";
					break;	
					
					case 3:
					$reporttype = "Seleceted Date {".$toDate." To ".$fromDate."} ";
					$toDate = 	changedate_y_m_d($toDate);
					$fromDate = 	changedate_y_m_d($fromDate);
					$between = " '".$toDate."' AND '".$fromDate."' ";
					$urdata['ur_start_date'] = $toDate; 
					$urdata['ur_end_date'] = $fromDate;  
					break;	
					
				}
   
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "R";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

		$userSql = "SELECT users.user_name, users.user_email FROM users WHERE users.user_id =".$user_id;
   		$usersdata = $fwDb->queryOne($userSql);
    
   		$gdcountsql = "SELECT count(bcust_id) as gdcount FROM bus_customers WHERE  bus_customers.bcust_gendec_signed_date BETWEEN ".$between." AND bus_customers.bcust_gendec_signed_user_id =".$user_id;
		$gdcount = $fwDb->queryOne($gdcountsql);
		$gdcount = $gdcount['gdcount'];
			
		$becountsql = "SELECT count(be_id) as becount FROM byer_enquiry WHERE  byer_enquiry.be_created_date BETWEEN ".$between." AND byer_enquiry.be_user=".$user_id;
		$becount = $fwDb->queryOne($becountsql);
		$becount = $becount['becount'];
		
		$newbecountsql = "SELECT count(byer_enquiry.be_id) as newbecount FROM byer_enquiry LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id WHERE bus_customers.bcust_gendec_sent_date BETWEEN DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() AND byer_enquiry.be_created_date BETWEEN ".$between." AND byer_enquiry.be_user=".$user_id;
		$newbecount = $fwDb->queryOne($newbecountsql);
		$newbecount = $newbecount['newbecount'];
		
		$followcountsql = "SELECT count(bef_fups_id) as followupcount FROM befollowups WHERE befollowups.bef_create_date BETWEEN ".$between." AND befollowups.bef_create_user=".$user_id;
		$followupcount = $fwDb->queryOne($followcountsql);
		$followupcount = $followupcount['followupcount'];
				
		$inspeccountsql = "SELECT count(bod_id) as inspeccount FROM byers_other_data WHERE byers_other_data.bod_type = 1 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$inspeccount = $fwDb->queryOne($inspeccountsql);
		$inspeccount = $inspeccount['inspeccount'];
		
		$makeoffcountsql = "SELECT count(bod_id) as makeoffcount FROM byers_other_data WHERE byers_other_data.bod_type = 2 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$makeoffcount = $fwDb->queryOne($makeoffcountsql);
		$makeoffcount = $makeoffcount['makeoffcount'];
		
		$inforeqcountsql = "SELECT count(bod_id) as inforeqcount FROM byers_other_data WHERE byers_other_data.bod_type = 3 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$inforeqcount = $fwDb->queryOne($inforeqcountsql);
		$inforeqcount = $makeoffcount['inforeqcount'];
			
		$byermatchsql = "SELECT count(bm_id) as byermatchcount FROM byer_matches WHERE  byer_matches.bm_create_date BETWEEN ".$between." AND byer_matches.bm_create_user_id=".$user_id;
			$buyermatchcount = $fwDb->queryOne($byermatchsql);
			$buyermatchcountnew = $buyermatchcount['byermatchcount'];

		$taskssql = "SELECT count(bt_id) as taskscount FROM business_tasks WHERE  business_tasks.bt_completed_date BETWEEN ".$between." AND business_tasks.bt_completed_by=".$user_id;
		$taskscount = $fwDb->queryOne($taskssql);
		$taskscount = $taskscount['taskscount'];
		
		$dossiersql = "SELECT count(edl_id) as dossiercount FROM e_dossier_log WHERE  e_dossier_log.edl_date BETWEEN ".$between." AND e_dossier_log.edl_user_id =".$user_id;
		$dossiersent = $fwDb->queryOne($dossiersql);
		$dossiersent = $taskscount['dossiercount'];
					
		$quesql = "SELECT count(bqa_id ) as q_bqa_ids FROM business_qa WHERE  business_qa.bqa_created_date BETWEEN ".$between." AND business_qa.bqa_que_user_id =".$user_id;
		$ques = $fwDb->queryOne($quesql);
		$questions = $ques['q_bqa_ids'];	
			
		$anssql = "SELECT count(bqa_id ) as a_bqa_ids FROM business_qa WHERE  business_qa.bqa_ans_date BETWEEN ".$between." AND business_qa.	bqa_ans_user_id =".$user_id;
		$ans = $fwDb->queryOne($anssql);
		$answers = $ans['a_bqa_ids'];	
		
		if($report_type == 1)
			{
		$userlogsql = "SELECT logged_users.lu_login_date_time, logged_users.lu_logout_date_time FROM logged_users WHERE  logged_users.lu_user_id=".$user_id;
		$ullogtime = $fwDb->queryOne($userlogsql);
		
	
		$ullogintime = trim(strstr($ullogtime['lu_login_date_time'], ' '));
		$ullogouttime = trim(strstr($ullogtime['lu_logout_date_time'], ' '));
			}else{
		$ullogintime = "NA";
		$ullogouttime = "NA";	
			
			}

$existbecount = $becount - $newbecount;	
$username = $usersdata['user_name'];
//$reporttype = "24";

$headtext = "Production Report - ".date('d/m/Y')."     ".$username;			
		
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Users production Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');


$today = date('d/m/Y');
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report - $username</div><br>
<table class="first">
	<tr><td class="first"></td><td class="second"></td></tr>
	<tr><td class="first">Total No. Disclamer Added:</td><td class="second">$gdcount</td></tr>
	<tr><td>Total No. Buyer Enquiries Added:</td><td>$becount</td></tr>
	<tr><td>Total No. New Buyer Enquiries Added:</td><td>$newbecount</td></tr>
	<tr><td>Total No. Existing Buyer New Enquiries Added:</td><td>$existbecount</td></tr>
	<tr><td>Total No. Buyer Follow Ups Added:</td><td>$followupcount</td></tr>
	<tr><td>Total No. Buyer Inspections Added:</td><td>$inspeccount</td></tr>
	<tr><td>Total No. Buyer Offers Added:</td><td>$makeoffcount</td></tr>
	<tr><td>Total No. Buyer Information Request Added:</td><td>$inforeqcount</td></tr>
	<tr><td>Total No. Buyer Matches Added:</td><td>$buyermatchcountnew</td></tr>
	<tr><td>Total No. Tasks Completed:</td><td>$taskscount</td></tr>
	<tr><td>Total No. E-dossier Sent:</td><td>$dossiersent</td></tr>
	<tr><td>Total No. Question Added:</td><td>$questions</td></tr>
	<tr><td>Total No. Answer Added:</td><td>$answers</td></tr>
	<tr><td>Login Time:</td><td>$ullogintime</td></tr>
	<tr><td>Logout Time:</td><td>$ullogouttime</td></tr>
</table>
<br />
EOF;
	
$pdf->writeHTML($body, true, false, true, false, '');
			//Close and output PDF document
$fname = $username." ".$reporttype;	
$fileusername = str_replace(" ", "_", $fname);			
$filename = date('His')."_".strtolower($fileusername.'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$urdata['ur_user_id'] =$user_id; 
$urdata['ur_type'] = $report_type;
$urdata['ur_report_name'] =$filename; 
$tableUserreport->insertRow($urdata);
$pdf->Output($filenamepath , 'F');
//$pdf->Output('example_003.pdf', 'I');
//exit;	

return $filename;
		}

function generate_All_user_production_report($report_type, $toDate = 0, $fromDate = 0)
		{
		$fwDb = new Fw_Db();
		$tableUserreport =  new Fw_Db_Table('user_reports');
		  switch($report_type)
				{
					case 1:
					$reporttype = '24 Hours';
					$between = " DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() ";
					break;
					
					case 2:
					$reporttype = "Seven day";
					$between = " DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() ";
					break;	
					
					case 3:
					$reporttype = "Seleceted Date {".$toDate." To ".$fromDate."} ";
					$toDate = 	changedate_y_m_d($toDate);
					$fromDate = changedate_y_m_d($fromDate);
					$between = " '".$toDate."' AND '".$fromDate."' ";
					$urdata['ur_start_date'] = $toDate; 
					$urdata['ur_end_date'] = $fromDate;  
					break;	
				}
	
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');

$PDF_PAGE_ORIENTATION = "R";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}   
	$AlluserSql = "SELECT users.user_id FROM users LEFT JOIN users_groups ON users_groups.user_id = users.user_id WHERE users_groups.group_id IN(1,4,3)";
	$allusers = $fwDb->query($AlluserSql);
	

$today = date('d/m/Y');	
		foreach($allusers as $k => $v)
				{
		$user_id = $v['user_id'];				
		$userSql = "SELECT users.user_name, users.user_email FROM users WHERE users.user_id =".$user_id;
   		$usersdata = $fwDb->queryOne($userSql);
      
   		$gdcountsql = "SELECT count(bcust_id) as gdcount FROM bus_customers WHERE  bus_customers.bcust_gendec_signed_date BETWEEN ".$between." AND bus_customers.bcust_gendec_signed_user_id =".$user_id;
		$gdcount = $fwDb->queryOne($gdcountsql);
		//$gdcount = $gdcount['gdcount'];
		
		
		$becountsql = "SELECT count(be_id) as becount FROM byer_enquiry WHERE  byer_enquiry.be_created_date BETWEEN ".$between." AND byer_enquiry.be_user=".$user_id;
		$becount = $fwDb->queryOne($becountsql);
		//$becount = $becount['becount'];
		
		$newbecountsql = "SELECT count(byer_enquiry.be_id) as newbecount FROM byer_enquiry LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id WHERE bus_customers.bcust_gendec_sent_date BETWEEN DATE_SUB(NOW(), INTERVAL 2 DAY) AND NOW() AND byer_enquiry.be_created_date BETWEEN ".$between." AND byer_enquiry.be_user=".$user_id;
		$newbecount = $fwDb->queryOne($newbecountsql);
		//$newbecount = $newbecount['newbecount'];
		
		$followcountsql = "SELECT count(bef_fups_id) as followupcount FROM befollowups WHERE befollowups.bef_create_date BETWEEN ".$between." AND befollowups.bef_create_user=".$user_id;
		$followupcount = $fwDb->queryOne($followcountsql);
		//$followupcount = $followupcount['followupcount'];
				
		$inspeccountsql = "SELECT count(bod_id) as inspeccount FROM byers_other_data WHERE byers_other_data.bod_type = 1 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$inspeccount = $fwDb->queryOne($inspeccountsql);
		//$inspeccount = $inspeccount['inspeccount'];
		
		$makeoffcountsql = "SELECT count(bod_id) as makeoffcount FROM byers_other_data WHERE byers_other_data.bod_type = 2 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$makeoffcount = $fwDb->queryOne($makeoffcountsql);
		//$makeoffcount = $makeoffcount['makeoffcount'];
		
		$inforeqcountsql = "SELECT count(bod_id) as inforeqcount FROM byers_other_data WHERE byers_other_data.bod_type = 3 AND  byers_other_data.bod_cur_date BETWEEN ".$between." AND byers_other_data.bod_user_id=".$user_id;
		$inforeqcount = $fwDb->queryOne($inforeqcountsql);
		//$inforeqcount = $makeoffcount['inforeqcount'];
			
		$byermatchsql = "SELECT count(bm_id) as byermatchcount FROM byer_matches WHERE  byer_matches.bm_create_date BETWEEN ".$between." AND byer_matches.bm_create_user_id=".$user_id;
		$buyermatchcount = $fwDb->queryOne($byermatchsql);
		//$buyermatchcountnew = $buyermatchcount['byermatchcount'];

		$taskssql = "SELECT count(bt_id) as taskscount FROM business_tasks WHERE  business_tasks.bt_completed_date BETWEEN ".$between." AND business_tasks.bt_completed_by=".$user_id;
		$taskscount = $fwDb->queryOne($taskssql);
		$taskscount = $taskscount['taskscount'];
		
		
		$dossiersql = "SELECT count(edl_id) as dossiercount FROM e_dossier_log WHERE  e_dossier_log.edl_date BETWEEN ".$between." AND e_dossier_log.edl_user_id =".$user_id;
		$dossiersent = $fwDb->queryOne($dossiersql);
		//$dossiersent = $taskscount['dossiercount'];

		$quesql = "SELECT count(bqa_id ) as q_bqa_ids FROM business_qa WHERE  business_qa.bqa_created_date BETWEEN ".$between." AND business_qa.bqa_que_user_id =".$user_id;
			$ques = $fwDb->queryOne($quesql);
			//$questions = $ques['q_bqa_ids'];	
				
			$anssql = "SELECT count(bqa_id ) as a_bqa_ids FROM business_qa WHERE  business_qa.bqa_ans_date BETWEEN ".$between." AND business_qa.bqa_ans_user_id =".$user_id;
			$ans = $fwDb->queryOne($anssql);
			//$answers = $ans['a_bqa_ids'];	
		if($report_type == 1)
			{
			unset($ullogtime);
		$userlogsql = "SELECT logged_users.lu_login_date_time, logged_users.lu_logout_date_time FROM logged_users WHERE  logged_users.lu_user_id=".$user_id;
		$ullogtime = $fwDb->queryOne($userlogsql);
		$ullogintime = trim(strstr($ullogtime['lu_login_date_time'], ' '));
		$ullogouttime = trim(strstr($ullogtime['lu_logout_date_time'], ' '));
			}else{
		$ullogintime = "NA";
		$ullogouttime = "NA";	
			
			}
	
	
//$existbecount = $becount - $newbecount;	
$username = $usersdata['user_name'];


$body[] = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
        border: 0px solid #333;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
		height: 40px;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.first {
        width:550px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report - $username</div><br>
<table class="first">
	<tr><td class="first"></td><td class="second"></td></tr>
	<tr><td>Total No. Tasks Completed:</td><td>$taskscount</td></tr>
	<tr><td>Login Time:</td><td>$ullogintime</td></tr>
	<tr><td>Logout Time:</td><td>$ullogouttime</td></tr>
</table>
<br />
EOF;
	}
	
$headtext = "All Users Production Report - ".date('d/m/Y');		
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('All Users '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Users production Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

			foreach($body as $k => $v){$pdf->writeHTML($v, true, false, true, false, '');}
			//Close and output PDF document
			$fname = "All_users_".$reporttype;	
			$fileusername = str_replace(" ", "_", $fname);			
			$filename = date('His')."_".strtolower($fileusername.'.pdf');
			
			//Close and output PDF document
			$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
			//$urdata['ur_user_id'] =$user_id; 
			$urdata['ur_type'] = $report_type; 
			$urdata['ur_report_name'] =$filename; 
			$tableUserreport->insertRow($urdata);
			$pdf->Output($filenamepath , 'F');
			//$pdf->Output('example_003.pdf', 'I');
	return $filename;
		}


function send_template_email($tempname, $custid, $busid, $email_section)
	{
	 $action = 0;	
		if($tempname)
			{
			$tableTemp = new Fw_Db_Table('email_template'); 
			$tableTemp->setWhere("et_name = '".$tempname."' AND et_status = 1");
			$email_template_data = $tableTemp->getRow();
			}
		if($custid)
			{
			$tableTemp = new Fw_Db_Table('bus_customers'); 
			$tableTemp->setWhere('bcust_id = '.$custid);
			$custdata = $tableTemp->getRow();
			}
			
		if($busid)
			{
			$tableTemp = new Fw_Db_Table('business'); 
			$tableTemp->setWhere('bsn_id = '.$busid);
			$busdata = $tableTemp->getRow();
			}
	   $attachmentsend ="None";		
	if($email_template_data['et_attachment'])
		{		
	$attachdata = unserialize($email_template_data['et_attachment']);
		foreach($attachdata as $k => $v)
			{
				if($v){	$fdata[] = BASE_URL.FILE_PATH."files/template_files/".$v; }
			}
		$attachmentsend = serialize($fdata);			
		
		$attachmentsend = serialize($fdata);
	}		
	if($email_template_data && $custdata)
		{		
		
	$to = trim($custdata['bcust_misc_email1']);
	$toname = $custdata['bcust_fname']." ".$custdata['bcust_lname'];
	
	$from =SITE_EMAIL_SEND;
	$fromname = FROM_NAME;
	
	//$to = "dharmendra@ephpsolutions.com";
	$et_body = str_replace("{{buyerfname}}", $custdata['bcust_fname'], $email_template_data['et_body']);
	$et_body = str_replace("{{buyerlname}}", $custdata['bcust_lname'], $et_body);
	$et_body = str_replace("{{businessname}}", $busdata['bsn_name'], $et_body);
	
	$email_body = $et_body;

	
	$subject =$email_template_data['et_subject'];
  
 if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
	 	{
		 email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
		$action = 1;
		}
	}	
return $action;	
	}
	
function send_all_edossier($cust_id, $bus_id, $edl_be_id = 0)
		{
		$counter =1000;			
		if($cust_id)
			{
			$tableTemp = new Fw_Db_Table('bus_customers'); 
			$tableTemp->setWhere('bcust_id = '.$cust_id);
			$custdata = $tableTemp->getRow();
			}
		
		if($bus_id)
			{
			$tableTemp = new Fw_Db_Table('e_dossier_templates'); 
			$tableTemp->setWhere('edt_bus_id = '.$bus_id);
			$etempdate = $tableTemp->getRows();
			$tableTemp = new Fw_Db_Table('business'); 
			$tableTemp->setWhere('bsn_id = '.$bus_id);
			$busdata = $tableTemp->getRow();
			}

	
	if($custdata['bcust_gendec_signed_date'] !== '0000-00-00' && $busdata['bsn_auto_edossier'] == 1)
		{
		if($etempdate)
			{
						$from = SITE_EMAIL_SEND;
						$fromname = FROM_NAME;
						$to = trim($custdata['bcust_misc_email1']);
						$toname = $custdata['bcust_fname']." ".$custdata['bcust_lname'];
						$attachmentsend ="None";
						$counter = 0;
						$email_section = 9;
						
						
						$edossierlogs = new Fw_Db_Table('e_dossier_log'); 
						$edlogdata['edl_cust_id'] = $cust_id;
						$edlogdata['edl_bus_id'] = $bus_id;
						$edlogdata['edl_be_id'] = $edl_be_id;
						$edlogdata['edl_user_id'] = $_SESSION['user']['user_id'];
						$edlogdata['edl_ip'] = $_SERVER['REMOTE_ADDR'];
						
			foreach($etempdate as $k => $v)
				{ 
					$subject = $v['edt_title'];
					$email_body = $v['edt_body'];	
			
				 if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
								{
									//e-dossire tracking end
									$edlogdata['edl_temp_id'] = $v['edt_id'];
									$edlogdata['edl_to'] = $to;
									$edlogdata['edl_toname'] = $toname;
									$edlogdata['edl_title'] = $subject;
									$edlogdata['edl_body'] = $email_body;
									$edossierlogs->insertRow($edlogdata);
									//e-dossire tracking end
									email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, $email_section);
									$counter++;	
								}
								
				}
			  }else{
			  $counter = 1000;
			  }
			}
return $counter;				
		}	


///////////////////GD REMINDER //////////////////
function send_general_disclamer_reminder($fname, $lname, $email)
	{
	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere("et_section = 1 AND et_status = 1 AND et_name = 'GENERAL_DISCLAIMER_REMINDER'");
	$email_template_data = $tableTemp->getRow();

	if($email_template_data)
		{
	$toname = $fname." ".$lname;
	$to = $email;
	//$to = "dharmendra@ephpsolutions.com";
	$fromname = FROM_NAME;
	$from = SITE_EMAIL_SEND;
	$subject = $email_template_data['et_subject'];
	
	$email_template_data['et_body'] = str_replace("{{buyerfname}}", $fname, $email_template_data['et_body']);
	$email_template_data['et_body'] = str_replace("{{buyerlname}}", $lname, $email_template_data['et_body']);
	
	$email_body = $email_template_data['et_body'];
	if($email_template_data['et_attachment']){
		$attach = unserialize($email_template_data['et_attachment']);foreach($attach as $k => $v){$attachment[] = BASE_URL.FILE_PATH.'files/template_files/'.$v;}}	

	//$attachment[] = BASE_URL.'files/template_files/'.$email_template_data['et_attachment'];
	$attachmentsend2 = serialize($attachment);

	if(send_email($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2))
		{
	email_tracking($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2, 1);
		}
$action = 1;
	}else{$action = 0;}
return $action;	  
	}	
	
 function check_module()	
	{
		// modules		
	$parts = explode(".", $_GET['fuseaction']);
	$tableModules = new Fw_Db_Table('bes_modules');
	$tableModules->setWhere("bm_code = '".$parts[0]."' && bm_status = 1");
	if($tableModules->rowExists()){return true;}else{ return false;}
	}
function filteremail($email){ return strtolower(trim($email)); }


$fwViewData['docstatus'] = array(1 => 'Completed', 2 => 'OutStanding', 3 => 'Uploaded');

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function Convert_Project_Daily_Task_Summary($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		$fname = str_replace(" ", "_", $reporttype)."_";	
		
		if($project_type > 0){ $ptwhere =" AND business.bsn_type = ".$project_type; }
		if($project_status > 0){ $ptwhere .=" AND business.bsn_status = ".$project_status; }
		if($gen_user_id > 0){ $ptwhere .=" AND business.bsn_sales_user_id = ".$gen_user_id; }
		if($deffdate > 0){ $ptwhere .=" AND business.bsn_status_sys_date BETWEEN CURDATE() - INTERVAL {$deffdate} DAY AND CURDATE() "; }
		
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover,			
			busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, business_sellers.bs_customers_name, 
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_status_id = 1) AS totaltasks,
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_complete = 1 AND business_tasks.bt_task_status_id = 1) AS compltotal, (SELECT business_tasks.bt_completed_date FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_id = 49 AND business_tasks.bt_complete = 1) AS booked, (SELECT document_check_list.doc_date_uploaded 
			FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3 AND document_check_list.doc_file_name != '') AS ComApp, (SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 17 AND document_check_list.doc_file_name != '') AS ComPro, users.user_name as saleagent, count(sales_followup.sf_id) as sfid  
			FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN business_tasks ON business_tasks.bt_bsn_id = business.bsn_id
			LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN sales_followup ON sales_followup.sf_pid = business.bsn_id 
			WHERE business.bsn_sub_status = 'Open' $ptwhere AND project_type.pt_id != 6
			GROUP BY business.bsn_id ORDER BY business.bsn_status_sys_date ASC ";
				
$qaData = $fwDb->query($sql);
$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0">
	<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Tasks Count</strong></th>
		<th><strong><br>Days in System</strong></th>
		<th><strong><br>Initial Call</strong></th>
		<th><strong><br>Booked</strong></th>
		<th><strong><br>Com App</strong></th>
		<th><strong><br>Com Pro</strong></th>
		<th width="10%"><strong><br>Project Value</strong></th>
		<th><strong><br>Project Profit</strong></th>
		<th width="10%"><strong><br>Sales Person</strong></th>
	</tr>';
	
$numrows =0;
	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$sfsql = "SELECT sf_id, sf_source FROM sales_followup WHERE sf_source = 4 AND sf_pid = {$bsn_id}";
				$sfData = $fwDb->query($sfsql);
				$sftext = "Yes";
				if(empty($sfData))
					{
					$sfsql = "SELECT count(sf_id) as sfids FROM sales_followup WHERE sf_pid = {$bsn_id}";
					$sfData = $fwDb->queryOne($sfsql);
					$sftext = "No - ".$sfData['sfids'];	
					}		
				$bsn_name = $v1['bsn_name'];
				
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }
				if($v1['booked'] && $v1['ComApp']): $Comappdays = daysDifference($v1['ComApp'], $v1['booked']); endif;
				if($v1['ComPro'] && $v1['ComApp']): $Comprodays = daysDifference($v1['ComPro'], $v1['ComApp']); endif;
				
				$rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
							<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
							<td>'.$v1['totaltasks'].'/'.$v1['compltotal'].'</td>
							<td>'. changedate_d_m_Y($v1['bsn_status_sys_date'])."<br>".daysDifference(date("Y-m-d"), $v1['bsn_status_sys_date']).' day(s) </td>
							<td>'.$sftext.'</td>
							<td>'.(($v1['booked']) ? changedate_d_m_Y($v1['booked'])."<br>(".daysDifference($v1['booked'], $v1['bsn_status_sys_date']).") day(s)": "No").'</td>
							<td>'.(($v1['ComApp']) ? changedate_d_m_Y($v1['ComApp'])."<br> (".$Comappdays.") day(s)": "No").'</td>
							<td>'.(($v1['ComPro']) ? changedate_d_m_Y($v1['ComPro'])."<br> (".$Comprodays.") day(s)" : "No").'</td>
							<td>'.(($v1['bsn_advertLink']) ? "$".cleacn_numdec($v1['bsn_advertLink']) : "NA").'</td>
							<td>'.(($v1['bsn_cd_turnover']) ? "$".cleacn_numdec($v1['bsn_cd_turnover']) : "NA").'</td>
							<td>'.$v1['saleagent'].'</td>
			   			   </tr>';
			   $numrows++;	
					}
															
if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Convert Project Daily Task Summary');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();
//$pdf->writeHTML($html, true, false, true, false, '');
foreach($rowdatas as $tval):

$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;
$pdf->writeHTML($body, true, false, true, false, '');		
endforeach;			
			
$fileusername = str_replace(" ", "_", $fname);			
$filename = strtolower($fileusername.date('His').'.pdf');
//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;
		}
	
	
////////////////////////////////////////////////////////////////////////
function group_array($arr, $fields) {
    if(empty($fields) || !is_array($fields)) {
        return $arr;
    }

    $newarr = array(); // so that we always return an array
    $field = array_shift($fields);

    foreach($arr as $val) {
        $newarr[$val[$field]][] = $val;
    }

    foreach(array_keys($newarr) as $key) {
        // Since we shifted one field off before, this groups by the remaining
        $newarr[$key] = group_array($newarr[$key], $fields);
    }

    return $newarr;
}

function Tasks_Daily_notifications($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
			$fwDb = new Fw_Db();
			$fname = str_replace(" ", "_", $reporttype)."_";	
		
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,			
			busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, busness_status_task.bst_posid, busness_status_task.bst_task_name, users.user_name, users.user_email, positions.p_name, positions.p_email, business_tasks.bt_id	
			FROM business_tasks
			RIGHT JOIN busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id	
			LEFT JOIN business ON business.bsn_id = business_tasks.bt_bsn_id AND business.bsn_status = business_tasks.bt_task_status_id
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			RIGHT JOIN users ON users.user_id = business.bsn_sales_user_id
			RIGHT JOIN positions ON positions.p_id = busness_status_task.bst_posid
			WHERE business_tasks.bt_complete = 0 and busness_status_task.bst_posid > 0
			ORDER BY business.bsn_status_sys_date ASC ";
			
$SelectData = $fwDb->query($sql);
$data = group_array($SelectData, array('bst_posid'));

$count =0;

	foreach($data as $pos => $rows):	
	 $rowheader = '<table width="100%" cellspacing="0" cellpadding="0" border="1" style="font-size:11px; font-family:Verdana, Arial, Helvetica, sans-serif;">
		<tr><th width="20%"><strong><br>Project Name</strong></th>
			<th width="20%"><strong><br>Project Start Date</strong></th>
			<th><strong><br>Task Name</strong></th>
			<th width="20%"><strong><br>Sales Person</strong></th>
	    </tr>';		   
		foreach($rows as $row):
		$sysdate = changedate_d_m_Y($row['bsn_status_sys_date']);
			$rowheader .="<tr>
		<th><a href='".BASE_URL."business.detail/bsn_id/{$row['bsn_id']}' title='Edit' target='_blank'>{$row['bsn_name']}</a></th>
		<th>{$sysdate}</th>
		<th><a href='".BASE_URL."business.detail/bsn_id/{$row['bsn_id']}/et/{$row['bt_id']}' title='Edit' target='_blank'>{$row['st_name']} {$row['bst_task_name']}</a></th>
		<th>{$row['user_name']}</th>
		</tr>";	
		endforeach;
	$rowheader .="</table>";
		
$sql = "SELECT positions.p_name, positions.p_email FROM positions WHERE positions.p_id = ".$pos;
$UserData = $fwDb->queryOne($sql);
	if($UserData['p_email']):
	
	$body = "<html><body style='font-size:11px; font-family:Verdana, Arial, Helvetica, sans-serif;'>
				<p>Dear Support,</p>
				<p>GCON needs action on following tasks.</p>
				<p>".$rowheader."</p>
				<p>Regards,<br>Support GCON</p></body>
			 </html>";			
	//$UserData['p_email'] = "dharmendrap@ephpsolutions.com";	
	send_email($UserData['p_name'], $UserData['p_email'], SITE_NAME, SITE_EMAIL, "Tasks needs actions.", $body, $att="");
	send_email("Frank Walmsley", "frank@businessbuys.com.au", SITE_NAME, SITE_EMAIL, "Tasks needs actions.", $body, $att="");
	$count++;

	endif;
	endforeach;

return $count;
		}
		
////////////////////////////////////////////////////////////////////////	
	
		
////////////////////////////////////////////////////////////////////////

function Convert_Project_Daily_Task_Summary_kithome($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		$fname = str_replace(" ", "_", $reporttype)."_";	
		
		if($project_type > 0){ $ptwhere =" AND business.bsn_type = ".$project_type; }
		if($project_status > 0){ $ptwhere .=" AND business.bsn_status = ".$project_status; }
		if($gen_user_id > 0){ $ptwhere .=" AND business.bsn_sales_user_id = ".$gen_user_id; }
		if($deffdate > 0){ $ptwhere .=" AND business.bsn_status_sys_date BETWEEN CURDATE() - INTERVAL {$deffdate} DAY AND CURDATE() "; }
		
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover,			
			busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, business_sellers.bs_customers_name, 
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_status_id = 1) AS totaltasks,
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_complete = 1 AND business_tasks.bt_task_status_id = 1) AS compltotal,	(SELECT business_tasks.bt_completed_date FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_id = 49 AND business_tasks.bt_complete = 1) AS booked, (SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3 AND document_check_list.doc_file_name != '') AS ComApp, 		
			(SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 17 AND document_check_list.doc_file_name != '') AS ComPro,	users.user_name as saleagent, count(sales_followup.sf_id) as sfid  
			FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN business_tasks ON business_tasks.bt_bsn_id = business.bsn_id
			LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN sales_followup ON sales_followup.sf_pid = business.bsn_id 
			WHERE business.bsn_sub_status = 'Open' $ptwhere AND project_type.pt_id = 6
			GROUP BY business.bsn_id ORDER BY business.bsn_status_sys_date ASC ";
						
$qaData = $fwDb->query($sql);
$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0">
	<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Tasks Count</strong></th>
		<th><strong><br>Days in System</strong></th>
		<th><strong><br>Initial Call</strong></th>
		<th><strong><br>Booked</strong></th>
		<th><strong><br>Com App</strong></th>
		<th><strong><br>Com Pro</strong></th>
		<th width="10%"><strong><br>Project Value</strong></th>
		<th><strong><br>Project Profit</strong></th>
		<th width="10%"><strong><br>Sales Person</strong></th>
	</tr>';	

$numrows =0;
	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$sfsql = "SELECT sf_id, sf_source FROM sales_followup WHERE sf_source = 4 AND sf_pid = {$bsn_id}";
				$sfData = $fwDb->query($sfsql);
				$sftext = "Yes";
				if(empty($sfData))
					{
					$sfsql = "SELECT count(sf_id) as sfids FROM sales_followup WHERE sf_pid = {$bsn_id}";
					$sfData = $fwDb->queryOne($sfsql);
					$sftext = "No - ".$sfData['sfids'];	
					}		
				$bsn_name = $v1['bsn_name'];
				
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }
				if($v1['booked'] && $v1['ComApp']): $Comappdays = daysDifference($v1['ComApp'], $v1['booked']); endif;
				if($v1['ComPro'] && $v1['ComApp']): $Comprodays = daysDifference($v1['ComPro'], $v1['ComApp']); endif;
				
				$rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
			<!--<td>'.$v1['bsn_address']." ".$v1['bsn_suburb']." ".$v1['bsn_state'].",<br> ".$v1['bsn_pcode'].'</td>-->
				<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
				<td>'.$v1['totaltasks'].'/'.$v1['compltotal'].'</td>
				<td>'. changedate_d_m_Y($v1['bsn_status_sys_date'])."<br>".daysDifference(date("Y-m-d"), $v1['bsn_status_sys_date']).' day(s) </td>
				<td>'.$sftext.'</td>
				<td>'.(($v1['booked']) ? changedate_d_m_Y($v1['booked'])."<br>(".daysDifference($v1['booked'], $v1['bsn_status_sys_date']).") day(s)": "No").'</td>
				<td>'.(($v1['ComApp']) ? changedate_d_m_Y($v1['ComApp'])."<br> (".$Comappdays.") day(s)": "No").'</td>
				<td>'.(($v1['ComPro']) ? changedate_d_m_Y($v1['ComPro'])."<br> (".$Comprodays.") day(s)" : "No").'</td>
				<td>'.(($v1['bsn_advertLink']) ? "$".cleacn_numdec($v1['bsn_advertLink']) : "NA").'</td>
				<td>'.(($v1['bsn_cd_turnover']) ? "$".cleacn_numdec($v1['bsn_cd_turnover']) : "NA").'</td>
				<td>'.$v1['saleagent'].'</td>
			   </tr>';
			   $numrows++;		
					}
															
if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Convert Project Daily Task Summary - Kithome porojects');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();
//$pdf->writeHTML($html, true, false, true, false, '');
foreach($rowdatas as $tval):

$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;
$pdf->writeHTML($body, true, false, true, false, '');		
endforeach;			
			
$fileusername = str_replace(" ", "_", $fname);			
$filename = strtolower($fileusername.date('His').'.pdf');
//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;
		}
		
////////////////////////////////////////////////////////////////////////


function Preparation_and_Planning_Daily_Task_Summary($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		$fname = str_replace(" ", "_", $reporttype)."_";	
		
		if($project_type > 0){ $ptwhere =" AND business.bsn_type = ".$project_type; }
		if($project_status > 0){ $ptwhere .=" AND business.bsn_status = ".$project_status; }
		if($gen_user_id > 0){ $ptwhere .=" AND business.bsn_sales_user_id = ".$gen_user_id; }
		if($deffdate > 0){ $ptwhere .=" AND business.bsn_status_sys_date BETWEEN CURDATE() - INTERVAL {$deffdate} DAY AND CURDATE() "; }
		
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover, business.bsn_approval_type, business.bsn_readyforsale, busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, business_sellers.bs_customers_name, 
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_status_id = 2) AS totaltasks,
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_complete = 1 AND business_tasks.bt_task_status_id = 2) AS compltotal,	(SELECT business_tasks.bt_completed_date FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_id = 49 AND business_tasks.bt_complete = 1) AS booked, (SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3 AND document_check_list.doc_file_name != '') AS ComApp, 		
			(SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 12 AND document_check_list.doc_file_name != '') AS ComPro,	users.user_name as saleagent, count(sales_followup.sf_id) as sfid, project_money.pm_5per_amt, project_money.pm_5per_note, project_money.pm_date FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN business_tasks ON business_tasks.bt_bsn_id = business.bsn_id
			LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN sales_followup ON sales_followup.sf_pid = business.bsn_id
			LEFT JOIN project_money ON project_money.pm_business_id = business.bsn_id
			WHERE business.bsn_sub_status = 'Open' $ptwhere 
			GROUP BY business.bsn_id ORDER BY business.bsn_status_sys_date ASC";	
					
$qaData = $fwDb->query($sql);

$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0" border="1">
		<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Status Task Count</strong></th>
		<th><strong><br>Contract Signed </strong></th>
		<th><strong><br>Approval Required </strong></th>
		<th><strong><br>5% Paid</strong></th>
		<th><strong><br>Projected Start Date </strong></th>
		<th width="10%"><strong><br>Project Value</strong></th>
		<th><strong><br>Project Profit</strong></th>
		<th width="10%"><strong><br>Sales Person</strong></th></tr>';	
$numrows =0;
	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$sfsql = "SELECT sf_id, sf_source FROM sales_followup WHERE sf_source = 4 AND sf_pid = {$bsn_id}";
				$sfData = $fwDb->query($sfsql);
				$sftext = "Yes";
				
				if(empty($sfData))
					{
					$sfsql = "SELECT count(sf_id) as sfids FROM sales_followup WHERE sf_pid = {$bsn_id}";
					$sfData = $fwDb->queryOne($sfsql);
					//$sfData['sfids'];
					$sftext = "No";
					}
				$bsn_approval_type = "No";
				$pm_5per_amt = "No";
				if($v1['bsn_readyforsale'] == 1): 
				if($v1['bsn_approval_type'] == 1){ $bsn_approval_type = "Building Approval";}elseif($v1['bsn_approval_type'] == 2){ $bsn_approval_type = "Development Approval"; }	
				endif;			
				$bsn_name = $v1['bsn_name'];	
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }
				
				if($v1['booked'] && $v1['ComApp']): $Comappdays = daysDifference($v1['ComApp'], $v1['booked']); endif;
				if($v1['booked'] && $v1['ComPro']): $Comprodays = daysDifference($v1['ComPro'], $v1['booked']); endif;
				if($v1['pm_5per_amt'] && $v1['pm_5per_amt'] > 0): $pm_5per_amt = "Yes"; endif;						
				$rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
				<!--<td>'.$v1['bsn_address']." ".$v1['bsn_suburb']." ".$v1['bsn_state'].",<br> ".$v1['bsn_pcode'].'</td>-->
				<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
				<td>'.$v1['totaltasks'].'/'.$v1['compltotal'].'</td>
				<td>'.(($v1['ComPro']) ? "Yes" : "No").'</td>
				<td>'.$bsn_approval_type.'</td>
				<td>'.$pm_5per_amt.'</td>
				<td>'.(($v1['ComApp']) ? changedate_d_m_Y($v1['ComApp'])."<br> (".$Comappdays.") ": "No").'</td>
				<td>'.(($v1['bsn_advertLink']) ? "$".cleacn_numdec($v1['bsn_advertLink']) : "NA").'</td>
				<td>'.(($v1['bsn_cd_turnover']) ? "$".cleacn_numdec($v1['bsn_cd_turnover']) : "NA").'</td>
				<td>'.$v1['saleagent'].'</td>
				</tr>'; 
				$numrows++;			
					}		
		if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}	
			
//$rowheader .='</table>';
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}	
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');	
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Convert Project Daily Task Summary');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

foreach($rowdatas as $tval):
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;

$pdf->writeHTML($body, true, false, true, false, '');
			//Close and output PDF document
endforeach;				//Close and output PDF document

$fileusername = str_replace(" ", "_", $fname);			
$filename = strtolower($fileusername.date('His').'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;

		}

//////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////

function Construction_Report_Summary($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		$fname = str_replace(" ", "_", $reporttype)."_";	
		
		if($project_type > 0){ $ptwhere =" AND business.bsn_type = ".$project_type; }
		if($project_status > 0){ $ptwhere .=" AND business.bsn_status = ".$project_status; }
		if($gen_user_id > 0){ $ptwhere .=" AND business.bsn_sales_user_id = ".$gen_user_id; }
		if($deffdate > 0){ $ptwhere .=" AND business.bsn_status_sys_date BETWEEN CURDATE() - INTERVAL {$deffdate} DAY AND CURDATE() "; }
				
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover, business.bsn_approval_type, business.bsn_readyforsale, 			
			busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, business_sellers.bs_customers_name, 
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_status_id = 3) AS totaltasks,
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_complete = 1 AND business_tasks.bt_task_status_id = 3) AS compltotal,	(SELECT business_tasks.bt_completed_date FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_id = 49 AND business_tasks.bt_complete = 1) AS booked, (SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3 AND document_check_list.doc_file_name != '') AS ComApp, 		
			(SELECT document_check_list.doc_date_uploaded FROM document_check_list 
			WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 12 AND document_check_list.doc_file_name != '') AS ComPro,
			users.user_name as saleagent, count(sales_followup.sf_id) as sfid, project_money.pm_45per_amt, project_money.pm_45per_note, project_money.pm_date
			FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN business_tasks ON business_tasks.bt_bsn_id = business.bsn_id
			LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN sales_followup ON sales_followup.sf_pid = business.bsn_id 
			LEFT JOIN project_money ON project_money.pm_business_id = business.bsn_id
			WHERE business.bsn_sub_status = 'Open' $ptwhere
			GROUP BY business.bsn_id ORDER BY business.bsn_status_sys_date ASC";							
			
$qaData = $fwDb->query($sql);

$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0" border="1">
	<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Status Task Count</strong></th>
		<th><strong><br>Approval Required </strong></th>
		<th><strong><br>Start Date</strong></th>
		<th><strong><br>Total Days/hours Allocated</strong></th>
		<th width="10%"><strong><br>Finished Date</strong></th>
		<th><strong><br>45% Paid</strong></th>
		<th width="10%"><strong><br>Team Leader Accountable</strong></th>
</tr>';	
$numrows =0;	
	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$bsn_approval_type = "No";
				if($v1['bsn_readyforsale'] == 1): 
				if($v1['bsn_approval_type'] == 1){ $bsn_approval_type = "Building Approval";}elseif($v1['bsn_approval_type'] == 2){ $bsn_approval_type = "Development Approval"; }	
				endif;			
				$bsn_name = $v1['bsn_name'];	
				$pm_45per_amt = "No";
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }
				
				if($v1['booked'] && $v1['ComApp']): $Comappdays = daysDifference($v1['ComApp'], $v1['booked']); endif;
				if($v1['booked'] && $v1['ComPro']): $Comprodays = daysDifference($v1['ComPro'], $v1['booked']); endif;
				if($v1['pm_45per_amt'] && $v1['pm_45per_amt'] > 0): $pm_45per_amt = "Yes"; endif;															
				$rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
				<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
				<td>'.$v1['totaltasks'].'/'.$v1['compltotal'].'</td>
				<td>'.$bsn_approval_type.'</td>
				<td>'.(($v1['ComApp']) ? changedate_d_m_Y($v1['ComApp']): "NA").'</td>
				<td>NA</td>
				<td>NA</td>
				<td>'.$pm_45per_amt.'</td>
				<td>'.$v1['saleagent'].'</td>
				</tr>';
				 	$numrows++;			
					}		
		if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}								
//$rowheader .='</table>';
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' Production Report - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Convert Project Daily Task Summary');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

foreach($rowdatas as $tval):
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype Report</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;

$pdf->writeHTML($body, true, false, true, false, '');
			//Close and output PDF document
endforeach;				//Close and output PDF document
		//Close and output PDF document
$fileusername = str_replace(" ", "_", $fname);
$fileusername = str_replace(".", "", $fname);				
$filename = strtolower($fileusername.date('His').'.pdf');
//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;
		}
//////////////////////////////////////////////////////////////////////


function New_Projects_Daily_Report($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address, business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover, business.bsn_approval_type, business.bsn_readyforsale, business_sellers.bs_customers_id, users.user_name as saleagent, usersC.user_name as creatorname, project_type.pt_id,project_type.pt_name, enquirysource.soe_name, bus_customers.bcust_fname, bus_customers.bcust_lname  
			FROM business 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN users AS usersC ON usersC.user_id = business.bsn_user_id
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN enquirysource ON business.bsn_cd_enquiry_source = enquirysource.soe_id 
			WHERE business.bsn_sub_status = 'Open' AND business.bsn_status_date > DATE_SUB(CURDATE(), INTERVAL 2 DAY)
			GROUP BY business.bsn_id ORDER BY business.bsn_status_date ASC";
													
$qaData = $fwDb->query($sql);
$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0" border="1">
	<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Customer Name</strong></th>
		<th><strong><br>Date Added On GCON </strong></th>
		<th><strong><br>Enquiry Source</strong></th>
		<th><strong><br>Created User</strong></th>
		<th width="10%"><strong>Sales Agent</strong></th>
</tr>';		
$numrows =0;

	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$bsn_name = $v1['bsn_name'];		
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }												
	 			$rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
				<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
				<td>'.$v1['bcust_fname'].' '.$v1['bcust_lname'].'</td>
				<td>'.changedate_d_m_Y($v1['bsn_status_date']).'</td>
				<td>'.$v1['soe_name'].'</td>
				<td>'.$v1['creatorname'].'</td>
				<td>'.$v1['saleagent'].'</td>
				</tr>';
				$numrows++;	 				
					}		
		if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}				
//$rowheader .='</table>';
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Construction Complete Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

foreach($rowdatas as $tval):
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;

$pdf->writeHTML($body, true, false, true, false, '');
			//Close and output PDF document
endforeach;				//Close and output PDF document
		//Close and output PDF document
$fileusername = str_replace(" ", "_", $fname);			
$filename = strtolower($fileusername.date('His').'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;

		}
function Construction_Complete_Report($reporttype, $project_type =0, $project_status = 0, $gen_user_id = 0, $deffdate = 0)
		{
		$fwDb = new Fw_Db();
		$fname = str_replace(" ", "_", $reporttype)."_";	
		if($project_type > 0){ $ptwhere =" AND business.bsn_type = ".$project_type; }
		if($project_status > 0){ $ptwhere .=" AND business.bsn_status = ".$project_status; }
		if($gen_user_id > 0){ $ptwhere .=" AND business.bsn_sales_user_id = ".$gen_user_id; }
		if($deffdate > 0){ $ptwhere .=" AND business.bsn_status_sys_date BETWEEN CURDATE() - INTERVAL {$deffdate} DAY AND CURDATE() "; }
				
$sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_status,business.bsn_sub_status,business.bsn_status_date,business.bsn_status_sys_date,business.bsn_type,business.bsn_address,
			business.bsn_suburb_id,business.bsn_suburb,business.bsn_state,business.bsn_pcode,business.bsn_advertLink,business.bsn_cd_turnover, business.bsn_approval_type, business.bsn_readyforsale, 			
			busness_status.st_id,busness_status.st_name, project_type.pt_id,project_type.pt_name, business_sellers.bs_customers_name, 
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_status_id = 3) AS totaltasks,
			(SELECT COUNT(*) FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_complete = 1 AND business_tasks.bt_task_status_id = 3) AS compltotal,
			(SELECT business_tasks.bt_completed_date FROM business_tasks WHERE business_tasks.bt_bsn_id = business.bsn_id AND business_tasks.bt_task_id = 49 AND business_tasks.bt_complete = 1) AS booked, (SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3 AND document_check_list.doc_file_name != '') AS ComApp, 		
			(SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 12 AND document_check_list.doc_file_name != '') AS ComPro,

			(SELECT document_check_list.doc_date_uploaded FROM document_check_list WHERE document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 13 AND document_check_list.doc_file_name != '') AS WalkthroughSO,
			
			users.user_name as saleagent, count(sales_followup.sf_id) as sfid, project_money.pm_50per_amt, project_money.pm_50per_note, project_money.pm_date  
			FROM business 
			LEFT JOIN busness_status ON business.bsn_status = busness_status.st_id 
			LEFT JOIN project_type ON business.bsn_type = project_type.pt_id 
			LEFT JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN business_tasks ON business_tasks.bt_bsn_id = business.bsn_id
			LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id
			LEFT JOIN users ON users.user_id = business.bsn_sales_user_id
			LEFT JOIN sales_followup ON sales_followup.sf_pid = business.bsn_id 
			LEFT JOIN project_money ON project_money.pm_business_id = business.bsn_id
			WHERE business.bsn_sub_status = 'Open' $ptwhere AND project_type.pt_id != 6
			GROUP BY business.bsn_id ORDER BY business.bsn_status_sys_date ASC ";							
				
$qaData = $fwDb->query($sql);
$rowheader = '<table class="first" width="92%" cellspacing="0" cellpadding="0" border="1">
	<tr><th width="10%"><strong><br>Project Type</strong></th>
		<th width="20%"><strong><br>Project Name</strong></th>
		<th><strong><br>Status Task Count</strong></th>
		<th><strong><br>Walk Through SO </strong></th>
		<th><strong><br>50% Paid</strong></th>
		<th><strong><br>Photos Taken</strong></th>
		<th width="10%"><strong>Customer Survey Completed</strong></th>
		<th><strong><br>Posted on website</strong></th>
</tr>';		
$numrows =0;

	foreach($qaData as $k1 => $v1)
					{
				$bsn_id = $v1['bsn_id'];
				$bsn_approval_type = "No";
				$pm_50per_amt = "No";
				
				if($v1['WalkthroughSO']){ $WalkthroughSO = "Yes";}else{ $WalkthroughSO = "No";}			
				$bsn_name = $v1['bsn_name'];
					
				if($numrows == 8 && !empty($rowdata)){ $rowdatas[]= $rowheader.$rowdata.'</table>'; $rowdata =''; $numrows =0; }				
				if($v1['booked'] && $v1['ComApp']): $Comappdays = daysDifference($v1['ComApp'], $v1['booked']); endif;
				if($v1['booked'] && $v1['ComPro']): $Comprodays = daysDifference($v1['ComPro'], $v1['booked']); endif;
				if($v1['pm_50per_amt'] && $v1['pm_50per_amt'] > 0): $pm_50per_amt = "Yes"; endif;													
	 $rowdata .='<tr><td>'.$v1['pt_name'].' - '.$v1['bsn_sub_status'].'</td>
				<td><a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'">'.$v1['bsn_name'].'</a></td>
				<td>'.$v1['totaltasks'].'/'.$v1['compltotal'].'</td>
				<td>'.$WalkthroughSO.'</td>
				<td>'.$pm_50per_amt.'</td>
				<td>NA</td>
				<td>NA</td>
				<td>'.(($v1['bsn_advertLink']) ? "$".cleacn_numdec($v1['bsn_advertLink']) : "NA").'</td>
				</tr>';
				$numrows++;	 				
					}		
		if($rowdata){ $rowdatas[] = $rowheader.$rowdata.'</table>';}				
//$rowheader .='</table>';
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');
$PDF_PAGE_ORIENTATION = "L";
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
  
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
		if ($this->getRTL()) {
			$this->SetX($this->original_rMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
		} else {
			$this->SetX($this->original_lMargin);
			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
		}
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}   

$today = date('d/m/Y');

$headtext = $reporttype." - ".$username. " ".$today;			
	
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('User '.$reporttype.' - '.SET_PDF_AUTHOR);
$pdf->SetSubject('Construction Complete Report');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));;
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

// add a page
//$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

//$pdf->writeHTML($html, true, false, true, false, '');

foreach($rowdatas as $tval):
$body = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFFFAA;
    }
    table.first {
        color: #000;
        font-family: Arial;
        font-size: 9pt;
        border: 1px solid #333;
        background-color: #FFF;
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 30px;
		text-align:center;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 1px solid #333;
        background-color: #ffffee;
		height: 40px;
		text-align:center;
    }
    td.first {
        width:50px;
    }
	 td.second {
        width:100px;
    }
    div.test {
        color: #CC0000;
        background-color: #fff;
        font-family: helvetica;
        font-size: 16pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test">$reporttype</div><br>
$tval
<br />
EOF;
if($tval): $pdf->AddPage(); endif;

$pdf->writeHTML($body, true, false, true, false, '');
			//Close and output PDF document
endforeach;				//Close and output PDF document
		//Close and output PDF document
$fileusername = str_replace(" ", "_", $fname);			
$filename = strtolower($fileusername.date('His').'.pdf');

//Close and output PDF document
$filenamepath = BASE_DIR.FILE_PATH."files/user_reports/".$filename;
$pdf->Output($filenamepath , 'F');
//return BASE_URL."files/user_reports/".$filename;
return $filename;

		}

//////////////////////////////////////////////////////////////////////

function access_gdrive(){				
require_once LIB_DIR.'src/Google_Client.php';
require_once LIB_DIR.'src/contrib/Google_DriveService.php';
$file = BASE_DIR.'gauth/client_secrets.json';
$client = new Google_Client();
$drive = new Google_DriveService($client);
//unset($_SESSION['token']);
if (isset($_SESSION['token'])) {  $client->setAccessToken($_SESSION['token']); }
if ($client->getAccessToken()) { $_SESSION['token'] = $client->getAccessToken();} 
else { $authUrl = $client->createAuthUrl();
  print "<a href='$authUrl' target='_parent'>Connect Me!</a>";
}
return $drive;
}							

function insertFile($service, $title, $description, $parentId, $mimeType, $filename) {
  $file = new Google_DriveFile();
  $file->setTitle($title);
  $file->setDescription($description);
  $file->setMimeType($mimeType);
  try {
    $data = file_get_contents($filename);
    $createdFile = $service->files->insert($file, array(
      'data' => $data,
      'mimeType' => $mimeType,
	  'convert' => true,
    ));
    // Uncomment the following line to print the File ID
    // print 'File ID: %s' % $createdFile->getId();
	$fileId =  $createdFile['id'];
  // Set the parent folder.
    if ($parentId != null) {
     $newParent = new Google_ParentReference();
  $newParent->setId($parentId);
  try {
    $service->parents->insert($fileId, $newParent);
  } catch (Exception $e) {
    print "An error occurred: " . $e->getMessage();
  }
    }
    return $createdFile;
  } catch (Exception $e) {
    print "An error occurred: " . $e->getMessage();
  }
}

function printFile($service, $fileId) {
  try {
    $file = $service->files->get($fileId);
	return $file;    
  } catch (Exception $e) {
    // print "An error occurred: " . $e->getMessage();
  }
}
