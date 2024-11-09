<?php
// Include koneksi database
require 'db_connection.php';

if (isset($_POST['submit'])) {
    $id_alternative = $_POST['id_alternative'];
    $id_criteria = $_POST['id_criteria'];
    $value = $_POST['value'];

    // Pastikan nilai valid
    if (!empty($id_alternative) && !empty($id_criteria) && is_numeric($value)) {
        // Query untuk menyimpan nilai
        $sql = "INSERT INTO saw_evaluations (id_alternative, id_criteria, value) VALUES (?, ?, ?)";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('iid', $id_alternative, $id_criteria, $value);

        if ($stmt->execute()) {
            echo "Data berhasil disimpan!";
            // Redirect atau kembali ke halaman sebelumnya setelah berhasil
            header("Location: your_previous_page.php"); // Ganti dengan halaman yang sesuai
            exit();
        } else {
            echo "Gagal menyimpan data: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Input tidak valid.";
    }
}

$db->close();
?>
