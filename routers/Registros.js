const express = require("express");
const session = require('express-session');
const Ruta_Registros = express.Router();
const conexion = require('../conexion_bd');



Ruta_Registros.get('/',(peticion,respuesta)=>{
    respuesta.render('index');

   
});

Ruta_Registros.get('/listar_departamento',(peticion,respuesta)=>{
    
    
    var sql =`select * from departamentos`;
    conexion.query(sql,(err,rows,fields)=>{
        
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_Registros.get('/listar_municipio',(peticion,respuesta)=>{
    
    
    var sql =`select * from municipios`;
    conexion.query(sql,(err,rows,fields)=>{
        
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});



Ruta_Registros.get('/listar_personas',(peticion,respuesta)=>{
    var sql ="select * from personas";
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

/* buscador del modal reg ingre */
Ruta_Registros.post('/Buscar_datos',(peticion,respuesta)=>{
    
    var ident=peticion.body.datos;

    var sql ="select * from personas where identificacion_p ="+ident+" ";
  
    conexion.query(sql,(err,rows,fields)=>{

    if(!err){
        /* console.log(sql); */
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_Registros.post('/Buscar_persona',(peticion,respuesta)=>{

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

/* para la tabla listarPersona */
Ruta_Registros.post('/seleccionar_persona',(peticion,respuesta)=>{

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
var Servidor = express();
const multer = require('multer');
const mimeTypes = require('mime-types');
//const { now } = require("moment");

const storage = multer.diskStorage({
    destination: 'public/upload/',
    filename: function(peticion,file,cb){
    cb(null,Date.now() + file.originalname);
    }
});

const upload = multer({
    storage:storage,
    limits:{fieldSize:2000000}
})



//para registrar personas
Ruta_Registros.post('/subirImage',upload.single('avatar'),(peticion,respuesta)=>{
    var estado_p=peticion.body.estado_p;
    var nombre_p=peticion.body.nombre_p;
    var tipo_identificacion=peticion.body.tipo_identificacion;
    var fecha=peticion.body.fecha;
    var identificacion_p=peticion.body.identificacion_p;
    var departamento=peticion.body.departamento;
    var municipio=peticion.body.municipio;
    var direccion=peticion.body.direccion;
    var telefono=peticion.body.telefono;
    var rol_per=peticion.body.rol_per;
    var discipulado =peticion.body.discipulado;
    var bautizado=peticion.body.bautizado;
    //var imgsub=peticion.file.filename;
    if(peticion.file){
        var imgsub=peticion.file.filename;
         console.log(peticion.file);
    }
    
    var sql =`insert into personas (nombre_p,tipo_identificacion,identificacion_p,direccion,id_departamento,id_municipio,telefono,fecha,rol_per,disipulado,bautizado,imagen,estado_p) values('${nombre_p}','${tipo_identificacion}','${identificacion_p}','${direccion}','${departamento}','${municipio}','${telefono}','${fecha}','${rol_per}','${discipulado}','${bautizado}','${imgsub}','${estado_p}')`;
    //console.log(sql);
   
    conexion.query(sql,(err,rows,fields)=>{
    
    if(!err){
        
        var responseJson = {
            'status':200,
            'mensaje':'Datos Registrado con Exito!!'
        }
        respuesta.send(JSON.stringify(responseJson));
    }
   /*  else if(err=1062 ){
        var responseJson = {
            'status':500,
            'code':err,
            'mensaje':'El Número de Identificación:'+identificacion_p+' ya se encuentra registrado'
        }
        respuesta.send(JSON.stringify(responseJson));
      
    } */
    else{
        respuesta.send(err +'Ha ocurrido un error al registrar los datos de la persona')
        console.log(err);
    }
   }); 
    
});

//para capturar error
Ruta_Registros.post('/subirImage',(peticion,respuesta)=>{
    subimg(peticion,respuesta,function(error){
        if(error instanceof multer.MulterError){
       console.log('holasss');
        }else if(error){
            console.log(error);
        }
    });
  
});

module.exports=Ruta_Registros;