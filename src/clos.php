<?php
    require 'connection.php';

    $query = 'SELECT * FROM clo';
    $result = mysqli_query($query);

    // saving the data in an array
    while ($course = mysql_fetch_array($result)) {             
        echo "<h3>" .$course['Course_ID'] . "</h3>";
        echo $course['courseLearningOutcome'];
    }

?>