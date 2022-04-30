const express = require("express");
const session = require('express-session');
const Ruta_Reportes = express.Router();
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


Ruta_Reportes.get('/',validar,(peticion,respuesta)=>{
    respuesta.render('reportes');

   
});

Ruta_Reportes.post('/buscar_rango',(peticion,respuesta)=>{
    
    var desde=peticion.body.desde;
    var hasta=peticion.body.hasta;

     ;
     var sql =" select  idingresos,ofrenda,diezmo,primicia,otros,fecha_i,format(total_ingreso,2,'de_DE')as total_ingreso, nombre_p,identificacion_p,Date_format(fecha_i,'%Y-%m-%d') as dates   from ingresos join personas on id_persona= personas where DATE(fecha_i)  between '"+desde+"' and '"+hasta+"'";
     conexion.query(sql,(err,rows,fields)=>{
          
     if(!err){
           /*  console.log(sql); */
         respuesta.json(rows);
     }else{
         respuesta.json(err);
     }
    }); 
});

Ruta_Reportes.get('/listar_ingreso',(peticion,respuesta)=>{
    //var sql = "select * from ingresos";
    var sql ="SELECT idingresos,ofrenda,diezmo,primicia,otros,personas,fecha_i, total_ingreso, nombre_p,identificacion_p, Date_format(fecha_i,'%Y-%m-%d') as dates  FROM ingresos left join personas on id_persona=personas" ;
   conexion.query(sql,(err,rows,fields)=>{
   
       
    if(!err){ 
       
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});
//totales de ingresos
Ruta_Reportes.get('/listar_total',(peticion,respuesta)=>{
    var sql ="select format(sum(total_ingreso), 2,'de_DE')as totales from ingresos" ;
   conexion.query(sql,(err,rows,fields)=>{
      
       
    if(!err){
       
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});

Ruta_Reportes.get('/listar_egreso',(peticion,respuesta)=>{
    var sql ="select idegresos,tipo,concepto,fecha, valor_gasto, Date_format(fecha,'%Y-%m-%d')as dates from egresos  " ;
   conexion.query(sql,(err,rows,fields)=>{
       
    if(!err){
       
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});
//total egresos
Ruta_Reportes.get('/listar_totalE',(peticion,respuesta)=>{
    var sql ="select format(sum(valor_gasto), 2,'de_DE')as valor_gasto from egresos" ;
   conexion.query(sql,(err,rows,fields)=>{
      
       
    if(!err){
       
        respuesta.json(rows);
    }else{
        console.log('error de ejecución'+err);
    }
   }); 
});


//para formatear el número//

//format(total_ingreso,2,'de_DE')
//-format(valor_gasto,2,'de_DE')as





module.exports=Ruta_Reportes;