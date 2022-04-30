const express = require("express");
const Ruta_inicio = express.Router();
const session = require('express-session');
const conexion = require('../conexion_bd');
//para encriptar password//
const bcryptjs = require('bcryptjs');

function validar(peticion,respuesta,next){
    if(peticion.session.usuario){
        next();
    }
    else{
        return respuesta.sendStatus(401);
        //respuesta.redirect('/');
    }
}
Ruta_inicio.get('/',(peticion,respuesta)=>{
  /*  else{
        respuesta.redirect('/',{
           
        });
    } */
    respuesta.end();
});

/*  Ruta_inicio.get('/inicio',(peticion,respuesta)=>{
     //var user_id = peticion.session.usuario;
     respuesta.render('validar');

   
 }); */

Ruta_inicio.post('/validar', async(peticion,respuesta)=>{
    var usuario= peticion.body.usuario;
    var contraseña=peticion.body.contraseña;
    let passWordHaash = await bcryptjs.hash(contraseña,6);

    if(usuario && contraseña){
        var sql = `select * from usuario where usuario='${usuario}' `;
        
        conexion.query(sql, async(error,rows,fields)=>{
            if(rows.length == 0 || !(await bcryptjs.compare(contraseña,rows[0].contraseña))){
              
                respuesta.render('validar',{
                    alert: true,
                    alertTitle: "Advertencia",
                    alertText: "Usuario Y/O Contraseña Incorrectos",
                    alertIcon:'error',
                    showConfirmButton: true,
                    timer: 5000,
                    ruta : 'validar'
                });
                
                console.log('Datos no Validos');

            }else{
                //respuesta.send('ok ');
               var user = peticion.session.usuario = rows[0].usuario;
                console.log('rrr'+user);
                respuesta.redirect('/inicioBienvenida/Bienvenida');
            }  
                
        })
    }else{
        respuesta.render('validar',{
            alert: true,
            alertTitle: "Advertencia",
            alertText: "Debe Ingresar Usuario Y Contraseña",
            alertIcon:'warning',
            showConfirmButton: true,
            timer: 4000,
            ruta : 'validar'
        })
    }
    
  
})



// Ruta_inicio.get('/Bienvenida',(peticion,respuesta)=>{
//     respuesta.render('inicioBienvenida');
// });




Ruta_inicio.post('/registrar_usuario',async(peticion,respuesta)=>{
    var identificacion_per=peticion.body.identificacion_per;
    var nombre_per=peticion.body.nombre_per;
    var _usuario=peticion.body._usuario;
    var contraseña=peticion.body.contraseña;
    let passWordHaash = await bcryptjs.hash(contraseña,6);
    
    var sql =`insert into usuario (identificacion_per,nombre_per,usuario,contraseña) values('${identificacion_per}','${nombre_per}','${_usuario}','${passWordHaash}')`;
    
    conexion.query(sql,async(err,rows,fields)=>{
    if(!err){
        respuesta.send("Se Registro con exito el usuario");
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

module.exports=Ruta_inicio;