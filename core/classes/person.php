<?php
class person{
    public $name;
    public $email;
    protected $age;
    private $gender;
    private $db;

    public function __construct()
    {
        global $db;
        $this -> db = $db;
    }
}