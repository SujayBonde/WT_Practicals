<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $course = $_POST['course'];

    $sql = "INSERT INTO students (name, email, course) VALUES ('$name', '$email', '$course')";

    if ($conn->query($sql) === TRUE) {
        header("Location: index.php");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; }
        .form-container { width: 50%; margin: 50px auto; background: white; padding: 20px; box-shadow: 0 0 10px #ccc; text-align: left; }
        input[type=text], input[type=email] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type=submit] { background-color: #28a745; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        input[type=submit]:hover { background-color: #218838; }
        a { display: block; text-align: center; margin-top: 15px; color: #007BFF; text-decoration: none; }
    </style>
</head>
<body>

<div class="form-container">
    <h2 style="text-align:center;">Add New Student</h2>
    <form method="POST" action="">
        <label>Name</label>
        <input type="text" name="name" required>
        
        <label>Email</label>
        <input type="email" name="email" required>
        
        <label>Course</label>
        <input type="text" name="course" required>
        
        <input type="submit" value="Submit">
    </form>
    <a href="index.php">Back to Home</a>
</div>

</body>
</html>
