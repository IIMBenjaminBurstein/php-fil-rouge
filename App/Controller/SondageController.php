<?php
namespace App\Controller;

use App\Model\SondageModel;


class SondageController{
    public function __construct()
    {
        $this->model = new SondageModel();
    }
    public function render()
    {    //si la variable connect n'existe pas dans le $_Session on lui donne la valeur false
        if(!isset($_SESSION['connect'])){
            $_SESSION['connect'] = false;
        }
        //s'il est connecté on lui demande les methodes 
        if($_SESSION['connect']){
            $requete = $this->model->sondage();
            $this->model->sondageDel();
        }else{
            //sinon on lui demande une autre méthode
            $allSondage = $this->model->sondageDeco();
        }     
        //on require la vue    
        require ROOT."/App/View/SondageView.php";
    }
}