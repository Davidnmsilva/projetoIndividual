var listaJogadores = document.querySelector(".listaJogadores");

var jogadores;

function carregarJogadores(){

    fetch("/jogadores/listar").then(function (resposta) {
        if (resposta.ok) {
            if (resposta.status == 204) {
                console.log(JSON.stringify(resposta))
            }
            jogadores = JSON.stringify(resposta);
            resposta.json().then(function (resposta) {
                jogadores = resposta;
                tabelaJogadores();
                // console.log("Dados recebidos: ", JSON.stringify(resposta));
            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });

    
}

var nJogador = 61;
var linhaJogador = '';

function tabelaJogadores(){
    for(i = 0; i < 5; i++ ){
        var posicao = jogadores[nJogador].posicao;
        var nome = jogadores[nJogador].nome;
        var pontos = Number(jogadores[nJogador].pontos).toFixed(1);
        var assistencias = Number(jogadores[nJogador].assistencias).toFixed(1);
        var rebotes = Number(jogadores[nJogador].rebotes).toFixed(1);
        var roubadas = Number(jogadores[nJogador].roubadas).toFixed(1);
        var tocos = Number(jogadores[nJogador].tocos).toFixed(1);
        var turnovers = Number(jogadores[nJogador].turnovers).toFixed(1);
        var faltas = Number(jogadores[nJogador].faltas).toFixed(1);

        linhaJogador += `
        <tr>
        <td>${posicao}</td>
        <td>${nome}</td>
        <td>${pontos}</td>
        <td>${assistencias}</td>
        <td>${rebotes}</td>
        <td>${roubadas}</td>
        <td>${tocos}</td>
        <td>${turnovers}</td>
        <td>${faltas}</td>
        </tr>`;
        nJogador++;
    }
    
    listaJogadores.innerHTML = `
        <table class="tabelaKnicks">
            <tr><td>Posição</td><td>Jogador</td><td>PTS</td><td>AST</td><td>REB</td><td>STL</td><td>BLK</td><td>TOs</td><td>PFs</td></tr>
            ${linhaJogador}
            </table>`
            ;
}
