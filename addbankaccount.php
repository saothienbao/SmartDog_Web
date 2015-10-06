<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);

if (isset($_SESSION["email"]) && isset($_SESSION["userid"])){
    if(isset($_POST["accountname"]) && isset($_POST["belong_to"]) && isset($_POST["income"]) && isset($_POST["date"])){
        
        $email = $_SESSION["email"];
        $userid = $_SESSION["userid"];
        $accountbank = $_POST["accountbank"];
        $belong_to = $_POST["belong_to"];
        $income = $_POST["income"];
        $date = $_POST["date"];
        
        $account = $db ->addbankaccount($email,$accountname, $belong_to, $income, $date);
        
        if($account){
            $response["error"] = FALSE;
            $response["accid"] = $account["idaccount"];
            $response["accountbank"]["name"]=$account["accountname"];
            $response["accountbank"]["belong_to"]=$account["belong_to"];
            $response["accountbank"]["income"]=$account["income"];
            $response["accountbank"]["date"]= $account["date"];
            
            echo json_encode($response);
        } else {
            // user failed to store
            $response["error"] = TRUE;
            $response["error_msg"] = "Unknown error occurred in adding bank account!";
            echo json_encode($response);
        }
    }
    else {
       
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters (accountbank , income or date created) is missing!";
    echo json_encode($response);
    }
    
}