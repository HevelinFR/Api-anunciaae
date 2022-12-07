<?php
$pdo = new PDO("mysql:host=localhost;dbname=anuncia_ae","root","");


parse_str(file_get_contents("php://input"), $_PUT);

$method = $_SERVER["REQUEST_METHOD"];

$url = $_SERVER['REQUEST_URI'];

$uri = explode("/", $url);

$tamanhoUri =  count($uri);

//Listar produtos
if($method == "GET" && $uri[3] == "produtos"){
    
    $resultado = $pdo->query("select * from products");

    $resultado = $resultado->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($resultado);
    
}

//Cadastrar um novo produto
if($method == "POST" && $uri[3] == "produtos"){
    if(isset($_POST["title"]) && isset($_POST["description"]) && isset($_POST["price"]) && isset($_POST['image']) && isset($_POST['id_cliente'])){
        
        $resultado = $pdo->query("insert into products (id_cliente,title,description,price,image) values ({$_POST["id_cliente"]},'{$_POST["title"]}','{$_POST["description"]}', {$_POST["price"]}, '{$_POST["image"]}')");

        echo "Produto adicioando com sucesso!";

    }
    else{
        echo "Adicione todos os dados";
    }  
}

//Apagar um produto
if($method == "DELETE" && $uri[3] == "produtos" && $tamanhoUri == 5){
   
    $id = $uri[4];
    $resultado = $pdo->query("delete from products WHERE id = $id;");

    echo "Apagado com sucesso!";

}

//Edição de produtos 

if($method == "PUT" && $uri[3] == "produtos" && $tamanhoUri == 5){
    $id = $uri[4];
    $data = [];
   
    if(isset($_PUT["title"])){
        $data[] = "title = '{$_PUT['title']}'";
    }
    if(isset($_PUT["description"])){
        $data[] = "description = '{$_PUT['description']}'";
    }
    if(isset($_PUT["price"])){
        $data[] = "price = '{$_PUT['price']}'";
    }
    if(isset($_PUT["image"])){
        $data[] = "image = '{$_PUT['image']}'";
    }
    
   
}


//Cadastrar um novo produto
if($method == "POST" && $uri[3] == "clientes"){
    if(isset($_POST["name"]) && isset($_POST["document"]) && isset($_POST["zip_code"]) && isset($_POST["district"]) && isset($_POST["address"]) && isset($_POST["password"])){
        
        $resultado = $pdo->query("insert into clientes (email,name,document,zip_code,district,address,password) values ('{$_POST["email"]}','{$_POST["name"]}','{$_POST["document"]}','{$_POST["zip_code"]}', '{$_POST["district"]}', '{$_POST["address"]}','{$_POST["password"]}' )");

        echo "Cliente cadastrado  com sucesso!";

    }
    else{
        echo "Adicione todos os dados";
    }  
}

//pegar um cliente
if($method == "POST" && $uri[3] == "login"){

    $login = $_POST["email"];
    $senha = $_POST["password"];
    
    $resultado = $pdo->query("select * from clientes where email = '$login' AND password = '$senha' ");

    $resultado = $resultado->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($resultado);
    
}