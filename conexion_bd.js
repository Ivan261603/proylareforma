const mysql=require("mysql");
var conexion=mysql.createConnection({
    //base de datos local
    host :  "localhost",
    user :  "root",
    password: "",
    database:  "proyecto_adsi"

    //base de datos remora
   /*  host :  "bxujzio2r1z0khnhp6y1-mysql.services.clever-cloud.com",
    user :  "ug8ld1ee9ebqgmyq",
    password:  "6rO58k5HXYOgnDFjffec",
    database:   "bxujzio2r1z0khnhp6y1" */
    });
conexion.connect((err)=>{
        if(!err){
            console.log('Conectado al motor de base de datos de MySql');
        }
        else{
            console.log('No se conecto al motor de base de datos de MySql :'+err);
        }
    });    
module.exports=conexion;


