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