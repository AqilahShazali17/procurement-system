<?php
include 'header.php';
include 'db_connect.php';

// Ensure session is started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Check if ID is provided and valid
if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    echo "<script>alert('Invalid Vendor ID!'); window.location.href = 'manage_vendors.php';</script>";
    exit();
}

$id = intval($_GET['id']); // Get vendor ID safely

// Check if vendor exists before deleting
$check_stmt = $conn->prepare("SELECT id FROM vendors WHERE id = ?");
$check_stmt->bind_param("i", $id);
$check_stmt->execute();
$check_stmt->store_result();

if ($check_stmt->num_rows > 0) {
    // Vendor exists, proceed with deletion
    $delete_stmt = $conn->prepare("DELETE FROM vendors WHERE id = ?");
    $delete_stmt->bind_param("i", $id);

    if ($delete_stmt->execute()) {
        echo "<script>alert('Vendor deleted successfully!'); window.location.href = 'manage_vendors.php';</script>";
    } else {
        echo "<script>alert('Error deleting vendor: " . $delete_stmt->error . "'); window.history.back();</script>";
    }

    $delete_stmt->close();
} else {
    echo "<script>alert('Vendor ID does not exist.'); window.history.back();</script>";
}

$check_stmt->close();
$conn->close();
?>