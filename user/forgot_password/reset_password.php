<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
</head>
<body>
<form action="reset_password.php" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend><h2>Reset Password</h2></legend>
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required><br><br>
        <label>Re-enter your password</label>
        <input type="password" name="re_password" placeholder="Re-enter your password" required><br><br>
        <input type="submit" value="Change Password" name="submit">
    </fieldset>
</form>

<?php 
session_start();
$email = $_SESSION['reset_email'];
if(isset($_POST['submit'])){
    $passwords = $_POST['password'];
    $_re_password = $_POST['re_password'];
    if($passwords != $_re_password){
        echo "Password does not match with each other. Check your spelling";
    } else {
        include("../../admin_and_user/connection.php");
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $qry = "UPDATE users SET password = '$passwords' WHERE email = '$email'";
        if ($conn->query($qry) === TRUE) {
            header("Location: ../../admin_and_user/signin_up.php");
            exit();
        } else {
            echo "Password could not be reset: " . $conn->error;
        }

        $conn->close();
    }
}
?>

</body>
</html>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #D7E5CA;
            padding: 20px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            margin-top: 0;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input[type=password], input[type=submit] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type=submit] {
            background-color: #4CAF50; 
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        fieldset {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
        }
        legend {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
    </style>