const express = require("express");
const Ruta_inicio = express.Router();
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

// Ruta_inicio.get('/inicio',(peticion,respuesta)=>{
//     var user_id = peticion.session.usuario;
//     respuesta.render('validar');

   
// });

Ruta_inicio.post('/validar', (peticion,respuesta)=>{
    var logi= peticion.body.usuario;
    var pas=peticion.body.contraseña;

    var sql = `select * from usuario where usuario='${logi}' and contraseña='${pas}' `;
    conexion.query(sql,(error,rows,fields)=>{
        
        if(!error){
            peticion.session.usuario=rows;
            if(peticion.session.usuario.length>0){
                respuesta.redirect('/inicioBienvenida/Bienvenida');

            }else{
                respuesta.redirect('/');
            }
        }else{
            respuesta.send('error al ingresar '+ error);
        }
    })
})


// Ruta_inicio.get('/Bienvenida',(peticion,respuesta)=>{
//     respuesta.render('inicioBienvenida');
// });




Ruta_inicio.post('/registrar_usuario',(peticion,respuesta)=>{
    var identificacion_per=peticion.body.identificacion_per;
    var nombre_per=peticion.body.nombre_per;
    var usuario=peticion.body.usuario;
    var contraseña=peticion.body.contraseña;

    var sql =`insert into usuario (identificacion_per,nombre_per,usuario,contraseña) values('${identificacion_per}','${nombre_per}','${usuario}','${contraseña}')`;
  
    conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.send("Se Registro con exito el usuario");
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

module.exports=Ruta_inicio;