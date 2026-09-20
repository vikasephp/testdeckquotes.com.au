<?php

$submit = $fwRequest->getParam('subChangePassword', '');

if (!empty($submit))
{
    $old_password = $fwRequest->getParam('old_password', '');
    $new_password = $fwRequest->getParam('new_password', '');
    $confirm_password = $fwRequest->getParam('confirm_password', '');
    
    $fwViewData['error'] = '';
    $fwViewData['old_password'] = $old_password;
    $fwViewData['new_password'] = $new_password;
    $fwViewData['confirm_password'] = $confirm_password;
    
    if (empty($old_password) || empty($new_password) || empty($confirm_password))
    {
        $fwViewData['error'] = 'Invalid data';
    }
    
    if (empty($fwViewData['error']) && ($new_password != $confirm_password))
    {
        $fwViewData['error'] = 'New Password and Confirm Password do not match';
    }
    
    if (empty($fwViewData['error']))
    {
        $md5_old_password = md5($old_password);
        $safe_old_password = $fwDb->escape($md5_old_password);
        
        $tableUsers = new Fw_Db_Table('users');
        $tableUsers->setWhere("user_id = {$_SESSION['user']['user_id']} AND user_password = $safe_old_password");
        $user = $tableUsers->getRow();
        
        if (count($user) > 0)
        {
            $data = array();
            $data['user_password'] = md5($new_password);
            $tableUsers->setWhere("user_id = {$_SESSION['user']['user_id']} AND user_password = $safe_old_password");
            $tableUsers->updateRow($data);
            
            $fwViewData['error'] = 'Your password has been changed successfully';
        }
        else
        {
            $fwViewData['error'] = 'The Old Password you specified seems to be invalid';
        }
    }
}

$fwViewData['title'] = 'Change Password';