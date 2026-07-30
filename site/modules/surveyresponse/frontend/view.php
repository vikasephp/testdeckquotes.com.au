<?php

$id = $fwRequest->getparam('id', '');
if($id>0)
{
$sql2 = "Select * from survey_data where res_respondent_id = " .$id;
$show_Data = $fwDb->query($sql2);
$fwViewData['show_Data'] = $show_Data;
}

