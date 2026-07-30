<?php

$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('customers', array());
    $user_detail = $fwRequest->getParam('users', array());
    
    $user['user_name'] = $detail['customer_name'];
    $user['user_email'] = $detail['customer_email'];
    $user['user_username'] = $user_detail['username'];
    $user['user_password'] = md5($user_detail['password']);
    $tableUsers = new Fw_Db_Table('users');
    $user_id = $tableUsers->insertRow($user);
    
    $group = array();
    $group['user_id'] = $user_id;
    $group['group_id'] = GROUP_CUSTOMERS;
    $tableUsersGroups = new Fw_Db_Table('users_groups');
    $tableUsersGroups->insertRow($group);
    
    $detail['user_id'] = $user_id;
    $thisCustomers = new Fw_Db_Table('customers');
    $thisCustomers->insertRow($detail);
    
    // send email
    $tableUsers->setWhere("user_id = $user_id");
    $user = $tableUsers->getRow();
    
    $subject = SITE_NAME . ': Welcome';
		
    $message = "<pre>
Dear {$user['user_name']} 

Welcome and thank you for registering at " . SITE_NAME . "
        
Your login details are as follows:

Login URL: " . BASE_URL . "site.login
Username: {$user_detail['username']}
Password: {$user_detail['password']}

Happy Shopping!

Thanks,

" . SITE_NAME . "
</pre>";

    sendEmail($user['email'], '', SITE_EMAIL, '', $subject, $message);
    
    Location(BASE_URL . $XFA['login']);
}

$fwViewData['title'] = 'Registration';