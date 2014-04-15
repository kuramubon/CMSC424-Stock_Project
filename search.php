<?php

if ($_POST['submit']) {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $dbhandle = sqlite_open('test.db');
    $result = sqlite_unbuffered_query($dbhandle, "SELECT * FROM test");
    while($row = $query->fetch())
    	print($row['y']."\n");
}

?>