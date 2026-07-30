<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table($TABLE2);
$this_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('upload', array());
		if($_FILES['upload'])
			{
			$docfile = $_FILES['upload']['name'];
			$file_type = $_FILES['upload']['type'];
								
								$datetime = trim(date('d_m_Y_H_i_'),'0');
								$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
								$src = $_FILES['upload']['tmp_name'];
								
								upload($docfile, $src);
			
								$docs['bid_name'] = $docfile;
								$docs['bid_type'] = $file_type;
								$docs['bid_size'] = $_FILES['docs']['size'];
								$docs['bid_insert_date'] = date('Y-m-d H:i');
								
			
			}
	$detail[$ID2] =  $detail[$ID];
 	$tabledocs->insertRow($detail);             			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if ($this_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".".$ID." = ". $this_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}