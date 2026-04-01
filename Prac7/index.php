<?php
include 'db.php';

$sql = "SELECT id, name, email, course FROM students";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; }
        .container { width: 80%; margin: auto; background: white; padding: 20px; box-shadow: 0 0 10px #ccc; margin-top: 50px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 12px; text-align: left; }
        th { background-color: #007BFF; color: white; }
        a.btn { text-decoration: none; padding: 5px 10px; color: white; border-radius: 3px; }
        a.btn-edit { background-color: #ffc107; color: black; }
        a.btn-delete { background-color: #dc3545; }
        a.btn-add { background-color: #28a745; display: inline-block; padding: 10px 15px; margin-bottom: 20px; font-weight: bold; }
    </style>
</head>
<body>

<div class="container">
    <h2>Student Management System</h2>
    <a href="insert.php" class="btn btn-add">+ Add New Student</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Actions</th>
        </tr>
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["id"] . "</td>";
                echo "<td>" . $row["name"] . "</td>";
                echo "<td>" . $row["email"] . "</td>";
                echo "<td>" . $row["course"] . "</td>";
                echo "<td>
                        <a href='edit.php?id=" . $row["id"] . "' class='btn btn-edit'>Edit</a> 
                        <a href='delete.php?id=" . $row["id"] . "' class='btn btn-delete' onclick='return confirm(\"Are you sure you want to delete this record?\")'>Delete</a>
                      </td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='5' style='text-align:center;'>No students found</td></tr>";
        }
        $conn->close();
        ?>
    </table>
</div>

</body>
</html>
