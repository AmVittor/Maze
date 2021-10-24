function tucuruvi(){
    texto.innerHTML ='Mensal'
    teste.innerHTML = `
     <canvas id="myChart" style="background-color: #2B2C2D" width="1000" height="400"> </canvas>
    `
  
    const config ={
        type:'line',
        data:{
            labels:['Semana 1','Semana 2','semana 3','Semana 4'],
            datasets:[
                {
                    label:'Volume de pessoas',
                    data:[20000,15000,32000,28000],
                    backgroundColor: '#00FF00',
                    borderColor:'FF00FF'
                }
            ]
        },
        options:{
            maintainAspectRatio: false
        }
    }
    var myChartLine = new Chart(document.getElementById("myChart"),config);
    }
    // const config ={
    //     type:'bar',
    //     data:{
    //         labels:['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    //         datasets:[
    //             {
    //                 label:['Volume de pessoas','Seila'],
    //                 data:[5000,15000,16000,14500,14250,1345,7000],
    //                 backgroundColor: ['#FF0000','#00FF00','00FF00','#00FF00','#00FF00','00FF00','#FFFF00'],
    //                 borderColor:'FF00FF'
    //             }
    //         ]
    //     },
    //     options:{
    //         maintainAspectRatio: false
    //     }
    // }
    // var myChartLine = new Chart(document.getElementById("myChart"),config);
    // }

function parada(){
    texto.innerHTML ='Diaria'
    teste.innerHTML = `
     <canvas id="parada" style="background-color: #2B2C2D" width="1000" height="400"> </canvas>
    `
    // const config ={
    //     type:'bar',
    //     data:{
    //         labels:['08:00','10:00','14:00','15:00'],
    //         datasets:[
    //             {
    //                 label:'Temp',
    //                 data:[15,17,32,20],
    //                 backgroundColor: '#00FFFF',
    //                 borderColor:'FF00FF'
    //             }
    //         ]
    //     },
    //     options:{
    //         maintainAspectRatio: false
    //     }
    // }
    // var myParada = new Chart(document.getElementById("parada"),config);
    
    const config ={
        type:'bar',
        data:{
            labels:['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
            datasets:[
                {
                    label:'Volume de pessoas',
                    data:[7000,10000,9000,12000,9250,8450,2000,0],
                    backgroundColor: ['#FFFF00','#00FF00','00FF00','#00FF00','#00FF00','00FF00','#FF0000'],
                    borderColor:'FF00FF'
                }
            ]
        },
        options:{
            maintainAspectRatio: false
        }
    }
    var myParada = new Chart(document.getElementById("parada"),config);
    }
    
