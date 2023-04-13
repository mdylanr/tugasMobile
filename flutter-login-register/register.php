<?php
    header('Access-Control-Allow-Origin: *');
    $db = mysqli_connect('localhost', 'root', '', 'pbm');
    if (!$db){
        echo "Database connection failed";
    }

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."'";
    
    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
        echo json_encode("error");
    } else {
        $insert = "INSERT INTO users (username, password) VALUES ('".$username."', '".$password."')";
        $query = mysqli_query($db, $insert);
        if ($query) {
            echo json_encode("Success");
        }
    }
?>
