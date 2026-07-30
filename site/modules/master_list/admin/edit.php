<?php

$tablesSurveyData = new Fw_Db_Table('survey_data');
$id = $fwRequest->getparam('res_respondent_id', '');
if($id>0)
{
$sql2 = "Select * from survey_data where res_respondent_id = " .$id;
$edit_Data = $fwDb->query($sql2);
$fwViewData['edit_Data'] = $edit_Data;
}

$submit = $fwRequest->getParam('subAddDetail', '');
$r_id = $fwRequest->getParam('res_respondent_id', '');

if(!empty($submit))
{
 	 $detail = $fwRequest->getParam('response', array());
	  						
									  
											  foreach($detail as $k => $v)
											  {
												 												   
												 $sql = "Update survey_data set res_column_value = '".$v."' Where res_respondent_id =".$r_id." And res_column_name = '".$k."'";
												 $result =  $fwDb->queryOne($sql);
												           
											  }	
															
											
	Location(BASE_URL . $XFA['list']);						
}							
					

if ($r_id> 0)
{
	$tablesSurveyData->setWhere("res_respondent_id = $r_id");
	$detail = $tablesSurveyData->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Survey Response';
}
else
{
    $fwViewData['title'] = 'Add Survey Resonse';
}
