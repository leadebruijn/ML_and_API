<?php
$servername = "us-cdbr-east-06.cleardb.net";
$username = "b7c397a18f2fd0";
$password = "e0eedcac";
$dbname = "heroku_f2f6e1880d9e294";
$conn = new mysqli($servername,$username,$password,$dbname);
$studentnumber = $_GET['studentnumber'];

if($conn ->connect_error)
{
    die("Connection failed: " . $conn -> connect_error);
}

$sql = "SELECT studentnumber from firstfour ";
$result = $conn ->query($sql);
$response = array();
$closest = ''; //closest match
$shortest = -1;

if($result -> num_rows >0)
{
    while($row = $result -> fetch_assoc())
    {
	    array_push($response,$row["studentnumber"]);

	$lev = levenshtein($studentnumber, $row["studentnumber"]);

    if ($lev == 0) {

        $closest = $row["studentnumber"];
        $shortest = 0;
        break;
    }
    if ($lev <= $shortest || $shortest < 0) {
        $closest  = $row["studentnumber"];
        $shortest = $lev;
    }
    }
}

$sql2 = "SELECT * from firstfour WHERE studentnumber = ". $closest;
$result2 = $conn ->query($sql2);
$response2 = array();

if($result2 -> num_rows >0)
{
    while($row = $result2 -> fetch_assoc())
    {
        array_push($response2,$row);
    }
}

$conn -> close();
header('Content-Type: application/json');
echo json_encode($response2);
?>