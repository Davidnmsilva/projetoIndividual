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
        SELECT j.nome, j.posicao, e.pontos, e.assistencias, e.rebotes, e.roubadas, e.tocos, e.turnovers, e.faltas FROM jogador j JOIN estatisticas e ON j.fkEstatistica = e.idEstatistica JOIN nbaTime n ON j.fkTime = n.idTime WHERE n.nome = '${nome}';
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