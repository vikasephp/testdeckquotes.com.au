<?php
$fwMainView = 'file:' . getcwd() . '/edit_steps.tpl';

$tableqa = new Fw_Db_Table('action_plan_step_master');
$fwViewData['catlist'] = $tableqa->getRows();