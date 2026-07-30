<?php
$fwMainView = 'file:' . getcwd() . '/contacts_detail.tpl';
$tableqa = new Fw_Db_Table('contacts');
$this_id = $fwRequest->getParam('cs_id', '');


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
        $detail = $fwRequest->getParam('contacts', array());
	$this_id = (int)$detail['cs_id'];
	
	$cdata = explode('|',$detail['cs_company']);
	
	$detail['cs_notes'] = stripslashes($detail['cs_notes']);
	unset($detail['cs_id']);
	
	$fn = $detail['cs_first_name'];
	$sn = $detail['cs_surname'];
	$co = $cdata[0];
	
	$tableqa->setWhere("cs_first_name = '".$fn."' AND cs_surname = '".$sn."' AND cs_company = ".$co);
	if(!$tableqa->rowExists() OR !empty($this_id))
	{
		if($cdata[0] > 0) {
			if($this_id > 0)
			{
				 $tableqa->setWhere("cs_id = $this_id");
			
				 $opr = $tableqa->updateRow($detail);   
			}
			else
			{
				 $opr = $tableqa->insertRow($detail); 
			}    	
			
			$fwViewData['opr'] = $opr;
		} else {
			$fwViewData['msg'] = "No Matching Company";
			$fwViewData['detail'] = $detail;
		}
	} else {
		
		$fwViewData['msg'] = "Duplicate Entry";
		$fwViewData['detail'] = $detail;
	}
		
}

$this_id = (int)$fwRequest->getParam('cs_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('contacts');
	$tableqa->setWhere("cs_id = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	
	$sql_1 = "select companies.co_id, companies.co_company_name from companies
	          where companies.co_id = ".$detail['cs_company'];
		  
	$comp = $fwDb->queryOne($sql_1);
	
	$sqlP = "Select tm_id from type_master where tm_type = 'Positions'";
	$positions = $fwDb->queryOne($sqlP);
	
	$sqlPos = "Select * from type_options where to_id = ".$detail['cs_position'];;
	
	
	$posvalue = $fwDb->queryOne($sqlPos);
	

	
	$fwViewData['cname']    = $comp['co_id'].' | '. $comp['co_company_name'];	  
	$fwViewData['position'] = $posvalue['to_id'].' | '. $posvalue['to_option'];
	if($posvalue['to_id'] == 0)
	{
		$fwViewData['position'] = "Others";
	}
      
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

		

$sql_com = "SELECT  * from companies";
$comdata = $fwDb->query($sql_com);
$fwViewData['comdetail'] = $comdata ;	



$sql_cc1 = "SELECT  tm_id from type_master where tm_type like 'Positions%'";
$cc_id = $fwDb->queryOne($sql_cc1);

$sql_pos = "SELECT * from type_options where to_type_id = " .$cc_id['tm_id'];

$posdata = $fwDb->query($sql_pos);

$fwViewData['posdetail'] = $posdata ;

