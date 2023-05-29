// sessão
function validarSessao() {
    // aguardar();

    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    if (email != null && nome != null) {
        // window.alert(`Seja bem-vindo, ${nome}!`);

        // finalizarAguardar();
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    // aguardar();
    sessionStorage.clear();
    // finalizarAguardar();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.styleMural.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.styleMural.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.styleMural.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}


// modal
function mostrarModal() {
    var divModal = document.getElementById("div_modal");
    divModal.styleMural.display = "flex";
}

function fecharModal() {
    var divModal = document.getElementById("div_modal");
    divModal.styleMural.display = "none";
}

function irCadastro(){
    setTimeout(() => {
        window.location = "./cadastro.html";
    }, 2000)
}

function irLogin(){
    setTimeout(() => {
        window.location = "./login.html";
    }, 2000)
}

function trocarImg(){
    var imagem = document.createElement("img");
    var layout = document.getElementsByClassName("time-layout");

    layout.innerHTML = imagem.setAttribute('src', './../Times/Assets/Hawks/Imagens e Videos/Hawks.jpg');
}

// Função para carregar os jogadores para colocar na tabela.
var jogadores;
function carregarJogadores(nomeTime){
    fetch(`/jogadores/listarPorTime/${nomeTime}`).then(function (resposta) {
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

var estatisticasOrdenadas;
function carregarStatsOrdenadas(){
    fetch(`/jogadores/listarTodasStats`).then(function (resposta) {
        if (resposta.ok) {
            if (resposta.status == 204) {
                console.log(JSON.stringify(resposta))
            }
            resposta.json().then(function (resposta) {
                estatisticasOrdenadas = resposta;
                criarBoxStats();
                // console.log("Dados recebidos: ", JSON.stringify(resposta));
            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
    
}

var estatisticas;
function carregarEstatistica(nomeTime, corPrincipal, corSecundaria, corTercearia){
    fetch(`/jogadores/listarEstatistica/${nomeTime}`).then(function (resposta) {
        if (resposta.ok) {
            if (resposta.status == 204) {
                console.log(JSON.stringify(resposta))
            }
            resposta.json().then(function (resposta) {
                estatisticas = resposta;
                // console.log("Dados recebidos: ", JSON.stringify(resposta));
                criarGrafico(corPrincipal, corSecundaria, corTercearia);
            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
    
}

// Função de criação da tabela de estatisticas dos jogadores.
var linhaJogador = ``;
function tabelaJogadores(){
    var listaJogadores = document.querySelector(".listaJogadores");

    for(i = 0; i < jogadores.length; i++ ){
        var posicao = jogadores[i].posicao;
        var nome = jogadores[i].nome;
        var pontos = Number(jogadores[i].pontos).toFixed(1);
        var assistencias = Number(jogadores[i].assistencias).toFixed(1);
        var rebotes = Number(jogadores[i].rebotes).toFixed(1);
        var roubadas = Number(jogadores[i].roubadas).toFixed(1);
        var tocos = Number(jogadores[i].tocos).toFixed(1);
        var turnovers = Number(jogadores[i].turnovers).toFixed(1);
        var faltas = Number(jogadores[i].faltas).toFixed(1);

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
    }
    
    listaJogadores.innerHTML = `
        <table class="tabelaCeltics">
            <tr><td>Posição</td><td>Jogador</td><td>PTS</td><td>AST</td><td>REB</td><td>STL</td><td>BLK</td><td>TOs</td><td>PFs</td></tr>
            ${linhaJogador}
            </table>`
            ;
}


// Função de Criar Gráfico de estatisticas dos times.
function criarGrafico(corP, corS, corT){

    var nomeTime = estatisticas[0].nome;
    var offRtg = estatisticas[0].offRtg;
    var defRtg = estatisticas[0].defRtg;
    var ptsG = estatisticas[0].ptsG;
    var oppPtsg = estatisticas[0].oppPtsg;
    var pace = estatisticas[0].pace;

    var cor_fundo = corT;
    var cor_fundoT = corP;
    var cor_borda = corS;


    const ctx = document.getElementById('myChart');
    const data = {
    labels: [
        'Off RTG',
        'Def RTG',
        'PTS/G',
        'Opp PTS/G',
        'Pace'
    ],
    datasets: [{
        label: nomeTime,
        data: [offRtg, defRtg, ptsG, oppPtsg, pace],
        fill: true,
        backgroundColor: `#${cor_fundoT}`,
        borderColor: `#${cor_borda}`,
        pointBackgroundColor: `#${cor_borda}`,
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: `#${cor_fundo}`,
        pointHoverBorderColor: `#${cor_borda}`,
    }]
    };

    const config = {
    type: 'radar',
    data: data,
    options: {
        elements: {
        line: {
            borderWidth: 2
        }
        },
        scales:{
            r:{
                min:80,
                max:120,
                pointLabels:{
                    font:{
                        size: 14,
                    }
                },
                angleLines:{
                    color: `#${cor_fundo}`
                },
                grid:{
                    color: `#${cor_fundo}`
                },
                ticks:{
                    color: "#111",
                    backgroundColor: '#333',
                }
            },
            
        }
    },
    };

    new Chart(ctx, config);
}

function criarBoxStats(){
    var graficoStats = document.querySelector('.graficoStats');

    // for(var i = 0; i < estatisticasOrdenadas.length; i++){
        var offRtg = estatisticasOrdenadas[0].offRtg;
        var defRtg = estatisticasOrdenadas[0].defRtg;
        var ptsG = estatisticasOrdenadas[0].ptsG;
        var oppPtsg = estatisticasOrdenadas[0].oppPtsg;
        var pace = estatisticasOrdenadas[0].pace;

    // }
    graficoStats.innerHTML = `
    <div class="grafico-box">
        <h1>Offensive Rating</h1>
        <p>${offRtg}</p>
    </div>
    <div class="grafico-box"></div>
    <div class="grafico-box"></div>
    <div class="grafico-box"></div>
    <div class="grafico-box"></div>
    `;
    
}