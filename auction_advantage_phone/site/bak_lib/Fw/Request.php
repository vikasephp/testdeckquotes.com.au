<?php

class Fw_Request
{
    private static $instance;
       
    public function __clone()
    {
        throw new Exception("Sorry, __CLASS__ object cloning is not allowed!");
    }
    
    public static function getInstance() 
    {
        if (!isset(self::$instance))
        {
            $thisClass = __CLASS__;
            self::$instance = new $thisClass;
        }

        return self::$instance;
    }

    public function getParam($param, $default_value = '', $method = 'REQUEST')
    {
        $this_method = '_' . strtoupper(trim($method));
        
        $this_method =& $GLOBALS[$this_method];
        
        $value = isset($this_method[$param]) ? $this_method[$param] : $default_value;
        
        return $value;
    }
    
    public function setParam($param, $value, $method = 'REQUEST')
    {
        $this_method = '_' . strtoupper(trim($method));
                
        $this_method =& $GLOBALS[$this_method];
                
        $this_method[$param] = $value;
        
        if($method == 'GET' || $method == 'POST' || $method == 'COOKIE')
        {
            $_REQUEST[$param] = $value;
        }
        
        return true;
    }
    
	
  public function getParamget($param, $default_value = '', $method = 'GET')
    {
        $this_method = '_' . strtoupper(trim($method));
        
        $this_method =& $GLOBALS[$this_method];
        
        $value = isset($this_method[$param]) ? $this_method[$param] : $default_value;
        
        return $value;
    }
    public function getParams($method = 'REQUEST')
    {
        $this_method = '_' . strtoupper(trim($method));
                        
        $this_method =& $GLOBALS[$this_method];
                
        return $this_method;
    }

    public function setParams($params, $method = 'REQUEST')
    {
        $this_method = '_' . strtoupper(trim($method));
                                
        $this_method =& $GLOBALS[$this_method];
        
        $this_method = array_merge($this_method, $params);
        
        return true;
    }
}

?>