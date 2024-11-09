<?php
session_start();
require "layout/head.php";
require "include/conn.php";

$id_disease = isset($_GET['disease']) ? $_GET['disease'] : '';
$id_criteria = isset($_GET['criteria']) ? $_GET['criteria'] : '';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['values'])) {
    $id_criteria = $_POST['id_criteria'];

if (isset($_GET['disease']) && (!isset($_SESSION['current_disease']) || $_SESSION['current_disease'] != $_GET['disease'])) {
    $id_disease = $_GET['disease'];
        
    // Simpan penyakit saat ini ke sesi
    $_SESSION['current_disease'] = $id_disease;
        
   // Hapus data di tabel saw_evaluations hanya jika penyakit baru dipilih
    $delete_query = $db->prepare("DELETE FROM saw_evaluations");
    $delete_query->execute();
    $delete_query->close();
}

    foreach ($_POST['values'] as $id_alternative => $value) {
        $insert_query = $db->prepare("INSERT INTO saw_evaluations (id_alternative, id_criteria, value) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE value = ?");
        $insert_query->bind_param("iidi", $id_alternative, $id_criteria, $value, $value);
        $insert_query->execute();
        $insert_query->close();
    }

    // Refresh page after data is inserted
    header("Location: " . $_SERVER['PHP_SELF'] . "?disease=$id_disease&criteria=$id_criteria");
    exit();
}
if (isset($_POST['delete_all'])) {
    // Hapus semua data di tabel saw_evaluations
    $delete_query = $db->prepare("DELETE FROM saw_evaluations");
    $delete_query->execute();
    $delete_query->close();
    
    echo "Semua data berhasil dihapus.";
}
?>


<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        /* Style untuk tombol delete */
        .btn-delete {
            background-color: #d9534f; 
            color: white; 
            border: none;
            border-radius: 5px;
            padding: 7px 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .btn-delete:hover {
            background-color: #c9302c; /* Warna merah lebih gelap saat di-hover */
        }

        .btn-delete:active {
            background-color: #ac2925; /* Warna merah lebih gelap saat ditekan */
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }

    </style>
</head>

<body>
  <div id="app">
    <?php require "layout/sidebar.php"; ?>
    <div id="main">
      <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
          <i class="bi bi-justify fs-3"></i>
        </a>
      </header>
      <div class="page-heading">
        <h3>Input Nilai Alternatif</h3>
      </div>
      <div class="page-content">
        <section class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Input Nilai Alternatif Untuk Setiap Gejala</h4>
              </div>
              <div class="card-content">
                <div class="card-body">
                  <!-- Form 1: Pilih Penyakit -->
                  <form method="GET" action="">
                    <div class="mb-3">
                      <label for="disease">Pilih Penyakit:</label>
                      <select name="disease" id="disease" class="form-select" onchange="this.form.submit()">
                        <option value="">--Penyakit Mata--</option>
                        <?php
                        $diseases = $db->query("SELECT id_disease, disease_name FROM diseases");
                        while ($disease = $diseases->fetch_object()) {
                          $selected = ($id_disease == $disease->id_disease) ? "selected" : "";
                          echo "<option value='{$disease->id_disease}' $selected>{$disease->disease_name}</option>";
                        }
                        ?>
                      </select>
                    </div>
                  </form>

                  <!-- Form 2: Pilih Gejala -->
                  <?php if ($id_disease): ?>
                      <form method="GET" action="">
                          <div class="mb-3">
                              <input type="hidden" name="disease" value="<?php echo htmlspecialchars($id_disease); ?>">
                              <?php
                              $criteria_query = $db->prepare("SELECT c.id_criteria, c.criteria FROM criteria c JOIN saw_criterias sc ON c.id_criteria = sc.id_criteria WHERE sc.id_disease = ?");
                              $criteria_query->bind_param("i", $id_disease);
                              $criteria_query->execute();
                              $criteria_result = $criteria_query->get_result();
                              ?>

                              <label for="criteria">Pilih Gejala:</label>
                              <select name="criteria" id="criteria" class="form-select" onchange="this.form.submit()">
                                  <option value="">--Pilih Gejala--</option>
                                  <?php while ($criteria = $criteria_result->fetch_object()): ?>
                                      <?php
                                      $selected = (isset($_GET['criteria']) && $_GET['criteria'] == $criteria->id_criteria) ? "selected" : "";
                                      echo "<option value='{$criteria->id_criteria}' $selected>{$criteria->criteria}</option>";
                                      ?>
                                  <?php endwhile; ?>
                              </select>
                              <?php $criteria_query->close(); ?>
                          </div>
                      </form>
                  <?php endif; ?>

                  <!-- Form 3: Input Nilai Alternatif untuk Gejala yang Dipilih -->
                  <?php if ($id_criteria): ?>
                      <form method="POST" action="">
                          <div class="mb-3">
                              <input type="hidden" name="disease" value="<?php echo htmlspecialchars($id_disease); ?>">
                              <input type="hidden" name="id_criteria" value="<?php echo htmlspecialchars($id_criteria); ?>">
                              <?php
                              $alternatives_query = $db->prepare("
                                  SELECT ac.id_alternative, sa.name 
                                  FROM alternative_criteria ac 
                                  JOIN saw_alternatives sa ON ac.id_alternative = sa.id_alternative 
                                  WHERE ac.id_criteria = ?
                              ");
                              $alternatives_query->bind_param("i", $id_criteria);
                              $alternatives_query->execute();
                              $alternatives_result = $alternatives_query->get_result();
                              ?>

                              <table class="table table-bordered">
                                  <caption>Masukkan Nilai Persepsi Dokter</caption>
                                  <tr>
                                      <th>Alternatif</th>
                                      <th>Nilai (Persepsi Dokter)</th>
                                  </tr>
                                  <?php while ($alt = $alternatives_result->fetch_object()): ?>
                                      <tr>
                                          <td><?php echo htmlspecialchars($alt->name); ?></td>
                                          <td>
                                              <input type="number" name="values[<?php echo $alt->id_alternative; ?>]" class="form-control" required min="1" max="4">
                                          </td>
                                      </tr>
                                  <?php endwhile; ?>
                              </table>
                              <button type="submit" class="btn btn-primary">Simpan dan Hitung</button>
                              <?php $alternatives_query->close(); ?>
                          </div>
                      </form>
                  <?php endif; ?>

               <!-- Tabel Matrix Keputusan -->
                <?php if ($id_disease): ?>
                    <h5>Matrix Keputusan</h5>
                    <table class="table table-bordered">
                        <tr>
                            <th>Alternatif</th>
                            <?php
                            // Ambil kriteria berdasarkan penyakit yang dipilih
                            $criteria_query = $db->prepare("SELECT c.id_criteria, c.criteria FROM criteria c JOIN saw_criterias sc ON c.id_criteria = sc.id_criteria WHERE sc.id_disease = ?");
                            $criteria_query->bind_param("i", $id_disease);
                            $criteria_query->execute();
                            $criteria_result = $criteria_query->get_result();
                            $criteria_columns = []; // Array untuk menyimpan id_criteria dan nama kriteria
                            while ($criterion = $criteria_result->fetch_object()) {
                                $criteria_columns[$criterion->id_criteria] = $criterion->criteria; // Simpan id kriteria dan namanya
                                echo "<th>{$criterion->criteria}</th>";
                            }
                            $criteria_query->close();
                            ?>
                        </tr>
                        <form method="post" action="">
                    <button type="submit" name="delete_all" class="btn-delete" onclick="return confirm('Apakah Anda yakin ingin menghapus semua data?')">Hapus Semua Data</button>
                </form>

        <?php
        // Fetch alternatif dari database
        $alternatives_query = $db->query("SELECT id_alternative, name FROM saw_alternatives");
        while ($alt = $alternatives_query->fetch_object()) {
            echo "<tr><td>{$alt->name}</td>";
            foreach ($criteria_columns as $criteria_id => $criteria_name) {
                // Ambil nilai untuk setiap alternatif dan kriteria
                $value_query = $db->prepare("SELECT value FROM saw_evaluations WHERE id_alternative = ? AND id_criteria = ?");
                $value_query->bind_param("ii", $alt->id_alternative, $criteria_id);
                $value_query->execute();
                $value_result = $value_query->get_result();
                $value = $value_result->fetch_object();
                echo "<td>" . (isset($value->value) ? $value->value : "-") . "</td>";
                $value_query->close();
            }
            echo "</tr>";
        }
        $alternatives_query->close();
        ?>
    </table>

    <h5>Matrix Ternormalisasi</h5>
<table class="table table-bordered">
    <tr>
        <th>Alternatif</th>
        <?php foreach ($criteria_columns as $criteria_name): ?>
            <th>Normalisasi <?php echo $criteria_name; ?></th>
        <?php endforeach; ?>
    </tr>
    <?php
    $normalization_results = []; // Inisialisasi array untuk menyimpan hasil normalisasi

    // Menampilkan data normalisasi untuk setiap alternatif
    $alternatives_query = $db->query("SELECT id_alternative, name FROM saw_alternatives");
    while ($alt = $alternatives_query->fetch_object()) {
        $normalization_results[$alt->id_alternative] = []; // Buat sub-array untuk setiap alternatif
        echo "<tr><td>{$alt->name}</td>";

        foreach ($criteria_columns as $criteria_id => $criteria_name) {
            // Ambil nilai untuk normalisasi
            $value_query = $db->prepare("SELECT value FROM saw_evaluations WHERE id_alternative = ? AND id_criteria = ?");
            $value_query->bind_param("ii", $alt->id_alternative, $criteria_id);
            $value_query->execute();
            $value_result = $value_query->get_result();
            $value = $value_result->fetch_object();
            $current_value = isset($value->value) ? $value->value : 0;

            // Normalisasi berdasarkan atribut 'benefit' atau 'cost'
            $criteria_info_query = $db->prepare("SELECT attribute FROM saw_criterias WHERE id_criteria = ?");
            $criteria_info_query->bind_param("i", $criteria_id);
            $criteria_info_query->execute();
            $criteria_info_result = $criteria_info_query->get_result();
            $criteria_info = $criteria_info_result->fetch_object();

            if ($criteria_info && $criteria_info->attribute === 'benefit') {
                // Normalisasi Benefit
                $max_value_query = $db->query("SELECT MAX(value) AS max_value FROM saw_evaluations WHERE id_criteria = $criteria_id");
                $max_value = $max_value_query->fetch_object()->max_value;
                $normalized_value = $max_value > 0 ? $current_value / $max_value : 0;
            } else {
                // Normalisasi Cost
                $min_value_query = $db->query("SELECT MIN(value) AS min_value FROM saw_evaluations WHERE id_criteria = $criteria_id");
                $min_value = $min_value_query->fetch_object()->min_value;
                $normalized_value = $min_value > 0 ? $min_value / ($current_value > 0 ? $current_value : 1) : 0;
            }
            // Simpan nilai normalisasi dalam array
            $normalization_results[$alt->id_alternative][$criteria_id] = $normalized_value;
            echo "<td>" . round($normalized_value, 2) . "</td>";
        }
        echo "</tr>";
    }
    $alternatives_query->close();
    ?>
</table>

<h5>Hasil Akhir</h5>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Alternatif</th>
            <th>Nilai Akhir</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Menghitung nilai akhir
        $nilai_akhir = [];
        foreach ($normalization_results as $id_alternative => $normalized_values) {
            $total = 0;
            foreach ($bobot as $criteria_id => $weight) {
                // Ambil nilai normalisasi dari array
                $normalized_value = isset($normalized_values[$criteria_id]) ? $normalized_values[$criteria_id] : 0;
                $total += $normalized_value * $weight; // Hitung total berdasarkan bobot
            }
            $nilai_akhir[$id_alternative] = $total; // Simpan hasil total untuk alternatif
        }

        // Tampilkan hasil
        $alternatives_query = $db->query("SELECT id_alternative, name FROM saw_alternatives");
        while ($alt = $alternatives_query->fetch_object()) {
            echo "<tr>";
            echo "<td>{$alt->name}</td>"; // Tampilkan nama alternatif
            echo "<td>" . round($nilai_akhir[$alt->id_alternative], 2) . "</td>"; // Tampilkan nilai akhir
            echo "</tr>";
        }
        $alternatives_query->close();
        ?>
    </tbody>
</table>

<?php endif; ?>
