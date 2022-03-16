<?php
    include 'inc/header.php';

    Session::CheckSession();

    $logMsg = Session::get('logMsg');
    if (isset($logMsg)) {
    echo $logMsg;
    }
    $msg = Session::get('msg');
    if (isset($msg)) {
    echo $msg;
    }
    Session::set("msg", NULL);
    Session::set("logMsg", NULL);
?>

<div class="card ">
        <div class="card-header">
          <h3><i class="fas fa-users mr-2"></i>User list <span class="float-right">Welcome! <strong>
            <span class="badge badge-lg badge-secondary text-white">
<?php
    $username = Session::get('username');
    if (isset($username)) {
    echo $username;
}
    ?></span>
    </strong></span></h3>
    </div>
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
                      <?php if (Session::get("id") == $value->id) {
                        echo "style='background:#d9edf7' ";
                    } ?>
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
                    <?php }}else{ ?>
                      <tr class="text-center">
                      <td>No device availabe now !</td>
                    </tr>
                    <?php } ?>
                </tbody>
