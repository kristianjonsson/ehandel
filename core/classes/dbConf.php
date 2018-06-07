<?php
/*
* DB Configuration with credentials
* Should be ignored from any Git services
*/
class dbConf extends db {
function __construct() {
  $this->dbhost = "sql.itcn.dk:3306";
  $this->dbuser = "izet0004.SKOLE";
  $this->dbpassword = "HvchT1M054";
  $this->dbname = "izet0004.SKOLE";
  $db = parent::_connect();
  }
}
