var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ")
    var instrucao = `
        SELECT * FROM jogador;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarPorTime(nome){
    var instrucao = `
        SELECT j.* FROM jogador AS j JOIN nbaTime AS nba ON j.fkTime = nba.idTime WHERE nba.nome = '${nome}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarEstatistica(nome){
    var instrucao = `
        SELECT nome, offRtg, defRtg, ptsG, oppPtsg, pace FROM nbaTime WHERE nome = '${nome}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarTodasStats(){
    var instrucao = `
    SELECT offRtg, defRtg, ptsG, oppPtsG, pace
    FROM nbaTime
    ORDER BY offRtg DESC, defRtg DESC, ptsG DESC, oppPtsG DESC, pace DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
    listarPorTime,
    listarEstatistica,
    listarTodasStats
};