<?php

$csv = array();

if($_FILES['userfile']['error'] == 0){
    $name = $_FILES['userfile']['name'];
    $ext = strtolower(end(explode('.', $_FILES['userfile']['name'])));
    $type = $_FILES['userfile']['type'];
    $tmpName = $_FILES['userfile']['tmp_name'];

    // check the file is a csv
    if($ext === 'csv'){
        if(($handle = fopen($tmpName, 'r')) !== FALSE) {
            // necessary if a large csv file
            set_time_limit(0);

            $row = 0;

            while(($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
				// do some work here
                // number of fields in the csv
                $num = count($data);
				
                // get the values from the csv
                $csv[$row]['row1'] = $data[0];
                $csv[$row]['row2'] = $data[1];

                // inc the row
                $row++;
            }
            fclose($handle);
        }
    }
}

?>