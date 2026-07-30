<?php
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$user_id = $fwRequest->getparam('user_id', 0);
	if($user_id > 0)
		{
		 if($user_id > 0)
			{
			$sql="SELECT customers.*, users.*, users_groups.user_id , users_groups.group_id, positions.p_name
			FROM users LEFT JOIN users_groups ON users.user_id = users_groups.user_id 
			LEFT JOIN customers ON users.user_id = customers.user_id
			LEFT JOIN positions ON positions.p_id = customers.customer_positions			
			WHERE users.user_id= $user_id"; 
			
			$show_Data = $fwDb->queryOne($sql);		 
			$fwViewData['detail'] = $show_Data;
			}
	$fwViewData['show_Data'] = $show_Data;
}