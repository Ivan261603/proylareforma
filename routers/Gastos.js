const express = require("express");
const Ruta_Gastos = express.Router();
const session = require('express-session');
const conexion = require('../conexion_bd');



Ruta_Gastos.get('/',(peticion,respuesta)=>{
    respuesta.render('Gastos');

   
});

Ruta_Gastos.post('/guardargastos',(peticion,respuesta)=>{   

    
    var tipo=peticion.body.tipo;
    var Concepto=peticion.body.Concepto; 
    var fecha = peticion.body.fecha;
    var total=peticion.body.total;
 
    var sql =`insert into egresos (tipo,concepto,fecha,valor_gasto) values('${tipo}','${Concepto}','${fecha}', ${total})`;
   console.log(sql)
    conexion.query(sql,(err,rows,fields)=>{
    if(!err){
     
        respuesta.send("Se Registraron con exito los Gastos");
    }else{
        console.log('error de ejecución'+err);
    }
   });  
}); 













module.exports=Ruta_Gastos;