<?php
$tableDocCheck = new Fw_Db_Table($TABLE);
$current_business_status = $fwRequest -> getParam('current_business_status','');
$data = $fwRequest -> getParam('data','');

if($data['admin_doc_type'] > 0): 
	$where = " WHERE ".$TABLE.".admin_doc_type = ".$data['admin_doc_type'];
$fwViewData['detail']['admin_doc_type'] = $data['admin_doc_type'];	
 endif;


/**** Begin doc related to business status ***/

	//$sql = "SELECT ".$TABLE.".*, project_type.pt_name from ".$TABLE."
	//        LEFT JOIN project_type ON ".$TABLE.".admin_doc_proj_type = project_type.pt_id ".$where." Order By admin_doc_order ASC";
	    	
	$sql = "SELECT ".$TABLE.".*, project_type.pt_name from ".$TABLE."
	        LEFT JOIN project_type ON ".$TABLE.".admin_doc_proj_type = project_type.pt_id ".$where." Order By admin_doc_order ASC";		
		
		
	$data = $fwDb->query($sql);
	
	
foreach($data as $k=>$v)
{
	$detail =  explode("|",$v['admin_doc_proj_type']);
	$str = '';
	foreach($detail as $k1=>$v1)
	{
		if($v1==2)
			$str .= " - Deck Clean or Oil Project <br>";
		elseif($v1 == 4)
			$str .= " - New Deck Project, Pergola, Outside Building <br>";	
		elseif($v1 == 6)
			$str .= " - Kitome Project. <br>";
		elseif($v1 == 9)
			$str .= " - Secondary Residences <br>";	
		elseif($v1 == 10)
			$str .= " - Renovations <br>";	
		elseif($v1 == 11)
			$str .= " - Minor Projects (less that $5000) <br>";	
							
	}
	
$data[$k]['pt_name'] = $str;
}
	
	$fwViewData['doc'] = $data;	
	
	
/**** End doc related to business status ***/

$msg =  $fwRequest -> getParam('msg','');
if($msg == 1){ $msg = "One Record Updated Successfully"; }
elseif($msg == 2){ $msg = "One Record Inserted Successfully"; }

$fwViewData['msg'] = $msg;
$fwViewData['title'] = $MODULE_PLURAL;

$tableProjecttype = new Fw_Db_Table('project_type');
$tableProjecttype->setWhere("pt_status = 1");
$fwViewData['project_type'] = $tableProjecttype->getRows();