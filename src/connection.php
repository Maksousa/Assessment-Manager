<?php
    /**
     * PHP 5 
     *
     * @file
     *
     * Establish Connection with MySQL server
     **/

    $dbHost= 'localhost'; 
    $dbUser = 'root';
    $dbPass = '';
    $db = 'assessment';

    // connecting to the server
    $conn = mysqli_connect($dbHost, $dbUser, $dbPass); 

    // connecting to the database
    mysqli_select_db($conn ,$db); 

?>