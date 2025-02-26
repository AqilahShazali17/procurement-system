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

// Get vendor details for pre-filling form
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$vendor = null;

if ($id > 0) {
    $stmt = $conn->prepare("SELECT vendor_name, contact_info, services FROM vendors WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $vendor = $result->fetch_assoc();
    $stmt->close();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // CSRF Token Check
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        die("CSRF token validation failed!");
    }

    // Validate and sanitize input
    $id = filter_var($_POST['id'], FILTER_VALIDATE_INT);
    $contact_info = htmlspecialchars(strip_tags($_POST['contact_info']));
    $services = isset($_POST['services']) ? htmlspecialchars(strip_tags($_POST['services'])) : '';

    if ($id === false || empty($contact_info)) {
        echo "<div class='alert alert-danger'>Invalid input! Please provide valid details.</div>";
    } else {
        // Check if vendor exists before updating
        $check_stmt = $conn->prepare("SELECT id FROM vendors WHERE id = ?");
        $check_stmt->bind_param("i", $id);
        $check_stmt->execute();
        $check_stmt->store_result();

        if ($check_stmt->num_rows > 0) {
            // Update vendor details
            $sql = "UPDATE vendors SET contact_info=?, services=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssi", $contact_info, $services, $id);

            if ($stmt->execute()) {
                echo "<script>alert('Vendor updated successfully!'); window.location.href = 'manage_vendors.php';</script>";
            } else {
                echo "<div class='alert alert-danger'>Error updating vendor: " . $stmt->error . "</div>";
            }
            $stmt->close();
        } else {
            echo "<div class='alert alert-danger'>Vendor not found!</div>";
        }
        $check_stmt->close();
    }
}
?>

<!-- Form with CSRF Token -->
<div class="container mt-4">
    <h2>Update Vendor</h2>
    <form method="POST" class="card p-4 shadow-sm">
        <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
        
        <div class="mb-3">
            <label class="form-label">Vendor ID:</label>
            <input type="number" name="id" class="form-control" value="<?php echo htmlspecialchars($id); ?>" readonly required>
        </div>

        <div class="mb-3">
            <label class="form-label">Contact Info:</label>
            <input type="text" name="contact_info" class="form-control" value="<?php echo $vendor ? htmlspecialchars($vendor['contact_info']) : ''; ?>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Services:</label>
            <input type="text" name="services" class="form-control" value="<?php echo isset($vendor['services']) ? htmlspecialchars($vendor['services']) : ''; ?>">
        </div>

        <button type="submit" class="btn btn-warning">Update Vendor</button>
    </form>
</div>

<?php include 'footer.php'; ?>