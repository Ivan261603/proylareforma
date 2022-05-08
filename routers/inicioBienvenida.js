const express = require("express");
const Ruta_inicioBienvenida = express.Router();
const session = require('express-session');
const conexion = require('../conexion_bd');


function validar(peticion,respuesta,next){
    if(peticion.session.usuario){
        next();
    }
    else{
        
        respuesta.redirect('/');
    }
}

Ruta_inicioBienvenida.get('/Bienvenida',validar,(peticion,respuesta)=>{
    
    respuesta.render('inicioBienvenida',{usuario:peticion.session.usuario});
    //console.log(peticion.session.usuario);
});

Ruta_inicioBienvenida.get('/listar_peticion',(peticion,respuesta)=>{
    var sql ="select * from oracion";
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_inicioBienvenida.post('/seleccionar_peticion',(peticion,respuesta)=>{

    var id_Peticion=peticion.body.id_Peticion;

    var sql ="select * from oracion where id_Peticion = "+id_Peticion;
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_inicioBienvenida.post('/registrar_peticion',(peticion,respuesta)=>{
    var titulo= peticion.body.titulo;
    var motivo= peticion.body.motivo;
    var sql= `insert into oracion (titulo,motivo) values('${titulo}','${motivo}')`;

    conexion.query(sql,(err,rows,fields)=>{
        if(!err){
            respuesta.send('Se Registro con Exito');
        }else{
            respuesta.send('error 2'+ err);
        }

    });
});

Ruta_inicioBienvenida.put('/Actualizar',(peticion,respuesta)=>{
    var id_peticion= peticion.body.id_peticion;
    var titulo= peticion.body.titulo;
    var motivo= peticion.body.motivo;
    var sql= `update oracion set titulo='${titulo}',motivo='${motivo}' where id_Peticion=${id_peticion}`;

    conexion.query(sql,(err,rows,fields)=>{
        if(!err){
            respuesta.send('Se Actualizo con Exito');
        }else{
            respuesta.send('error 2'+ err);
        }

    });
});


Ruta_inicioBienvenida.delete('/Eliminar',(peticion,respuesta)=>{
    var id_Peticion= peticion.body.id_Peticion;
    
    var sql= `delete from oracion where id_Peticion='${id_Peticion}'`;

    conexion.query(sql,(err,rows,fields)=>{
        if(!err){
            
            respuesta.send('se elimino con exito');
        }else{
            console.log('no se realizo el proceso'+err);
        }

    });
});


Ruta_inicioBienvenida.get('/show_cumple',(peticion,respuesta)=>{
    
    var sql ="SELECT * FROM personas where MONTH(fecha)= MONTH(NOW()) and DAY(fecha)=DAY(NOW())";
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});



module.exports=Ruta_inicioBienvenida;