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

var jogadores;

function carregarJogadores(nomeTime){

    // fetch("/jogadores/listar").then(function (resposta) {
    //     if (resposta.ok) {
    //         if (resposta.status == 204) {
    //             console.log(JSON.stringify(resposta))
    //         }
    //         jogadores = JSON.stringify(resposta);
    //         resposta.json().then(function (resposta) {
    //             jogadores = resposta;
    //             tabelaJogadores();
    //             // console.log("Dados recebidos: ", JSON.stringify(resposta));
    //         });
    //     } else {
    //         throw ('Houve um erro na API!');
    //     }
    // }).catch(function (resposta) {
    //     console.error(resposta);
    // });

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

var linhaJogador = ``;

function tabelaJogadores(){
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