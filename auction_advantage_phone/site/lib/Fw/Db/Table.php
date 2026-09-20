<?php

class Fw_Db_Table
{
    private $db;
    private $table;
    private $columns;
    
    private $sql_columns;
    private $sql_criteria;
    private $sql_croupBy;
    private $sql_orderBy;
        
    public function __construct($table) 
    {
        $this->db = Fw_Db::getInstance();
        $this->table = $table;
        $this->columns = $this->db->getColumns($table);
        $this->primary_keys = $this->db->getPrimaryKeys($table);
               
        $this->sql_columns = '*';
        $this->sql_where = '';
        $this->sql_groupby = '';
        $this->sql_orderby = '';
    }
    
    public function getTable()
    {
        return $this->table;
    }
    
    public function setColumns($columns)
    {
        if (is_array($columns))
        {
            $this->sql_columns = implode(',', $columns);
        }
        else
        {
            $this->sql_columns = $columns;
        }

        return true;
    }
    
    public function getColumns()
    {
        return $this->columns;
    }
        
    public function setWhere($where)
    {
        if (is_array($where))
        {
            $this->sql_where = implode(' AND ', $where);
        }
        else
        {
            $this->sql_where = $where;
        }

        return true;
    }
    
    public function getWhere()
    {
        return $this->sql_where;
    }
        
    public function setGroupBy($groupby)
    {
        if (is_array($group_by))
        {
            $this->sql_groupby = implode(', ', $groupby);
        }
        else
        {
            $this->sql_groupby = $groupby;
        }

        return true;
    }
    
    public function getGroupBy()
    {
       return $this->sql_groupby;
    }

    public function setOrderBy($orderby)
    {
        if (is_array($orderby))
        {
            $this->sql_orderby = implode(', ', $orderby);
        }
        else
        {
            $this->sql_orderby = $orderby;
        }

        return true;
    }
    
    public function getOrderBy()
    {
        return $this->sql_ordeby;
    }
    
    public function insertRow($data)
    {
        foreach ($data as $key=>$value)
        {
            if (!in_array($key, $this->columns))
            {
                unset($data[$key]);
            }
        }
        
        $data = $this->db->escape($data);
        
        $sql = array();
        $sql[] = "INSERT";
        $sql[] = "INTO $this->table";
        $sql[] = "(" . implode(',', array_keys($data)) . ")";
        $sql[] = "VALUES(" . implode(',', array_values($data)) . ")";
        
        $sql = implode("\n", $sql);
        
        $this->db->execute($sql);
                
        return $this->db->lastInsertId;        
    }
    
    public function getAllRows()
    {
        $sql = array();
        $sql[] = "SELECT $this->sql_columns";
        $sql[] = "FROM $this->table";
        if (!empty($this->sql_where))
        {
            $sql[] = "WHERE $this->sql_where";
        }
        if (!empty($this->sql_groupby))
        {
            $sql[] = "GROUP BY $this->sql_groupby";
        }
        if (!empty($this->sql_orderby))
        {
            $sql[] = "ORDER BY $this->sql_orderby";
        }

        $sql = implode("\n", $sql);

        $rows = $this->db->query($sql);

        return $rows; 
    }

    public function getRows($rows = -1, $offset = -1)
    {
        $sql = array();
        $sql[] = "SELECT $this->sql_columns";
        $sql[] = "FROM $this->table";
        if (!empty($this->sql_where))
        {
            $sql[] = "WHERE $this->sql_where";
        }
        if (!empty($this->sql_groupby))
        {
            $sql[] = "GROUP BY $this->sql_groupby";
        }
        if (!empty($this->sql_orderby))
        {
            $sql[] = "ORDER BY $this->sql_orderby";
        }

        $sql = implode("\n", $sql);

        $rows = $this->db->query($sql, $rows, $offset);

        return $rows; 
    }
        
    public function getRow()
    {
        $sql = array();
        $sql[] = "SELECT $this->sql_columns";
        $sql[] = "FROM $this->table";
        if (!empty($this->sql_where))
        {
            $sql[] = "WHERE $this->sql_where";
        }
        if (!empty($this->sql_groupby))
        {
            $sql[] = "GROUP BY $this->sql_groupby";
        }
        if (!empty($this->sql_orderby))
        {
            $sql[] = "ORDER BY $this->sql_orderby";
        }

        $sql = implode("\n", $sql);
        
        $row = $this->db->queryOne($sql);

        return $row;
    }
    
    public function rowExists()
    {
        $sql = array();
        $sql[] = "SELECT *";
        $sql[] = "FROM $this->table";
        if (!empty($this->sql_where))
        {
            $sql[] = "WHERE $this->sql_where";
        }
        if (!empty($this->group_by))
        {
            $sql[] = "GROUP BY $this->groupby";
        }
        if (!empty($this->order_by))
        {
            $sql[] = "ORDER BY $this->orderby";
        }

        $sql = implode("\n", $sql);

        $row = $this->db->queryOne($sql);

        if (count($row) == 0 OR empty($row))
        {
            return false;    
        }

        return true;
    }
    
    public function addRow($data)
    {
        return $this->insertRow($data);                             
    }
    
    public function getLastInsertId()
    {
        return $this->db->getLastInsertId();                         
    }
    
    public function updateRow($data)
    {
        foreach ($data as $key=>$value)
        {
            if (!in_array($key, $this->columns) || in_array($key, $this->primary_keys))
            {
                unset($data[$key]);
            }
        }
        
        $data = $this->db->escape($data);
        
        $set_sql = array();
        
        foreach ($data as $key=>$value)
        {
            $set_sql[] = "$key = $value";        
        }
        
        $set_sql = implode(', ', $set_sql);
        
        $sql = array();
        $sql[] = "UPDATE";
        $sql[] = "$this->table";
        $sql[] = "SET  $set_sql";
        $sql[] = "WHERE $this->sql_where";   
        
        $sql = implode("\n", $sql);
        
        $this->db->execute($sql);
                
        return true;                             
    }
    
    public function deleteRows()
    {
        $sql = array();
        $sql[] = "DELETE";
        $sql[] = "FROM $this->table";
        $sql[] = "WHERE $this->sql_where";

        $sql = implode("\n", $sql);
        
        $this->db->execute($sql);
                
        return true;                  
    }
    
    public function deleteRow()
    {
        $sql = array();
        $sql[] = "DELETE";
        $sql[] = "FROM $this->table";
        $sql[] = "WHERE $this->sql_where";
        $sql[] = "LIMIT 1";

        $sql = implode("\n", $sql);
        
        $this->db->execute($sql);
                
        return true;    
    }
}