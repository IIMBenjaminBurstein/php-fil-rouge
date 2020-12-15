<?php
namespace App\Model;
use Core\Database;

class SondageModel extends Database{
    //sondage afficher pour les utilisateur déconnecté, connectez vous rhooo
    function sondageDeco(){
        // $_SESSION['connect'] == true;
        return $allSondage = $this->query(" SELECT q.`question`, u.`pseudo`, q.`image`, q.`date_fin` FROM `question` as q INNER JOIN `user` as u on q.`user_id_author` = u.`id` WHERE date_fin >= NOW() ORDER BY date_fin ASC limit 3");
    }
    function sondageDel(){
        if(isset($_GET['sondage'])){
            $sondIdHash = $_GET['sondage'];
            $sondId = 0;
            while(password_verify($sondId, $sondIdHash) == false){
                $sondId++;
              }
             $sondageSupp = $this->pdo->prepare("DELETE FROM question WHERE question_id =  $sondId ");
             $sondageSupp->execute();
             $comSupp = $this->pdo->prepare("DELETE FROM user_comment WHERE id_question_id =  $sondId ");
             $comSupp->execute();
             $answerSupp = $this->pdo->prepare("DELETE FROM answer WHERE id_question_id =  $sondId");
             $answerSupp->execute();
             $userAnswerSupp = $this->pdo->prepare("DELETE FROM user_answer WHERE id_question =  $sondId");
             $userAnswerSupp->execute();
             header('location:index.php?page=sondage');
        }
    }
    function sondage(){
        //quand l'utilisateur est connecté on récupère ses sondages et on les affiches
        $this->pdo->exec('SET time_zone = "+01:00"');
        $membre_id = $_SESSION['user']['id'];
        $sond = $this->query(" SELECT q.`question_id`, q.`question`, u.`pseudo`, q.`image`, q.`date_fin` FROM `question` as q INNER JOIN `user` as u on q.`user_id_author` = u.`id` WHERE date_fin >= NOW() AND q.`user_id_author` <> ' $membre_id'  ORDER BY date_fin ASC");
        $sondPerso = $this->query("SELECT question_id, question, `image`, date_fin FROM question WHERE date_fin >= NOW() and `user_id_author` = '$membre_id' "); 
        return $requete = array($sond, $sondPerso);
    }

   
    
}   