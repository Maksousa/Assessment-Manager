
<?php
    
    require 'connection.php';

    // getting data from DB
    $query = 'SELECT Instructor_ID, Pass FROM instructor' ; 
    $result = mysql_query($query);

    $username =  $_POST['username']; 
    $password = md5($_POST['password']);

    // saving the data in an array
    while ($instructor = mysql_fetch_array($result)) {  
        if ($instructor['Instructor_ID'] == $username ) {
            if ($instructor['Pass'] == $password) {
                header('location: ../adminPage.html');
            } else {
                echo "<h3>".'wrong password'."</h3>";
          
            }
        } else {
            echo "<h3>".'wrong username'."</h3>";
        }
       

    }


?>


