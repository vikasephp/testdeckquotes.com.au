<?php
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$user_id = $fwRequest->getparam('user_id', 0);
if($user_id > 0)
{
$sql2 = "Select * from users where user_id = " .$user_id;
$show_Data = $fwDb->query($sql2);
$fwViewData['show_Data'] = $show_Data;

}
