<?php

include_once('session.php');

include_once('connect.php');

// Find id of the user:
$req = $connection->prepare('SELECT * FROM accounts WHERE last_name=? AND 
first_name=? AND username=?');

$req-> execute([$lastname, $firstname, $username]);

$row = $req->fetch(PDO::FETCH_ASSOC);
// print_r($row);

// Update all for this user:
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  if (isset($_POST['modify'])) {

    $error = null;
    try {
      if (strlen($_POST['lastname']) < 2 || strlen($_POST['lastname']) > 
      10) {
        throw new Exception("Nom non valide");
      }
      $newLastName = $_POST['lastname'];

      if (strlen($_POST['firstname']) < 2 || strlen($_POST['firstname']) > 
      10) {
        throw new Exception("Prénom non valide");
      }
      $newFirstName = $_POST['firstname'];

      if (strlen($_POST['username']) < 2 || strlen($_POST['username']) > 10) {
        throw new Exception("Username non valide");
      }
      $newUserName = $_POST['username'];

      if (strlen($_POST['password']) < 3 || strlen($_POST['password']) > 10) {
        throw new Exception("Mot de passe non valide");
      }
      $newPassword = password_hash($_POST['password'], PASSWORD_DEFAULT);

      if (!isset($_POST['secret_question']) || $_POST['secret_question'] == 
      '' || strlen($_POST['answer']) < 3) {
        throw new Exception("Question secrete ou réponse non valides");
      }
      $newSecretQuestion = $_POST['secret_question'];
      $newAnswer = $_POST['answer'];

      $modify = $connection->prepare('UPDATE accounts SET last_name=?, 
      first_name=?, username=?, password=?,  secret_question=?, answer=? 
      WHERE id=? LIMIT 1');
      $modify->execute([$newLastName, $newFirstName, $newUserName, 
      $newPassword, $newSecretQuestion,  $newAnswer, $row['id']]);

      $_SESSION['lastname'] = $newLastName;
      $_SESSION['firstname'] = $newFirstName;
      $_SESSION['username'] = $newUserName;

      header("Location: ./index.php", true, 302);
      exit();
    } catch (Exception $e) {
      $error = $e->getMessage() . '<br>';
    }
  }
}
include_once('header.php');
?>
    <form class="form-box" action="" method="POST">
      <h1>Modifier votre compte:</h1>
      <?php
          if (isset($error)) {
            echo '<div class="alert-danger" role="alert">' . $error . 
            '</div><br>';
          }
      ?>
      <label for="lastname">Nouveau nom(Entre 2 à 10 charactères): </label>
      <br>
      <input type="text" name="lastname" value="<?php if(isset($lastname)) 
      echo $lastname; ?>"><br>
      <label for="firstname">Nouveau prénom(Entre 2 à 10 caractères): 
      </label><br>
      <input type="text" name="firstname" value="<?php 
      if(isset($firstname)) echo $firstname; ?>"><br>
      <label for="username">Nouveau nom d'utilisateur(Entre 2 à 10 
          caractères): </label><br>
      <input type="text" name="username" value="<?php if(isset($username)) 
      echo $username; ?>"><br>

      <label for="password">Nouveau mot de passe(Entre 3 à 10 caractères): 
      </label><br>
      <input type="password" name="password"><br>

      <label for="secret_question">Choisir une question secrete: </label>
      <br>
      <select name="secret_question" id="secret_question">
        <option value="">--Choisir une option--</option>
        <option value="Quelle est votre couleur préférée?">Quelle est 
            otre couleur préférée?</option>
        <option value="Quel est le nom de votre mère?">Quel est le nom de 
            votre mère?</option>
        <option value="Où se trouve votre ville natale?">Où se trouve 
            votre ville natale?</option>
      </select><br>
      <label for="answer">Votre réponse(Plus que 2 charactères): </label>
      <br>
      <input type="text" name="answer" value="<?= $row['answer']; ?>">
      <br>
      <input type="submit" name="modify" value="Modifier">
    </form>
<?php
include_once('footer.php');
?>