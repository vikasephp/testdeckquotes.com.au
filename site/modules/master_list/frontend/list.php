<?php

//$sql = "select * from survey_data where survey_data.res_id IN (Select survey_data.res_id+10 from survey_data 
//		where survey_data.res_respondent_id = survey_data.res_column_value) OR survey_data.res_id IN (Select survey_data.res_id+11 from survey_data 
//		where survey_data.res_respondent_id = survey_data.res_column_value) OR survey_data.res_id IN (Select survey_data.res_id+17 from survey_data 
//		where survey_data.res_respondent_id = survey_data.res_column_value)";

$sql  = "select distinct res_respondent_id from survey_data";

		
$surveyData = $fwDb->query($sql);


$fwViewData['surveyData'] = $surveyData;

?>



