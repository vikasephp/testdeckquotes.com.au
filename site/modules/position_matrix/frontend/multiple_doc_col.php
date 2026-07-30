<?php
$fwMainView = 'file:' . getcwd() . '/multiple_doc_col.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$pm_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['pm_id'] = $pm_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('pm', array());

	$this_id=$detail[$ID];
	unset($detail[$ID]);

		
		if($_FILES['extra1']['name'])
		{
				
				$docfile_1 = $_FILES['extra1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['extra1']['tmp_name'];
				$detail['pm_extra_doc1'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
						
		}	
	
	if($_FILES['extra2']['name'])
		{
				
				$docfile_2 = $_FILES['extra2']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['extra2']['tmp_name'];
				$detail['pm_extra_doc2'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
						
		}	
	
	
	if($_FILES['extra3']['name'])
		{
				
				$docfile_3 = $_FILES['extra3']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['extra3']['tmp_name'];
				$detail['pm_extra_doc3'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
				
						
		}	
	
	
	if($_FILES['extra4']['name'])
		{
				
				$docfile_4 = $_FILES['extra4']['name'];
				$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$temp_name_4 = $_FILES['extra4']['tmp_name'];
				$detail['pm_extra_doc4'] = $docfile_4;
				upload($docfile_4, $temp_name_4);
						
		}	
	
	
	
	if($_FILES['extra5']['name'])
		{
				
				$docfile_5 = $_FILES['extra5']['name'];
				$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$temp_name_5 = $_FILES['extra5']['tmp_name'];
				$detail['pm_extra_doc5'] = $docfile_5;
				upload($docfile_5, $temp_name_5);
				
						
		}	
	
	
	
	if($_FILES['extra6']['name'])
		{
				
				$docfile_6 = $_FILES['extra6']['name'];
				$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
				$temp_name_6 = $_FILES['extra6']['tmp_name'];
				$detail['pm_extra_doc6'] = $docfile_6;
				upload($docfile_6, $temp_name_6);
				
						
		}	
	
	if($_FILES['extra7']['name'])
		{
				
				$docfile_7 = $_FILES['extra7']['name'];
				$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
				$temp_name_7 = $_FILES['extra7']['tmp_name'];
				$detail['pm_extra_doc7'] = $docfile_7;
				upload($docfile_7, $temp_name_7);
				
						
		}	
	
		if($_FILES['extra8']['name'])
		{
				
				$docfile_8 = $_FILES['extra8']['name'];
				$docfile_8 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_8);
				$temp_name_8 = $_FILES['extra8']['tmp_name'];
				$detail['pm_extra_doc8'] = $docfile_8;
				upload($docfile_8, $temp_name_8);
				
						
		}
		
		if($_FILES['extra9']['name'])
		{
				$docfile_9 = $_FILES['extra9']['name'];
				$docfile_9 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_9);
				$temp_name_9 = $_FILES['extra9']['tmp_name'];
				$detail['pm_extra_doc9'] = $docfile_9;
				upload($docfile_9, $temp_name_9);
				
						
		}
		
		if($_FILES['extra10']['name'])
		{
				$docfile_10 = $_FILES['extra10']['name'];
				$docfile_10 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_10);
				$temp_name_10 = $_FILES['extra10']['tmp_name'];
				$detail['pm_extra_doc10'] = $docfile_10;
				upload($docfile_10, $temp_name_10);
				
						
		}
		
		
			if($this_id)
				{
					
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
													
				 			$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($pm_id)) {
	
	$tableDocuments->setWhere($ID." = ".$pm_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}
$tablePositions = new Fw_Db_Table('positions');
$fwViewData['positions'] = $tablePositions->getRows();
$fwViewData['title'] = 'Multiple Doc Col Content';

$mdc_sql = "SELECT * FROM position_matrix_multiple_docs where pmmd_pm_id = ".$pm_id;
if($mdc_sql){
	$mdcData = $fwDb->query($mdc_sql);
	$fwViewData['mdc'] = $mdcData;
}