<?php
$servername = "localhost";
$username = "root";
$password = ""; // Assuming empty root password in XAMPP
$database = "practical7_db";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create database if not exists
$sql = "CREATE DATABASE IF NOT EXISTS $database";
if ($conn->query($sql) === TRUE) {
    $conn->select_db($database);
    
    // Create table if not exists
    $table_sql = "CREATE TABLE IF NOT EXISTS students (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        course VARCHAR(50) NOT NULL,
        reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )";
    $conn->query($table_sql);
} else {
    die("Error creating database: " . $conn->error);
}
?>
