<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>

<!DOCTYPE html>
<html lang="en">
<?php
require "layout/head.php";
require "include/conn.php"; // Pastikan koneksi database sudah benar
require "W.php"; // Pastikan W.php menginisialisasi variabel $W
require "R.php"; // Pastikan R.php menginisialisasi variabel $R
?>

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
                <h3>Perankingan Nilai Preferensi (Nilai Akhir)</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">5 Teratas Nilai Preferensi</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <p class="card-text">
                                        Nilai ini merupakan hasil perankingan dari Nilai Preferensi (Nilai Akhir), diambil lima nilai tertinggi.
                                    </p>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                        <caption>Nilai Preferensi (P)</caption>
                                        <tr>
                                            <th>No</th>
                                            <th>Alternatif</th>
                                            <th>Hasil</th>
                                        </tr>
                                        <?php
                                        // Pastikan $R dan $W diinisialisasi dengan benar di file W.php dan R.php
                                        if (isset($nilai_akhir)) {
                                            // Sortir nilai akhir dari yang terbesar hingga terkecil
                                            arsort($nilai_akhir);

                                            // Ambil 5 nilai tertinggi
                                            $top5 = array_slice($nilai_akhir, 0, 5, true);
                                            $no = 0;

                                            foreach ($top5 as $id_alternative => $final_value) {
                                                // Ambil nama alternatif dari database menggunakan id_alternative
                                                $name_query = $db->prepare("SELECT name FROM saw_alternatives WHERE id_alternative = ?");
                                                $name_query->bind_param("i", $id_alternative);
                                                $name_query->execute();
                                                $name_result = $name_query->get_result();
                                                $name = $name_result->fetch_object()->name ?? "Alternatif Tidak Ditemukan"; // Default jika tidak ada nama

                                                echo "<tr class='center'>
                                                        <td>" . (++$no) . "</td>
                                                        <td>" . htmlspecialchars($name) . "</td>
                                                        <td>" . htmlspecialchars(number_format($final_value, 2)) . "</td> <!-- Format angka -->
                                                      </tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='3' class='center'>Data tidak tersedia.</td></tr>";
                                        }
                                        ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <?php require "layout/footer.php"; ?>
        </div>
    </div>
    <?php require "layout/js.php"; ?>
</body>

</html>
