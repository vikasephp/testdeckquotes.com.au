<?php

require_once(LIB_DIR . 'adodb/adodb.inc.php');

class Fw_Db
{
    private static $instance;
    private $adodb;
    private $rowCount;
    public $lastInsertId;
    private $rowsAffected;
    
    public function __construct() 
    {
        $this->rowCount = 0;
        $this->lastInsertId = 0;
        $this->rowsAffected = 0;
        
        $this->adodb = ADONewConnection(DB_TYPE);
        $this->adodb->Connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        $this->adodb->SetFetchMode(ADODB_FETCH_ASSOC);
        $this->adodb->setCharset(DB_CHARSET);
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
    
    public function getDatabases()
    {
        return $this->adodb->MetaDatabases();        
    }

    public function getTables()
    {
        return $this->adodb->MetaTables();              
    }

    public function getColumns($table, $metaData = false)
    {
        if ($metaData)
        {
            return $this->adodb->MetaColumns($table);     
        }

        $tmpArray = $this->adodb->MetaColumns($table);

        $columns = array(); //echo "<pre>"; print_r($tmpArray); echo "</pre>";
     
      if(!empty($tmpArray)){
        foreach ($tmpArray as $key=>$value)
        {
            $columns[] = $value->name;
        }
      }

        return $columns;
    }

    public function getPrimaryKeys($table, $metaData = false)
    {
        $tmpArray  = (array)$this->getColumns($table, true);
        
        $primaryKeys = array();
        
        foreach ($tmpArray as $key=>$value)
        {
            if ($value->primary_key)
            {
                if ($metaData)
                {
                    $primaryKeys[] = (array)$value;
                }
                else
                {
                    $primaryKeys[] = $value->name;
                }
            }
        }

        return $primaryKeys;   
    }

    public function getForeignKeys($table)
    {
        return $this->adodb->MetaForeignKeys($table);         
    }

    public function query($sql, $rows = -1, $offset = -1)
    {
        $this->rowCount = 0; $returnDataArr = [];
        
        if ($rows < 0 && $offset < 0)
        {
            $rs = $this->adodb->Execute($sql);
        }
        else
        {
            $rs = $this->adodb->SelectLimit($sql, $rows, $offset);
        }
       
        if(!empty($rs))
        {
           // echo "<br>recordCount ::".  $recordCount = $rs->recordCount();
            $recordCount = $rs->recordCount(); 
        }
      
       if($rs){
           $this->rowCount = $rs->recordCount();
           $returnDataArr =  $rs->GetArray(); 
       }
       // echo "<br>i run ::<pre>"; print_r($returnDataArr);
        return $returnDataArr;
    }
    
    public function queryOne($sql)
    {
        return $this->adodb->GetRow($sql);
    }
    
    public function getRowCount()
    {
        return $this->rowCount;                             
    }
    
    public function execute($sql)
    {
        $this->lastInsertId = 0;
        $this->rowsAfffected = 0;
        
        //$this->adodb->Execute($sql) or die(mysql_error());
        $this->adodb->Execute($sql) or die(mysqli_error($this->adodb->_connectionID));
        
        $this->lastInsertId = $this->adodb->Insert_ID();
        $this->rowsAfffected = $this->adodb->Affected_Rows();
        
        return true;                    
    }
    
    public function getLastInsertId()
    {
        return $this->lastInsertId;                         
    }
    
    public function getRowsAffected()
    {
        return $this->rowsAffected;                             
    }
    
    public function escape($data)
    {
        $do_not_quote = array();
        $do_not_quote[] = 'NULL';
        $do_not_quote[] = $this->adodb->sysTimeStamp;
        $do_not_quote[] = $this->adodb->sysDate;
        
        if (is_array($data))
        {
            foreach ($data as $key=>$value)
            {
                if(!in_array($value, $do_not_quote))
                {
                    $data[$key] = $this->adodb->quote($value);      
                }
            }
        }
        else
        {
            if(!in_array($data, $do_not_quote))
            {
                $data = $this->adodb->quote($data);  
            }
        }
        
        return $data;                             
    }
}
