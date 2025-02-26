<?php  
include 'header.php';  
include 'db_connect.php'; 

// Ensure session is started only if not active
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Ensure only Procurement Officers & Admins can access
if (!isset($_SESSION['role']) || ($_SESSION['role'] !== 'Admin' && $_SESSION['role'] !== 'Procurement Officer')) {
    echo "<div class='alert alert-danger'>Access Denied! Only Admins and Procurement Officers can manage inventory.</div>";
    include 'footer.php';
    exit();
}

// Fetch inventory items
$sql = "SELECT * FROM inventory";
$result = $conn->query($sql);
?>

<div class="container mt-4">
    <h2>Manage Inventory</h2>
    
    <!-- Add Item Button -->
    <a href="create_item.php" class="btn btn-success mb-3">Add New Item</a>

    <?php if ($result->num_rows > 0): ?>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>SKU</th>
                    <th>Quantity</th>
                    <th>Restock Level</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row["id"]); ?></td>
                        <td><?php echo htmlspecialchars($row["product_name"]); ?></td>
                        <td><?php echo htmlspecialchars($row["sku"]); ?></td>
                        <td><?php echo htmlspecialchars($row["quantity"]); ?></td>
                        <td><?php echo htmlspecialchars($row["restock_level"]); ?></td>
                        <td>
                            <a href="update_item.php?id=<?php echo htmlspecialchars($row["id"]); ?>" class="btn btn-warning btn-sm">Edit</a>
                            
                            <!-- Only Admins can delete items -->
                            <?php if ($_SESSION['role'] === 'Admin'): ?>
                                <a href="delete_item.php?id=<?php echo htmlspecialchars($row["id"]); ?>" 
                                   class="btn btn-danger btn-sm" 
                                   onclick="return confirm('Are you sure you want to delete this item?');">
                                   Delete
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <div class="alert alert-warning">No inventory items found.</div>
    <?php endif; ?>
</div>

<?php 
$conn->close();
include 'footer.php'; 
?>