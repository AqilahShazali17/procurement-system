<?php 
include 'header.php';  
include 'db_connect.php'; 

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Ensure session is started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Generate CSRF token if not set
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// Get item ID from URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id <= 0) {
    die("<script>alert('Error: Invalid item ID.'); window.location.href='manage_inventory.php';</script>");
}

// Fetch existing item data
$stmt = $conn->prepare("SELECT product_name, sku, quantity, restock_level FROM inventory WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$item = $result->fetch_assoc();
$stmt->close();

if (!$item) {
    die("<script>alert('Error: Item not found.'); window.location.href='manage_inventory.php';</script>");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // CSRF Token Check
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        die("CSRF token validation failed!");
    }

    // Validate and sanitize input
    $id = filter_var($_POST['id'], FILTER_VALIDATE_INT);
    $product_name = filter_var($_POST['product_name'], FILTER_SANITIZE_SPECIAL_CHARS);
    $sku = filter_var($_POST['sku'], FILTER_SANITIZE_SPECIAL_CHARS);
    $quantity = filter_var($_POST['quantity'], FILTER_VALIDATE_INT);
    $restock_level = filter_var($_POST['restock_level'], FILTER_VALIDATE_INT);

    // Regular expression validation
    $valid_name = preg_match("/^[a-zA-Z0-9 ]+$/", $product_name);
    $valid_sku = preg_match("/^[a-zA-Z0-9]+$/", $sku);

    // Define limits
    $max_value = 1000000;

    // Validation checks
    if (!$valid_name) {
        echo "<script>alert('Error: Product Name can only contain letters, numbers, and spaces.'); window.history.back();</script>";
    } elseif (!$valid_sku) {
        echo "<script>alert('Error: SKU can only contain letters and numbers (no spaces).'); window.history.back();</script>";
    } elseif ($quantity < 0 || $restock_level < 0) {
        echo "<script>alert('Error: Quantity and Restock Level cannot be negative.'); window.history.back();</script>";
    } elseif ($quantity > $max_value || $restock_level > $max_value) {
        echo "<script>alert('Error: Quantity or Restock Level exceeds the allowed limit ($max_value).'); window.history.back();</script>";
    } else {
        // Check if SKU already exists for another item
        $check_sku = $conn->prepare("SELECT id FROM inventory WHERE sku = ? AND id != ?");
        $check_sku->bind_param("si", $sku, $id);
        $check_sku->execute();
        $check_sku->store_result();

        if ($check_sku->num_rows > 0) {
            echo "<script>alert('Error: SKU already exists for another product! Please use a different SKU.'); window.history.back();</script>";
        } else {
            // Update item details
            $stmt = $conn->prepare("UPDATE inventory SET product_name=?, sku=?, quantity=?, restock_level=? WHERE id=?");
            $stmt->bind_param("ssiii", $product_name, $sku, $quantity, $restock_level, $id);

            if ($stmt->execute()) {
                echo "<script>alert('Inventory item updated successfully!'); window.location.href = 'manage_inventory.php';</script>";
            } else {
                echo "<script>alert('Error updating record: " . $stmt->error . "'); window.history.back();</script>";
            }
            $stmt->close();
        }
        $check_sku->close();
    }
}
?>

<!-- Form with CSRF Token -->
<div class="container mt-4">
    <h2>Update Inventory Item</h2>
    <form method="POST" class="card p-4 shadow-sm">
        <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
        
        <div class="mb-3">
            <label class="form-label">Item ID:</label>
            <input type="number" name="id" class="form-control" value="<?php echo htmlspecialchars($id); ?>" readonly required>
        </div>

        <div class="mb-3">
            <label class="form-label">Product Name:</label>
            <input type="text" name="product_name" class="form-control" value="<?php echo htmlspecialchars($item['product_name']); ?>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">SKU:</label>
            <input type="text" name="sku" class="form-control" value="<?php echo htmlspecialchars($item['sku']); ?>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">New Quantity:</label>
            <input type="number" name="quantity" class="form-control" min="0" max="1000000" value="<?php echo htmlspecialchars($item['quantity']); ?>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">New Restock Level:</label>
            <input type="number" name="restock_level" class="form-control" min="0" max="1000000" value="<?php echo htmlspecialchars($item['restock_level']); ?>" required>
        </div>

        <button type="submit" class="btn btn-warning">Update Item</button>
    </form>
</div>

<?php include 'footer.php'; ?>  