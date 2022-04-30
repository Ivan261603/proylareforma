const express = require("express");
const HistoricoGasto = express.Router();
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



HistoricoGasto.get('/',validar,(peticion,respuesta)=>{
    respuesta.render('HistoricoGasto');

   
});
//var offset = 0;
HistoricoGasto.post('/listar_egreso', (peticion,respuesta)=>{
    var offset = peticion.body.offset;
    var sql = `select *, Date_format(fecha,'%Y-%m-%d') as dates from egresos  order by dates desc limit ${offset} , 3 `;
    console.log(offset);
    conexion.query(sql,(error,rows,fields)=>{
        conexion.query(sql,(err,rows,fields)=>{
            if(!err){
                respuesta.json(rows);
                offset+=(rows.length);
                
              /*   if(rows.length== 0){
                   offset= 0;
                } */
               
               /*  {
                    console.log('no hay nada');
                    /

                    console.log(offset);
                    
                } */
              
                    //offset +=(rows.length);
                    
                    
                
            }else{
                console.log('error de ejecución'+err);
            }
           }); 
       
    })
})




module.exports =HistoricoGasto;