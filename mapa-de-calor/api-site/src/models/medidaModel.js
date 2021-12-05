var database = require("../database/config");


// function buscarUltimasMedidas(idAquario, limite_linhas) {
//     instrucaoSql = `select 
//                         temperatura, 
//                         umidade, 
//                         momento,
//                         DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
//                     from medida
//                     where fk_aquario = ${idAquario}
//                     order by id desc limit ${limite_linhas}`;
//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }

// function buscarMedidasEmTempoReal(idAquario) {
//     instrucaoSql = `select 
//                         temperatura, 
//                         umidade, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
//                         fk_aquario 
//                         from medida where fk_aquario = ${idAquario} 
//                     order by id desc limit 1`;

//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }

function buscarPresencas(hora_ini, hora_fim){
    

    instrucaoSql = `select count(*) as total, id_sensor as sensor from medida_presenca where is_present = 1 
	and cast(date_moviment as time) between '${hora_ini}' and '${hora_fim}' 
		group by id_sensor;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    // buscarUltimasMedidas,
    // buscarMedidasEmTempoReal,
    buscarPresencas
}