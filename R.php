<?php

$id_disease = isset($_GET['disease']) ? $_GET['disease'] : '';

// Ambil bobot kriteria dari database
$bobot_query = $db->query("SELECT id_criteria, weight FROM saw_criterias");
$bobot = [];
while ($row = $bobot_query->fetch_object()) {
    $bobot[$row->id_criteria] = $row->weight;
}

// Ambil nilai alternatif untuk setiap kriteria dan lakukan normalisasi
$nilai = [];
$max_values = [];
$alternatives_query = $db->query("SELECT id_alternative, name FROM saw_alternatives");
while ($alt = $alternatives_query->fetch_object()) {
    foreach ($bobot as $criteria_id => $weight) {
        // Ambil nilai asli dari tabel saw_evaluations
        $value_query = $db->prepare("SELECT value FROM saw_evaluations WHERE id_alternative = ? AND id_criteria = ?");
        $value_query->bind_param("ii", $alt->id_alternative, $criteria_id);
        $value_query->execute();
        $value_result = $value_query->get_result();
        $value = $value_result->fetch_object();

        // Simpan nilai asli dalam array
        $nilai[$alt->id_alternative][$criteria_id] = isset($value->value) ? $value->value : 0;

        // Tentukan nilai maksimum untuk normalisasi
        if (!isset($max_values[$criteria_id]) || $nilai[$alt->id_alternative][$criteria_id] > $max_values[$criteria_id]) {
            $max_values[$criteria_id] = $nilai[$alt->id_alternative][$criteria_id];
        }
    }
}

// Lakukan normalisasi dan hitung nilai akhir
$nilai_akhir = [];
foreach ($nilai as $id_alternative => $criteria_values) {
    $total = 0;
    foreach ($criteria_values as $criteria_id => $value) {
        // Normalisasi nilai berdasarkan nilai maksimum
        $normalized_value = $max_values[$criteria_id] != 0 ? $value / $max_values[$criteria_id] : 0;
        $total += $normalized_value * $bobot[$criteria_id]; // Kalikan nilai normalisasi dengan bobot
    }
    $nilai_akhir[$id_alternative] = $total; // Simpan hasil total untuk alternatif
}

// Tampilkan hasil
?>
<head>
    <style>
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div id="app">
        <div id="main">
            <header class="mb-3">
                <h3>Nilai Preferensi (Nilai Akhir)</h3>
            </header>
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <caption>Nilai Akhir</caption>
                    <tr>
                        <th>No</th>
                        <th>Alternatif</th>
                        <th>Nilai Akhir</th>
                    </tr>
                    <?php
                    $no = 0; // Inisialisasi nomor urut
                    foreach ($nilai_akhir as $id_alternative => $final_value) {
                        if ($final_value > 0) {
                            $name_query = $db->prepare("SELECT name FROM saw_alternatives WHERE id_alternative = ?");
                            $name_query->bind_param("i", $id_alternative);
                            $name_query->execute();
                            $name_result = $name_query->get_result();
                            $name = $name_result->fetch_object()->name;

                            echo "<tr>
                                    <td>" . (++$no) . "</td>
                                    <td>" . htmlspecialchars($name) . "</td>
                                    <td>" . htmlspecialchars(number_format($final_value, 2)) . "</td>
                                  </tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        </div>
    </div>
</body>
