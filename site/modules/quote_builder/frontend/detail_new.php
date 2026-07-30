<?php
$fwMainView = 'file:' . getcwd() . '/detail_new.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$this_id = (int)$fwRequest->getParam($ID, 0);
$submit2 = $fwRequest->getParam('projsubmit', '');

$suppliers = $fwRequest->getParam('supp', '');

if(!empty($suppliers)) {
	
$sqlli = "insert into supplier_temp  (st_supplier) value ('".$suppliers ."')";	 
	$fwDb -> queryOne($sqlli);	
}

if(!empty($submit2))
{

	$prda = $fwRequest->getParam($TABLE, array());
	$projname = $prda['qb_project'];
	
	$sql_id = "Select bsn_id from business name where bsn_name = '".$projname."'";
	$bsn_data = $fwDb->queryOne($sql_id); 
	
	$bsnid = $bsn_data['bsn_id'];
	
	if(!empty($bsnid)) {
		$sql = "SELECT   admin_document_check_list.admin_doc_id, admin_document_check_list.admin_doc_name, document_check_list.doc_file_name FROM admin_document_check_list
			Inner Join document_check_list on admin_document_check_list.admin_doc_id = doc_name_id 		
			WHERE document_check_list.doc_bsn_id = " .$bsnid. " And document_check_list.doc_file_name != '' ";
	
		$fwViewData['docdata'] = $fwDb->query($sql);
	}
	
	$fwViewData['detail'] = $prda;
	$fwViewData['show'] =  $prda['show'];
	
	$consql = "SELECT contacts.* from contacts 
                   Left join companies ON contacts.cs_company = companies.co_id 
	           where companies.co_company_name = '".$prda['qb_supplier']."' and length(contacts.cs_primary_email) > 0";
		     
	$data = $fwDb->query($consql); 
	
	$fwViewData['data'] = $data;	   	
	$fwViewData['detail'] = $prda;	
}

	$sqldef = "select admin_doc_id, admin_doc_name  from admin_document_check_list where admin_qb_default = 1";
	$dataDef = $fwDb->query($sqldef);
	$fwViewData['dataDef'] =  $dataDef;

	if(!empty($dataDef)) {
		$def_doc = "|";
		foreach($dataDef as $kf => $vf)
		{
		
		   $def_doc .= $vf['admin_doc_id']. "|";	
		}
		$fwViewData['def_doc'] = $def_doc;
	}

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	
	$docs = $detail['bsn_document'];
	
	if(!empty($detail['qb_id'])) {
		$sql3 = "Select qb_proj_docs from quote_builder where qb_id = ".$detail['qb_id']; 
		$data2 = $fwDb->queryOne($sql3);
		$doc_id = "";	
	} else {
		$doc_id = "|";
	}
	
	if(!empty($docs)) {
		foreach($docs as $kd => $vd)
		{
		   $d1 = explode("|",$vd);
		   $doc_id .= $d1[0]. "|";	
		}
	}
		
		if(empty($detail['qb_id'])) {
			 $detail['qb_proj_docs'] = $def_doc . $doc_id; 
			 
		} else {
			 $detail['qb_proj_docs'] = $data2['qb_proj_docs'] . $doc_id; 
				
		}
	
	
	$detail['qb_proj_docs'] = str_replace("||","|",$detail['qb_proj_docs']);
	
	if($_FILES['attach_1']['name'])
		{
			$docfile_1 = $_FILES['attach_1']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['attach_1']['tmp_name'];
			$detail['qb_attachment_1'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
		}
	
	if($_FILES['attach_2']['name'])
		{
			$docfile_2 = $_FILES['attach_2']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['attach_2']['tmp_name'];
			$detail['qb_attachment_2'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
		}
		
	if($_FILES['attach_3']['name'])
		{
			$docfile_3 = $_FILES['attach_3']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['attach_3']['tmp_name'];
			$detail['qb_attachment_3'] = $docfile_3;
			upload($docfile_3, $temp_name_3);
		}	
		
	if($_FILES['attach_4']['name'])
		{
			$docfile_4 = $_FILES['attach_4']['name'];
			$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
			$temp_name_4 = $_FILES['attach_4']['tmp_name'];
			$detail['qb_attachment_4'] = $docfile_4;
			upload($docfile_4, $temp_name_4);
		}	
	
		
	if($_FILES['attach_5']['name'])
		{
			$docfile_5 = $_FILES['attach_5']['name'];
			$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
			$temp_name_5 = $_FILES['attach_5']['tmp_name'];
			$detail['qb_attachment_5'] = $docfile_5;
			upload($docfile_5, $temp_name_5);
		}	
	
	if($_FILES['attach_6']['name'])
		{
			$docfile_6 = $_FILES['attach_6']['name'];
			$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
			$temp_name_6 = $_FILES['attach_6']['tmp_name'];
			$detail['qb_attachment_6'] = $docfile_6;
			upload($docfile_6, $temp_name_6);
		}
	
	if($_FILES['attach_7']['name'])
		{
			$docfile_7 = $_FILES['attach_7']['name'];
			$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
			$temp_name_7 = $_FILES['attach_7']['tmp_name'];
			$detail['qb_attachment_7'] = $docfile_7;
			upload($docfile_7, $temp_name_7);
		}
	
	if($_FILES['attach_8']['name'])
		{
			$docfile_8 = $_FILES['attach_8']['name'];
			$docfile_8 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_8);
			$temp_name_8 = $_FILES['attach_8']['tmp_name'];
			$detail['qb_attachment_8'] = $docfile_8;
			upload($docfile_8, $temp_name_8);
		}
	
	if($_FILES['attach_9']['name'])
		{
			$docfile_9 = $_FILES['attach_9']['name'];
			$docfile_9 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_9);
			$temp_name_9 = $_FILES['attach_9']['tmp_name'];
			$detail['qb_attachment_9'] = $docfile_9;
			upload($docfile_9, $temp_name_9);
		}
	
	if($_FILES['attach_10']['name'])
		{
			$docfile_10 = $_FILES['attach_10']['name'];
			$docfile_10 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_10);
			$temp_name_10 = $_FILES['attach_10']['tmp_name'];
			$detail['qb_attachment_10'] = $docfile_10;
			upload($docfile_10, $temp_name_10);
		}
	

	
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	
	$sql_id = "Select bsn_id from business where bsn_name = '".$detail['qb_project']."'";
	$idData = $fwDb->queryOne($sql_id);
	$detail['qb_bsn_id'] = $idData['bsn_id'];
	
	
	foreach($detail['supplier'] as $ks=>$vs)
	        {
	   		$sueml='|';
			foreach($detail['cont'] as $kc=>$vc)
			{
				$cnt = explode("|",$vc);
				if($ks == $cnt[1]) { $sueml .= $cnt[0]. "|"; }
  			}
			
			$detail['qb_supplier_email'] =  $sueml;
			$detail['qb_supplier'] =  $vs;
			$opr = $tableqa->insertRow($detail); 
				
	
		 $tos1 = $detail['qb_supplier_email'];
		 $tos2 = trim($tos1,'|');
		
		
		$tos3 = explode("|",$tos2);
		
		$eml ='';
		foreach($tos3 as $tk=>$tv)
		{
			$eml .= "'".$tv."',";	
		}
		 $eml = trim($eml,',');
				
				
		 $sqlco = "select contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email, companies.co_company_name
		        from contacts Inner Join companies on contacts.cs_company  =  companies.co_id 
			where companies.co_company_name = '".$detail['qb_supplier']."'";
			
		 $sqlco = "select contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email, companies.co_company_name
		        from contacts Inner Join companies on contacts.cs_company  =  companies.co_id 
			where contacts.cs_primary_email IN (".$eml.")";	
		  		
		 $detail_to = $fwDb->query($sqlco); 
		 
		 $sqlcompo = "select qb_component from quote_builder_component where qb_id = ".$detail['qb_component'];
		 $component = $fwDb->queryOne($sqlcompo); 
		 
		 $subject =  "New Quote Request";
		
		 foreach($detail_to as $k => $v)
		 {
		 
			 $to_name = $detail['qb_supplier'];	 
			 $to = $v['cs_primary_email'];
			 $from_name = "Cgfb Inclusion Team";
			 $from = "inclusions@cgfb.com.au";
			 
			 $message = '';
			 $message .= "Dear ".$detail['qb_supplier'].",<br><br>";
			 $message .= "You have received a new quote request for ".$detail['qb_project']." = " . $component['qb_component']."<br>";
			 $message .= "Please proceed to <a href='http://www.constructionquotebuilder.com.au'>.:: ConstructionQuoteBuilder - constructionquotebuilder ::.</a> to review the quote. ";	 
			 $message .= "<br><br>";
			 $message .= "Regards, <br>CGFB Inclusions Team "; 
			
			 // $to = "manojsoniephp@gmail.com";
			
			send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
		 
		 }
	
          }
	  
	 		$stTable = new Fw_Db_Table('supplier_temp');
			$stTable->setWhere("1=1");
			$stTable->deleteRows();
	   	
	         $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
	
	$sql_id = "Select bsn_id from business name where bsn_name = '".$detail['qb_project']."'";
	$bsn_data = $fwDb->queryOne($sql_id); 
	
	$bsnid = $bsn_data['bsn_id'];
	
	if(!empty($bsnid)) {
	$sql = "SELECT   admin_document_check_list.admin_doc_id, admin_document_check_list.admin_doc_name, document_check_list.doc_file_name FROM admin_document_check_list
			Inner Join document_check_list on admin_document_check_list.admin_doc_id = doc_name_id 		
			WHERE document_check_list.doc_bsn_id = " .$bsnid. " And document_check_list.doc_file_name != '' ";
	
		$fwViewData['docdata'] = $fwDb->query($sql);
	}
	
	$docs = "(-1";
	$docs .= str_replace("|",",",$detail['qb_proj_docs']);
	$docs .= "-2)";
	
	$sql_ad = "select admin_doc_id, admin_doc_name  from 
	            admin_document_check_list where admin_doc_id in ".$docs;
	$docs_added = $fwDb->query($sql_ad); 
	$fwViewData['docs_added'] =$docs_added;	   	
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);
		
$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 	

$sql_c = "Select * from companies";
$fwViewData['compdetail'] = $fwDb->query($sql_c);

$sql_st = "Select * from supplier_temp";
$stdetail = $fwDb->query($sql_st);
foreach($stdetail as $k => $v)
{
	
	$consql = "SELECT contacts.*, companies.co_id  from contacts 
	    	   Left join companies ON contacts.cs_company = companies.co_id 
	           where companies.co_company_name = '".$v['st_supplier']."' and length(contacts.cs_primary_email) > 0";
	
	$contactsdetail = $fwDb->query($consql);	
	
	     
	$setdata[$k]['supplier'] = $v['st_supplier'];
	$setdata[$k]['contacts'] = $contactsdetail;
	$setdata[$k]['co_id'] = $contactsdetail[0]['co_id'];	
}
$fwViewData['listnew'] = $setdata;
//db($setdata);

