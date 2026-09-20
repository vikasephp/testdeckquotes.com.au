<?php

require_once(LIB_DIR . 'auth/GroupAuth.php');

class Fw_Auth_Group extends GroupAuth
{
    private static $instance;
    
    public function __construct()
    {
        $auth_options = array();
        $auth_options = array();
        $auth_options['usersTable'] = 'users';
        $auth_options['userIdField'] = 'user_id';
        $auth_options['usernameField'] = 'user_username';
        $auth_options['passwordField'] = 'user_password';
        $auth_options['groupsTable'] = 'groups';
        $auth_options['groupIdField'] = 'group_id';
        $auth_options['groupNameField'] = 'group_name';
        $auth_options['usersGroupsTable'] = 'users_groups';
        $auth_options['cacheLevel'] = AUTH_NO_CACHE;
        
        parent::__construct($auth_options);
    
        $this->dbdriver = DB_TYPE;
        $this->hostname = DB_HOST;
        $this->username = DB_USER;
        $this->password = DB_PASS;
        $this->database = DB_NAME;
        
        $this->startSession();
    }
    
    public function __clone()
    {
       throw new Exception("Sorry, __CLASS__ object cloning is not allowed!");
    }
        
    public static function getInstance() 
    {
        if (!isset(self::$instance))
        {
            $className = __CLASS__;
            self::$instance = new $className;
        }
            
        return self::$instance;
    }
    
    public function forceLogin()
    {
        $protected_url = 'http';
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on')
        {
            $protected_url .= 's';
        }
        $protected_url .= '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']; 
        
        $this->_options['redirect'] = $protected_url;
        
        parent::forceLogin();
    }
    
    public function _callback($action, $message = '')
    {
        global $XFA;
        
        $protected_url = 'http';
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on')
        {
            $protected_url .= 's';
        }
        $protected_url .= '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']; 
        
        $protected_relative_url = str_replace(BASE_URL, '', $protected_url);
        
        Location(BASE_URL . $XFA['login'] . '/r/' . $protected_relative_url);
    }
}