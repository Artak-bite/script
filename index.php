<!DOCTYPE html>
<html>
  <head>
    <title>Apache,mysql,PHP</title>
  </head>
<body>
  <div class="container">
    <h1>Hello from script ;-))</h1>

    <form method="post">
      <input name="submit" type="submit" value="Check connection with MySql" style="background-color: red;">
    </form>

    <?php
         if (isset($_POST['submit'])) {

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
    ?>


  </div>
</body>
</html>

