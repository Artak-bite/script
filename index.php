<!DOCTYPE html>
<html>
  <head>
    <title>Apache,mysql,PHP</title>
  </head>
<body>
  <div class="container">
    <h1>Hello from script ;-))</h1>

    <form method="post">
      <input name="submit_mysql" type="submit" value="Check connection with MySql" style="background-color: red; border-radius: 25px">
    </form>

    </br>

    <form method="post">
      <input name="submit_redis" type="submit" value="Check connection with Redis" style="background-color: blue; border-radius: 25px">
    </form>

    </br>

    <form method="post">
      <input name="submit_elastic" type="submit" value="Check connection with Elastic Serch" style="background-color: orange; border-radius: 25px">
    </form>

    <?php
        if (isset($_POST['submit_mysql'])) {

           $servername = "127.0.0.1";
           $database = "DB";
           $username = "root";
           $password = "mypass";

           $conn = new mysqli($servername, $username, $password, $database);
           if($conn->connect_error){
             echo 'connection failed' . $conn->connect_error;
           }
           echo 'Successfully connected to MYSQL' ;
        }

	if (isset($_POST['submit_redis'])) {

	}

	if (isset($_POST['submit_elastic'])) {

	}
    ?>


  </div>
</body>
</html>

