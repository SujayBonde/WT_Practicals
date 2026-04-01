<?php
include 'db.php';

if (!isset($_GET['id'])) {
    header("Location: index.php");
    exit();
}

$id = $_GET['id'];
$sql = "SELECT * FROM students WHERE id = $id";
$result = $conn->query($sql);

if ($result->num_rows != 1) {
    header("Location: index.php");
    exit();
}

$row = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; }
        .form-container { width: 50%; margin: 50px auto; background: white; padding: 20px; box-shadow: 0 0 10px #ccc; text-align: left; }
        input[type=text], input[type=email] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type=submit] { background-color: #007BFF; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        input[type=submit]:hover { background-color: #0056b3; }
        a { display: block; text-align: center; margin-top: 15px; color: #007BFF; text-decoration: none; }
    </style>
</head>
<body>

<div class="form-container">
    <h2 style="text-align:center;">Edit Student Registration</h2>
    <form method="POST" action="update.php">
        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
        
        <label>Name</label>
        <input type="text" name="name" value="<?php echo $row['name']; ?>" required>
        
        <label>Email</label>
        <input type="email" name="email" value="<?php echo $row['email']; ?>" required>
        
        <label>Course</label>
        <input type="text" name="course" value="<?php echo $row['course']; ?>" required>
        
        <input type="submit" value="Update Student">
    </form>
    <a href="index.php">Back to Home</a>
</div>

</body>
</html>
