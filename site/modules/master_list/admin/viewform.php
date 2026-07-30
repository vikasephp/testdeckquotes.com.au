<?php
$fwMainView = 'file:' . getcwd() . '/viewform.tpl';
$id = $fwRequest->getparam('res_respondent_id', '');
if($id>0)
{
$sql = "Select * from survey_data where res_respondent_id = " .$id;
$show = $fwDb->query($sql);
$fwViewData['show'] = $show;
//db($fwViewData['show']);
}

