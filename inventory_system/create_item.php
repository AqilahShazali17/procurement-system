<?php  
include 'header.php';  
include 'db_connect.php'; 

// Ensure session is started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Generate CSRF token if not set
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // CSRF Token Check
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        die("CSRF token validation failed!");
    }

    // Sanitize input
    $product_name = trim($_POST['product_name']);
    $sku = trim($_POST['sku']);
    $quantity = filter_var($_POST['quantity'], FILTER_VALIDATE_INT);
    $restock_level = filter_var($_POST['restock_level'], FILTER_VALIDATE_INT);

    // Regular expressions to allow only letters, numbers, and spaces
    $valid_name = preg_match("/^[a-zA-Z0-9 ]+$/", $product_name);
    $valid_sku = preg_match("/^[a-zA-Z0-9]+$/", $sku);

    // Validation
    if (empty($product_name) || empty($sku)) {
        echo "<script>alert('Error: Product Name and SKU are required!'); window.history.back();</script>";
    } elseif (!$valid_name) {
        echo "<script>alert('Error: Product Name can only contain letters, numbers, and spaces.'); window.history.back();</script>";
    } elseif (!$valid_sku) {
        echo "<script>alert('Error: SKU can only contain letters and numbers (no spaces).'); window.history.back();</script>";
    } elseif ($quantity === false || $restock_level === false) {
        echo "<script>alert('Error: Quantity and Restock Level must be numbers.'); window.history.back();</script>";
    } elseif ($quantity < 0 || $restock_level < 0) {
        echo "<script>alert('Error: Quantity and Restock Level cannot be negative.'); window.history.back();</script>";
    } else {
        // Check if SKU already exists
        $check_sku = $conn->prepare("SELECT id FROM inventory WHERE sku = ?");
        $check_sku->bind_param("s", $sku);
        $check_sku->execute();
        $check_sku->store_result();

        if ($check_sku->num_rows > 0) {
            echo "<script>alert('Error: SKU already exists! Please use a different SKU.'); window.history.back();</script>";
        } else {
            // Insert into database
            $stmt = $conn->prepare("INSERT INTO inventory (product_name, sku, quantity, restock_level) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssii", $product_name, $sku, $quantity, $restock_level);

            if ($stmt->execute()) {
                echo "<script>alert('New inventory item added successfully!'); window.location.href = 'manage_inventory.php';</script>";
            } else {
                echo "<script>alert('Error: " . $stmt->error . "'); window.history.back();</script>";
            }
            $stmt->close();
        }
        $check_sku->close();
    }
}
?>

<!-- Form with CSRF Token -->
<div class="container mt-4">
    <h2>Add Inventory Item</h2>
    <form method="POST" class="card p-4 shadow-sm">
        <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">

        <div class="mb-3">
            <label class="form-label">Product Name:</label>
            <input type="text" name="product_name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">SKU:</label>
            <input type="text" name="sku" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Quantity:</label>
            <input type="number" name="quantity" class="form-control" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Restock Level:</label>
            <input type="number" name="restock_level" class="form-control" min="0" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Item</button>
    </form>
</div>

<?php include 'footer.php'; ?>   