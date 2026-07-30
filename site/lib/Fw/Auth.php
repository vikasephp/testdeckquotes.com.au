<?php

require_once(LIB_DIR . 'auth/Auth.php');

class Fw_Auth extends Auth
{
    private static $instance;
    
    public function __construct()
    {
        $auth_options = array();
        $auth_options['usersTable'] = 'users';
        $auth_options['userIdField'] = 'user_id';
        $auth_options['usernameField'] = 'username';
        $auth_options['passwordField'] = 'password';
        $auth_options['cacheLevel'] = AUTH_NO_CACHE;
        
        parent::Auth($auth_options);
        
        $fwConfig = Fw_Config::getInstance();
        $config_db = $fwConfig->db->toArray();

        $this->dbdriver = $config_db['adapter'];
        $this->hostname = $config_db['host'];
        $this->username = $config_db['user'];
        $this->password = $config_db['pass'];
        $this->database = $config_db['name'];
        
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
		
		if($action == AUTH_EXPIRED)
		{
			unset($_SESSION['user']);
		}
		
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