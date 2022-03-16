
<?php
include 'inc/header.php';
Session::CheckSession();
?>
      <div class="card ">
        <div class="card-header">
          <h3><i class="fas fa-users mr-2"></i>Device list <span class="float-right">Welcome! <strong>
            <span class="badge badge-lg badge-secondary text-white">
<?php

 ?>
  </span>

        <div class="card-body pr-2 pl-2">

          <table id="example" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                    <tr>
                      <th  class="text-center">SL</th>
                      <th  class="text-center">Name</th>
                      <th  class="text-center">readings</th>
                      <th  class="text-center">API key</th>
                      <th  width='25%' class="text-center">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php

                      $allDevice = $devices->selectAllDeviceData();

                      if ($allDevice) {
                        $i = 0;
                        foreach ($allDevice as  $value) {
                          $i++;

                     ?>

                      <tr class="text-center"

                      >

                        <td><?php echo $value->id; ?></td>
                        <td><?php echo $value->name; ?></td>
                        <td><?php echo $value->readings; ?></td>
                        <td><?php echo $value->APIkey; ?></td>

                        <td>
                            <a class="btn btn-success btn-sm
                            " href="datos2.php?id=<?php echo $value->id;?>">datos</a>
                            <a class="btn btn-success btn-sm
                            " href="FIWARE.php?id=<?php echo $value->id;?>,&readings=<?php echo $value->readings;?>&name=<?php echo $value->name;?>">grafana</a>
                            <a
                             class="btn btn-success btn-sm"
                             href="FIWARE_Code.php?id=<?php echo $value->id;?>">Fiware Code</a>
                             <a
                              class="btn btn-success btn-sm"
                              href="temporal.php?id=<?php echo $value->id;?>">Device Code</a>
                          </td>
                          </tr>
  
                          <tr class="text-center">
                          <td>No device availabe now !</td>
                          </tr>
                          <?php }} ?>

                          </tbody>

                          </table>









                          </div>
                          </div>



<?php
  include 'inc/footer.php';

?>