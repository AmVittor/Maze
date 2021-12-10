var database = require('../database/config');


function buscarPresencas(hora_ini, hora_fim) {
  instrucaoSql = `select sum(is_present) as total, id_sensor as sensor from medida_presenca where CAST(date_moviment as time) between '${hora_ini}' and '${hora_fim}'
    group by id_sensor;`;

  console.log('Executando a instrução SQL: \n' + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMaior() {
  // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarMaior()");

  instrucaoSql = `select sum(is_present) as total, nomeEstacao as Estação from medida_presenca 
	join estacao on id_estacao = idEstacao 
		group by id_estacao 
			order by sum(is_present) desc;`;

  console.log('Executando a instrução SQL: \n' + instrucaoSql);
  return database.executar(instrucaoSql);  
}

function buscarHorario() {
  // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarMaior()");

  instrucaoSql = `select nomeEstacao as Estação, date_moviment as horario, is_present as total from medida_presenca 
	join estacao on id_estacao = idEstacao 
			group by date_moviment  
				order by is_present desc;`;

  console.log('Executando a instrução SQL: \n' + instrucaoSql);
  return database.executar(instrucaoSql);  
}
module.exports = {
  buscarPresencas,
  buscarMaior,
  buscarHorario
};
