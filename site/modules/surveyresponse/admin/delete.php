<?php

$r_id = (int)$fwRequest->getParam('res_respondent_id', 0);

if ($r_id > 0)
{
    $tableSurveyData = new Fw_Db_Table("survey_data");
    $tableSurveyData->setWhere("res_respondent_id = $r_id");
    $tableSurveyData->deleteRows();
}

Location(BASE_URL . $XFA['list']);