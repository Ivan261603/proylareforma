require('dotenv').config();
const express=require('express');
const Ruta_Registros = require('./routers/Registros');
const Ruta_inicio = require('./routers/inicio');
const Ruta_inicioBienvenida = require('./routers/inicioBienvenida');
const Ruta_RegistroIng = require('./routers/RegistroIng');
const body_parser=require('body-parser');
var session=require('express-session');
const Ruta_Reportes = require('./routers/Reportes');
const Ruta_Gastos = require('./routers/Gastos');
const Ruta_ListarPersona = require('./routers/ListarPersona');

var Servidor = express();


const multer = require('multer');
const mimeTypes = require('mime-types');

const storage = multer.diskStorage({
    destination: 'upload/',
    filename: function(peticion,file,cb){
    cb("", Date.now() + file.originalname+ "." + mimeTypes.extension(file.mimetype));
    }
});

const upload = multer({
    storage:storage
})


Servidor.set('view engine','ejs');
Servidor.set('views',__dirname+'/views');

Servidor.use(express.static(__dirname+'/public'));
Servidor.set(body_parser.json()); 
Servidor.use(body_parser.urlencoded({extended:true}));


Servidor.get('/',(peticion, respuesta)=>{
    respuesta.render('validar');
});

Servidor.post('/files',upload.single('avatar'),(peticion, respuesta)=>{
    respuesta.send ('todo ok');
});
/* Servidor.get('/inicio',(peticion, respuesta)=>{
    respuesta.render('inicio'); 
});
/* Servidor.get('/Registro',(peticion, respuesta)=>{
    respuesta.render('Registro');
}); */
Servidor.set('port',process.env.PORT || 4000);

Servidor.use(session({
    secret:"mi_texto_hidden",
    resave:true,
    saveUninitialized:true
}));
/* Routers */
Servidor.use('/inicio',Ruta_inicio);
Servidor.use('/Registros',Ruta_Registros);
Servidor.use('/RegistroIng',Ruta_RegistroIng);
Servidor.use('/inicioBienvenida',Ruta_inicioBienvenida);
Servidor.use('/Reportes',Ruta_Reportes);
Servidor.use('/Gastos',Ruta_Gastos);
Servidor.use('/ListarPersona',Ruta_ListarPersona);

//puerto local
Servidor.listen(Servidor.get('port') ,()=>{
    console.log(`El servidor se esta ejecutando en el puerto 4000 ${Servidor.get('port')}`);
});