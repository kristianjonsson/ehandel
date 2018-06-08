<?php
/*
* DB Configuration with credentials
* Should be ignored from any Git services
*/
class dbConf extends db {
function __construct() {
  $this->dbhost = "localhost";
  $this->dbuser = "admin";
  $this->dbpassword = "admin";
  $this->dbname = "ehandel";
  $db = parent::_connect();
  }
}
