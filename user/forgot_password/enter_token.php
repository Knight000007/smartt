<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="enter_token.php" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend><h2>Enter Token</h2></legend>
            <label>Token</label>
            <input type="text" name="token" placeholder="Enter token" required><br><br>
            <input type="submit" value="Submit" name="submit">
        </fieldset>
    </form>

    <?php 
    session_start();
    if(isset($_POST['submit'])){
        if(isset($_SESSION['reset_email'])){
            $email = $_SESSION['reset_email'];
            $token = $_POST['token'];
        
            include("../../admin_and_user/connection.php");

            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            $email = $conn->real_escape_string($email);
            $token = $conn->real_escape_string($token);

            $qry = "UPDATE USERS SET token = '$token' WHERE email = '$email'";
            if ($conn->query($qry) === TRUE) {
                header("Location: reset_password.php");
                exit();
            } else {
                echo "Failed to update token: " . $conn->error;
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
        input[type=text], input[type=submit] {
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