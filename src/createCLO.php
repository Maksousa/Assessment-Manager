<?php
    require 'connection.php';

    $cloID = $_POST['cloID'];
    $courseID = $_POST['courseID'];
    $description = $_POST['description'];
    $plo = $_POST['PLOSelector'];


    if ($_POST['submit']) 
        mysqli_query($conn, "INSERT INTO clo (CLO_ID, Course_ID, Description) VALUES ('$cloID', '$courseID', '$description')")
                    or die(mysqli_error($conn));

        $query = "SELECT Dept_ID FROM course " ."WHERE Course_ID='$courseID'";
        $result = mysqli_query($conn, $query);
        $department= mysqli_fetch_array($result);
        $dept=$department['Dept_ID'];
        mysqli_query($conn, "INSERT INTO clo_to_plo " . "(PLO_ID, Dept_ID, CLO_ID, Course_ID) ". "VALUES ('$plo', '$dept', '$cloID', '$courseID')")
                    or die(mysqli_error($conn));

        header('location: clos.php');
        exit;
     

?>