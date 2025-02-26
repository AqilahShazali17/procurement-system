<?php
include 'db_connect.php';

// Ensure session is started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Check if an ID is provided in the URL
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = intval($_GET['id']);

    if ($id > 0) {
        // Prepare SQL statement to delete item
        $sql = "DELETE FROM inventory WHERE id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            // Log the deletion action
            logAction($_SESSION['username'], "Deleted inventory item ID $id", $conn);
            echo "<script>alert('Inventory item deleted successfully!'); window.location.href = 'manage_inventory.php';</script>";
        } else {
            echo "<script>alert('Error deleting item: " . $stmt->error . "'); window.location.href = 'manage_inventory.php';</script>";
        }
        $stmt->close();
    } else {
        echo "<script>alert('Invalid item ID!'); window.location.href = 'manage_inventory.php';</script>";
    }
} else {
    echo "<script>alert('Invalid request!'); window.location.href = 'manage_inventory.php';</script>";
}
?>