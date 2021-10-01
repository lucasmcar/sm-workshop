<?php

namespace Workshop\SmWorkshop\Config;

class Connection
{
    protected static $instance;

    private function __construct()
    {

    }

    public static function getInstance(){
        self::$instance = null;

        try{
            self::$instance = new PDO("mysql:host=localhost;dbname=DB_SM_WORKSHOP", "root", "Lucas1990");
            self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $ex){
            return $ex->getMessage();
        }

        return  self::$instance;
    }
}