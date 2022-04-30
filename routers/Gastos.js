const express = require("express");
const Ruta_Gastos = express.Router();
const session = require('express-session');
const conexion = require('../conexion_bd');

//para validar el ingreso a las rutas//
function validar(peticion,respuesta,next){
    if(peticion.session.usuario){
        next();
    }
    else{
        
        respuesta.redirect('/');
    }
}



Ruta_Gastos.get('/',validar,(peticion,respuesta)=>{
    respuesta.render('Gastos');

   
});
var offset = 0;
/* Ruta_Gastos.get('/listar_egreso', (peticion,respuesta)=>{

    var sql = `select *, Date_format(fecha,'%Y-%m-%d') as dates from egresos  order by dates desc limit ${offset} , 2 `;
    
    conexion.query(sql,(error,rows,fields)=>{
        conexion.query(sql,(err,rows,fields)=>{
            if(!err){
                respuesta.json(rows);
                offset +=(rows.length);
                console.log(rows.length);
                if(rows.length== 0){
                    console.log('no hay nada');
                    offset= 0;

                    console.log(offset);
                    
                }
                
            }else{
                console.log('error de ejecución'+err);
            }
           }); 
       
    })
})
 */
/* Ruta_Gastos.get('/mostrarMas', (peticion,respuesta)=>{

    var sql = `select *, Date_format(fecha,'%Y-%m-%d') as dates from egresos  order by dates desc limit  ,3  `;
   
    conexion.query(sql,(error,rows,fields)=>{
        conexion.query(sql,(err,rows,fields)=>{
            if(!err){
                respuesta.json(rows);
                offset +=(rows.length);
               
              console.log(offset);
               
                
            }else{
                console.log('error de ejecución'+err);
            }
           }); 
       
    })
})
 */
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


Ruta_Gastos.delete('/Eliminar',(peticion,respuesta)=>{
    var idegresos= peticion.body.idegresos;
    
    var sql= `delete from egresos  where idegresos='${idegresos}'`;

    conexion.query(sql,(err,rows,fields)=>{
        if(!err){
            respuesta.send('Se Elimino con Éxito');
        }else{
            console.log('no se realizo el proceso'+err);
        }

    });
});













module.exports=Ruta_Gastos;