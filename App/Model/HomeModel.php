<?php namespace App\Model;
use Core\Database;

class HomeModel extends Database {
    function home(){
        
    }
    function statut(){
        //Permets d'attribuer une valeur au statut pour savoir quand l'utilisateur est connecté ou non
        if($_SESSION['connect'])
        {
            $co =$this->pdo->prepare("UPDATE user SET statut= 1 WHERE id =" . $_SESSION['user']['id']);
            $co->execute();
        } //si l'utilisateur appuie sur le bouton déconnexion alors on push un 0 dans la table user statut
        if(isset($_GET['action']) && $_GET['action'] == 'deconnexion'){
            $co =$this->pdo->prepare("UPDATE user SET statut= 0 WHERE id =" . $_SESSION['user']['id']);
            $co->execute();
        }
    }
}