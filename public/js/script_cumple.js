/* const { table } = require("console"); */
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
    
  });

          listar_cumple();
          function listar_cumple(){
              fetch('/inicioBienvenida/show_cumple',{
                method:'get'
          
            })
            .then(resp=>resp.json())
            .then(data=>{
                var html = '';


                for (var i in data){
                    html+=`<div>${data[i].nombre_p}
                    
                    </div>`

                         
                }
                if(data.length>0){
                   /*  document.getElementById('alerta').innerHTML= +html;  */
                    Swal.fire({
                        title:'<spam class=ttl>¡CUMPLEAÑOS!</spam>',
                        text:' Hoy es el cumpleaños de ',
                        width:600,
                        //icon:'info',
                        html: '<h3 class=tt> Hoy es el cumpleaños de '+html,
                        background:'#fff url(/img/cumple.png) no-repeat',
                        timer:4000,
                        timerProgressBar:true
                        //toast:true,
                        //position:'top-end'
                        //ImageUrl:'https://unsplash.it/400/200',
                        
                        //imageAlt:'custon image'

                    }); 

                }
                else{
                    document.getElementById('alerta').style='display:none';
                    
                }
               
                console.log(data);
          
              
            });
          }
          //funcion para mostra foto
          document.getElementById('imgsub').addEventListener('change',(e)=>{
            console.log(e.target.files[0]);
            document.getElementById('previa');
            let name = e.target.files[0];
            let img = URL.createObjectURL(name);
            document.getElementById('foto').src = img;
        
        });
   
          function exportTableToExcel(tabla, filename = 'hoja'){
              
            var downloadLink;
            var dataType = 'application/vnd.ms-excel';
            var tableSelect = document.getElementById('tabla');
            var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
            
            // Specify file name
            filename = filename?filename+'.xls':'excel_data.xls';
            
            // Create download link element
            downloadLink = document.createElement("a");
            
            document.body.appendChild(downloadLink);
            
            if(navigator.msSaveOrOpenBlob){
                var blob = new Blob(['ufeff', tableHTML], {
                    type: dataType
                });
                navigator.msSaveOrOpenBlob( blob, filename);
            }else{
                // Create a link to the file
                downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
            
                // Setting the file name
                downloadLink.download = filename;
                
                //triggering the function
                downloadLink.click();
            }
        }

        /* tabla de gastos */
        function exportTableToExcelgas(tablaE, filename = 'Gastos'){
              
            var downloadLink;
            var dataType = 'application/vnd.ms-excel';
            var tableSelect = document.getElementById('tablaE');
            var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
            
            // Specify file name
            filename = filename?filename+'.xls':'excel_data.xls';
            
            // Create download link element
            downloadLink = document.createElement("a");
            
            document.body.appendChild(downloadLink);
            
            if(navigator.msSaveOrOpenBlob){
                var blob = new Blob(['ufeff', tableHTML], {
                    type: dataType
                });
                navigator.msSaveOrOpenBlob( blob, filename);
            }else{
                // Create a link to the file
                downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
            
                // Setting the file name
                downloadLink.download = filename;
                
                //triggering the function
                downloadLink.click();
            }
        }

      