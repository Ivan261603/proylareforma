const express = require("express");
const HistoricoGasto = express.Router();
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



HistoricoGasto.get('/',validar,(peticion,respuesta)=>{
    respuesta.render('HistoricoGasto',{usuario:peticion.session.usuario});

   
});

HistoricoGasto.post('/listar_egreso', (peticion,respuesta)=>{
    var offset = peticion.body.offset;
    var sql = `select *, Date_format(fecha,'%Y-%m-%d') as dates from egresos  order by dates desc limit ${offset} , 3 `;
    console.log(offset);
        conexion.query(sql,(err,rows,fields)=>{
            if(!err){
                respuesta.json(rows);
                offset+=(rows.length);
                
              /*   if(rows.length== 0){
                   offset= 0;
                } */       
                
            }else{
                console.log('error de ejecución'+err);
            }
           }); 
       
    
})




module.exports =HistoricoGasto;