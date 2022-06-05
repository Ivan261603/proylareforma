const express = require("express");
const Ruta_RegistroIng = express.Router();
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


Ruta_RegistroIng.get('/',validar,(peticion,respuesta)=>{
    respuesta.render('RegistroIng',{usuario:peticion.session.usuario});

   
});

Ruta_RegistroIng.post('/Buscar_persona',(peticion,respuesta)=>{

    var id=peticion.body.id_persona;

    var sql ="select * from personas where id_persona ="+id;
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_RegistroIng.post('/guardar',(peticion,respuesta)=>{   

    var ofrenda=peticion.body.ofrenda;
    var diezmo=peticion.body.diezmo;
    var primicia=peticion.body.primicia;
    var otros=peticion.body.otros;
    var fecha = peticion.body.fecha;
    var id_persona=peticion.body.id_persona; 
    var total=peticion.body.total;
 
    var sql =`insert into ingresos (ofrenda,diezmo,primicia,otros,fecha_i,personas,total_ingreso) values(${ofrenda},${diezmo},${primicia},${otros}, '${fecha}',${id_persona},'${total}')`;
    
   console.log(sql)
   console.log(sql2)
    conexion.query(sql,sql2,(err,rows,fields)=>{
    if(!err){
     
        respuesta.send("Se Registraron con exito los ingresos");
    }else{
        console.log('error de ejecución'+err);
    }
   });  


}); 












module.exports=Ruta_RegistroIng;