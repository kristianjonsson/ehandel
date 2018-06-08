<?php
/* Define Document Root */
define("DOCROOT", filter_input(INPUT_SERVER, "DOCUMENT_ROOT", FILTER_SANITIZE_STRING));
/* Define Core Root */
define("COREPATH", substr(DOCROOT, 0, strrpos(DOCROOT, "/")) . "/core/");

require_once COREPATH . 'classes/autoloader.php';

$db = new dbConf();


$sessionID = session_id();
$sql = "INSERT INTO `cart` (`ID`, `session_id`, `created`) VALUES ('', '$sessionID', ''";
 ?>