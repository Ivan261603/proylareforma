const express = require("express");
const Ruta_ListarPersona = express.Router();
const session = require('express-session');
const conexion = require('../conexion_bd');



Ruta_ListarPersona.get('/',(peticion,respuesta)=>{
    respuesta.render('ListarPersona');

   
});

//listar tabla personas
Ruta_ListarPersona.get('/listar_personas',(peticion,respuesta)=>{
    var sql ="select *, Date_format(fecha,'%Y-%m-%d') as dates from personas left join departamentos on personas.id_departamento=departamentos.id_departamento left join municipios on personas.id_municipio=municipios.id_municipio where estado_p= 1";
    //var sql ="select *,Date_format(fecha,'%Y-%m-%d') as dates  from personas";
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
const subimg = multer().single('avatar')

//Actualizar datos de personas
Ruta_ListarPersona.put('/ActualizarPersona',upload.single('avatar'),(peticion,respuesta)=>{
    var id=peticion.body.id_persona;
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
    var imagen = peticion.body.imagen;
     

    if(peticion.file){
        var imgsub=peticion.file.filename;
         console.log(peticion.file);
    }
    else if (peticion.file==undefined){
        imgsub=imagen;
        
        
    }
    
    var sql= `update personas set nombre_p ='${nombre_p}', tipo_identificacion ='${tipo_identificacion}',identificacion_p='${identificacion_p}',id_departamento='${departamento}',id_municipio='${municipio}',direccion='${direccion}',telefono='${telefono}',fecha='${fecha}',rol_per='${rol_per}',disipulado='${discipulado}',bautizado='${bautizado}',imagen='${imgsub}' where id_persona=${id}`;
    
  
    conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        
        respuesta.send("Se Actualiza con exito los Datos");
        console.log(sql);
    }
    else{
        
        respuesta.send('Tiene un error en el proceos'+err);
        console.log(err);
    }
   }); 
});

Ruta_ListarPersona.get("/upload", (req, res) => {
    res.sendFile(path.join(__dirname, "./uploads"));
  });

//funcion de seleccionar persona
Ruta_ListarPersona.post('/Buscar_persona',(peticion,respuesta)=>{

    var id=peticion.body.id_persona;

    var sql ="select *,Date_format(fecha,'%Y-%m-%d') as fecha,tipo_identificacion from personas left join departamentos on personas.id_departamento=departamentos.id_departamento left join municipios on personas.id_municipio=municipios.id_municipio where id_persona ="+id;
   conexion.query(sql,(err,rows,fields)=>{
    if(!err){
        respuesta.json(rows);
       console.log(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});


Ruta_ListarPersona.delete('/Eliminar',(peticion,respuesta)=>{
    var id_persona= peticion.body.id_persona;
    
    var sql= `update personas set estado_p=0  where id_persona='${id_persona}'`;

    conexion.query(sql,(err,rows,fields)=>{
        if(!err){
            respuesta.send('Se Elimino con Éxito');
        }else{
            console.log('no se realizo el proceso'+err);
        }

    });
});




module.exports=Ruta_ListarPersona;
