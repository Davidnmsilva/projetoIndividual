var listaJogadores = document.querySelector(".listaJogadores");

var jogadores = {
    jayson_tatum:{
        nome: "Jayson Tatum",
        posicao: "SF",
        pontos: 30.1,
        assistencias: 4.6,
        rebotes: 8.8,
        roubos: 1.1,
        tocos: 0.7,
        turnovers: 2.9,
        faltas: 2.2
    },
    jaylen_brown:{
        nome: "Jaylen Brown",
        posicao: "SG",
        pontos: 26.6,
        assistencias: 3.5,
        rebotes: 6.9,
        roubos: 1.1,
        tocos: 0.4,
        turnovers: 2.9,
        faltas: 2.6
    },
    marcus_smart:{
        nome: "Marcus Smart",
        posicao: "PG",
        pontos: 11.5,
        assistencias: 6.3,
        rebotes: 3.1,
        roubos: 1.5,
        tocos: 0.4,
        turnovers: 2.3,
        faltas: 2.8
    },
    robert_williams:{
        nome: "Robert Williams",
        posicao: "C",
        pontos: 8,
        assistencias: 1.4,
        rebotes: 8.3,
        roubos: 0.6,
        tocos: 1.4,
        turnovers: 1,
        faltas: 1.9
    },
    al_horford:{
        nome: "Al Horford",
        posicao: "PF",
        pontos: 9.8,
        assistencias: 3,
        rebotes: 6.2,
        roubos: 0.5,
        tocos: 1,
        turnovers: 0.6,
        faltas: 1.9
    }
}

listaJogadores.innerHTML = `
    <table class="tabelaCeltics">
        <tr><td>Posição</td><td>Jogador</td><td>PTS</td><td>AST</td><td>REB</td><td>STL</td><td>BLK</td><td>TOs</td><td>PFs</td></tr>
        
        <tr>
        <td>${jogadores.marcus_smart.posicao}</td><td class="j1Text">${jogadores.marcus_smart.nome}</td><td>${jogadores.marcus_smart.pontos}</td><td>${jogadores.marcus_smart.assistencias}</td><td>${jogadores.marcus_smart.rebotes}</td><td>${jogadores.marcus_smart.roubos}</td><td>${jogadores.marcus_smart.tocos}</td><td>${jogadores.marcus_smart.turnovers}</td><td>${jogadores.marcus_smart.faltas}</td>
        </tr>
        
        <tr>
        <td>${jogadores.jaylen_brown.posicao}</td><td class="j2Text">${jogadores.jaylen_brown.nome}</td><td>${jogadores.jaylen_brown.pontos}</td><td>${jogadores.jaylen_brown.assistencias}</td><td>${jogadores.jaylen_brown.rebotes}</td><td>${jogadores.jaylen_brown.roubos}</td><td>${jogadores.jaylen_brown.tocos}</td><td>${jogadores.jaylen_brown.turnovers}</td><td>${jogadores.jaylen_brown.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.jayson_tatum.posicao}</td><td class="j3Text">${jogadores.jayson_tatum.nome}</td><td>${jogadores.jayson_tatum.pontos}</td><td>${jogadores.jayson_tatum.assistencias}</td><td>${jogadores.jayson_tatum.rebotes}</td><td>${jogadores.jayson_tatum.roubos}</td><td>${jogadores.jayson_tatum.tocos}</td><td>${jogadores.jayson_tatum.turnovers}</td><td>${jogadores.jayson_tatum.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.al_horford.posicao}</td><td class="j4Text">${jogadores.al_horford.nome}</td><td>${jogadores.al_horford.pontos}</td><td>${jogadores.al_horford.assistencias}</td><td>${jogadores.al_horford.rebotes}</td><td>${jogadores.al_horford.roubos}</td><td>${jogadores.al_horford.tocos}</td><td>${jogadores.al_horford.turnovers}</td><td>${jogadores.al_horford.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.robert_williams.posicao}</td><td class="j5Text">${jogadores.robert_williams.nome}</td><td>${jogadores.robert_williams.pontos}</td><td>${jogadores.robert_williams.assistencias}</td><td>${jogadores.robert_williams.rebotes}</td><td>${jogadores.robert_williams.roubos}</td><td>${jogadores.robert_williams.tocos}</td><td>${jogadores.robert_williams.turnovers}</td><td>${jogadores.robert_williams.faltas}</td>
        </tr>
    </table>
`;


var jogador1 = document.getElementsByClassName("j1Text");

