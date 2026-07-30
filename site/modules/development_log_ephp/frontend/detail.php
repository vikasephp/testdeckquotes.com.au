<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	if($_FILES['test_video_1']['name'])
		{
				$docfile_1 = $_FILES['test_video_1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['test_video_1']['tmp_name'];
				$detail['de_test_video_1'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
		}
	
	  if($_FILES['test_video_2']['name'])
		{
				$docfile_2 = $_FILES['test_video_2']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['test_video_2']['tmp_name'];
				$detail['de_test_video_2'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
		}
		
		  if($_FILES['test_video_3']['name'])
		{
				$docfile_3 = $_FILES['test_video_3']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['test_video_3']['tmp_name'];
				$detail['de_test_video_3'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
		}
		
	  if($_FILES['test_video_4']['name'])
		{
				$docfile_4 = $_FILES['test_video_4']['name'];
				$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$temp_name_4 = $_FILES['test_video_4']['tmp_name'];
				$detail['de_test_video_4'] = $docfile_4;
				upload($docfile_4, $temp_name_4);
				
		}
		
		
	  if($_FILES['test_video_5']['name'])
		{
				$docfile_5 = $_FILES['test_video_5']['name'];
				$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$temp_name_5 = $_FILES['test_video_5']['tmp_name'];
				$detail['de_test_video_5'] = $docfile_5;
				upload($docfile_5, $temp_name_5);
				
		}
		
	  if($_FILES['test_video_6']['name'])
		{
				$docfile_6 = $_FILES['test_video_6']['name'];
				$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
				$temp_name_6 = $_FILES['test_video_6']['tmp_name'];
				$detail['de_test_video_6'] = $docfile_6;
				upload($docfile_6, $temp_name_6);
		}
		
		if($_FILES['test_video_7']['name'])
		{
				$docfile_7 = $_FILES['test_video_7']['name'];
				$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
				$temp_name_7 = $_FILES['test_video_7']['tmp_name'];
				$detail['de_test_video_7'] = $docfile_7;
				upload($docfile_7, $temp_name_7);
		}
	
    if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
    	}
	else
	{	
		 $opr = $tableqa->insertRow($detail); 
	}    	
    
  //  $fwViewData['opr'] = $opr;
		
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
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	