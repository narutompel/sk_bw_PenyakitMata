<!DOCTYPE html>
<html lang="en">
  <?php
  require "layout/head.php";
  require "include/conn.php";
  ?>

  <body>
    <div id="app">
      <?php require "layout/sidebar.php";?>
      <div id="main">
        <header class="mb-3">
          <a href="#" class="burger-btn d-block d-xl-none">
            <i class="bi bi-justify fs-3"></i>
          </a>
        </header>
        <div class="page-heading">
          <h3>Bobot Kriteria</h3>
        </div>
        <div class="page-content">
          <section class="row">
            <div class="col-12">
              <div class="card">

                <div class="card-header">
                  <h4 class="card-title">Tabel Bobot - Kriteria</h4>
                </div>
                <div class="card-content">
                  <div class="card-body">
                    <p class="card-text">Bobot preferensi telah ditetapkan untuk setiap kriteria berdasarkan analisis objektif. Bobot ini mencerminkan pentingnya masing-masing kriteria dalam proses pengambilan keputusan,
                       baik untuk kriteria yang bersifat keuntungan (benefit) maupun biaya (cost).</p>
                    <!-- Dropdown untuk memilih penyakit -->
                    <form method="GET" action="">
                      <label for="disease">Pilih Penyakit:</label>
                      <select name="disease" id="disease" onchange="this.form.submit()">
                        <option value="">-- Penyakit Mata --</option>
                        <?php
                        $diseases = $db->query("SELECT id_disease, disease_name FROM diseases");
                        while ($disease = $diseases->fetch_object()) {
                          $selected = (isset($_GET['disease']) && $_GET['disease'] == $disease->id_disease) ? "selected" : "";
                          echo "<option value='{$disease->id_disease}' $selected>{$disease->disease_name}</option>";
                        }
                        ?>
                      </select>
                    </form>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-striped mb-0">
                    <caption>
                      Tabel Kriteria C<sub>i</sub>
                    </caption>
                    <tr>
                      <th>No</th>
                      <th>Simbol</th>
                      <th>Kriteria</th>
                      <th>Bobot</th>
                      <th colspan="2">Atribut</th>
                    </tr>
                    <?php
                    // Cek apakah penyakit dipilih
                    if (isset($_GET['disease']) && $_GET['disease'] != "") {
                      $disease_id = $_GET['disease'];
                      $sql = "SELECT sc.id_criteria, c.criteria, sc.weight, sc.attribute 
                              FROM saw_criterias sc
                              JOIN criteria c ON sc.id_criteria = c.id_criteria
                              WHERE sc.id_disease = ?";
                      $stmt = $db->prepare($sql);
                      $stmt->bind_param("i", $disease_id);
                      $stmt->execute();
                      $result = $stmt->get_result();

                      if ($result->num_rows > 0) {
                        $i = 0;
                        while ($row = $result->fetch_object()) {
                          echo "<tr>
                                  <td class='right'>" . (++$i) . "</td>
                                  <td class='center'>C{$i}</td>
                                  <td>{$row->criteria}</td> <!-- Menampilkan nama kriteria dari tabel criteria -->
                                  <td>{$row->weight}</td>
                                  <td>{$row->attribute}</td>
                                  <td>
                                      <a href='bobot-edit.php?id={$row->id_criteria}' class='btn btn-info btn-sm'>Edit</a>
                                  </td>
                                </tr>\n";
                        }
                      } else {
                        echo "<tr><td colspan='6' class='text-center'>Data tidak ditemukan untuk penyakit yang dipilih.</td></tr>";
                      }
                      $stmt->close();
                    } else {
                      echo "<tr><td colspan='6' class='text-center'>Silakan pilih penyakit untuk menampilkan bobot kriteria.</td></tr>";
                    }
                    ?>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
        <?php require "layout/footer.php";?>
      </div>
    </div>
    <?php require "layout/js.php";?>
  </body>
</html>
