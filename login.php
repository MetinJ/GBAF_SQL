<?php
// "Mot de passe oublié?" a link to set new password
// pass all the info from this page to other pages:
  session_start();

  $lastname;
  $firstname;
  $username;
  if (isset($_SESSION['lastname'])) $lastname = $_SESSION['lastname'];
  if (isset($_SESSION['firstname'])) $firstname = $_SESSION['firstname'];
  if (isset($_SESSION['username'])) $username = $_SESSION['username'];
  if (isset($_COOKIE['lastname'])) $lastname = $_COOKIE['lastname'];
  if (isset($_COOKIE['firstname'])) $firstname = $_COOKIE['firstname'];
  if (isset($_COOKIE['username'])) $username = $_COOKIE['username'];

  if (isset($username) && isset($lastname) && isset($firstname)) {
    header("Location: ./index.php", true, 302);
    exit();
  }

  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    include_once('connect.php');
    $req = $connection->prepare('SELECT last_name, first_name, username, 
    password FROM accounts WHERE username=?');
    $req->execute([$_POST['username']]);

    $error = null;
    try {
      if ($req->rowCount() == 0) {
        throw new Exception("Username/mot de passe non valide");
      } else {
        // $row = all the info as an object
        $row = $req->fetch(PDO::FETCH_ASSOC);
        // print_r($row);
        if (!password_verify($_POST['password'], $row['password'])) {
          throw new Exception("Mot de passe incorrect");
        } else {
          $_SESSION['lastname'] = $row['last_name'];
          $_SESSION['firstname'] = $row['first_name'];
          $_SESSION['username'] = $row['username'];

          if (!empty($_POST['remember_me'])) {
            setcookie('username', $row['username'], 
            time() + 3600 * 24 * 30);
            setcookie('lastname', $row['last_name'], 
            time() + 3600 * 24 * 30);
            setcookie('firstname', $row['first_name'], 
            time() + 3600 * 24 * 30);

          }

          header("Location: ./index.php", true, 302);
          exit();
        }
      }
    } catch (Exception $e) {
      $error = $e->getMessage();
    }
  }
  include_once('header.php');
?>
    <form class="form-box" action="" method="POST">
      <?php
        if(isset($_SESSION['success']) && ($_SESSION['success'] == 'ok')) {
          echo '<div class="alert-success" role="alert">Votre compte a 
          bien été créé!</div>';
          echo '<div class="alert-success">Connectez-vous dès 
          maintenant&nbsp;&nbsp;&nbsp;<i class="fas fa-hand-point-down"></i></div><br>';
          unset($_SESSION['success']);
        }
      ?>
      <h1>S'identifier:</h1>
      <h3>Nouveau salarié? &nbsp;<a href="inscription.php">S'inscrire</a></h3><br>
      <h4>Entrer votre nom d'utilisateur et votre mot de passe</h4><br>
      <?php
        if (isset($error)) {
          echo '<div class="alert-danger" role="alert">' . $error . 
          '</div><br>';
        }
      ?>
      <label for="username">Nom d'utilisateur: </label>
      <input type="text" name="username">
      <br>
      <label for="password">Mot de passe: </label>
      <input type="password" name="password"><br>
      <p><a href="forget_password.php">Mot de passe oublié?</a></p><br>
      <input type="checkbox" name="remember_me">&nbsp;Rester connecté<br>
      <input type="submit" name="submit" value="S'identifier">
      <br>
    </form>

<?php
include_once('footer.php');
?>