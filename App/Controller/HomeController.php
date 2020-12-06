<?php
namespace App\Controller;

use App\Model\HomeModel;

class HomeController{

    public function __construct()
    {
        $this->model = new HomeModel();
    }
    public function render()
    {    //si la variable connect n'existe pas dans le $_Session on lui donne la valeur false
        if(!isset($_SESSION['connect'])){
            $_SESSION['connect'] = false;
        }
        $this->model->home();
        require ROOT."/App/View/homeView.php";
    }
}