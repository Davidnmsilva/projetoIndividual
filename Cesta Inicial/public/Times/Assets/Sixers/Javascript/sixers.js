var listaJogadores = document.querySelector(".listaJogadores");

var jogadores = {
    lebron_james:{
        nome: "Lebron James",
        posicao: "PF",
        pontos: 30.1,
        assistencias: 4.6,
        rebotes: 8.8,
        roubos: 1.1,
        tocos: 0.7,
        turnovers: 2.9,
        faltas: 2.2
    },
    anthony_davis:{
        nome: "Anthony Davis",
        posicao: "C",
        pontos: 26.6,
        assistencias: 3.5,
        rebotes: 6.9,
        roubos: 1.1,
        tocos: 0.4,
        turnovers: 2.9,
        faltas: 2.6
    },
    dennis_schroder:{
        nome: "Dennis Schroder",
        posicao: "PG",
        pontos: 11.5,
        assistencias: 6.3,
        rebotes: 3.1,
        roubos: 1.5,
        tocos: 0.4,
        turnovers: 2.3,
        faltas: 2.8
    },
    jared_vanderbilt:{
        nome: "Jared Vanderbilt",
        posicao: "SF",
        pontos: 8,
        assistencias: 1.4,
        rebotes: 8.3,
        roubos: 0.6,
        tocos: 1.4,
        turnovers: 1,
        faltas: 1.9
    },
    austin_reaves:{
        nome: "Austin Reaves",
        posicao: "SG",
        pontos: 9.8,
        assistencias: 3,
        rebotes: 6.2,
        roubos: 0.5,
        tocos: 1,
        turnovers: 0.6,
        faltas: 1.9
    }
}
''

listaJogadores.innerHTML = `
    <table class="tabelaSixers">
        <tr><td>Posição</td><td>Jogador</td><td>PTS</td><td>AST</td><td>REB</td><td>STL</td><td>BLK</td><td>TOs</td><td>PFs</td></tr>
        
        <tr>
        <td>${jogadores.dennis_schroder.posicao}</td><td class="j1Text">${jogadores.dennis_schroder.nome}</td><td>${jogadores.dennis_schroder.pontos}</td><td>${jogadores.dennis_schroder.assistencias}</td><td>${jogadores.dennis_schroder.rebotes}</td><td>${jogadores.dennis_schroder.roubos}</td><td>${jogadores.dennis_schroder.tocos}</td><td>${jogadores.dennis_schroder.turnovers}</td><td>${jogadores.dennis_schroder.faltas}</td>
        </tr>
        
        <tr>
        <td>${jogadores.austin_reaves.posicao}</td><td class="j2Text">${jogadores.austin_reaves.nome}</td><td>${jogadores.austin_reaves.pontos}</td><td>${jogadores.austin_reaves.assistencias}</td><td>${jogadores.austin_reaves.rebotes}</td><td>${jogadores.austin_reaves.roubos}</td><td>${jogadores.austin_reaves.tocos}</td><td>${jogadores.austin_reaves.turnovers}</td><td>${jogadores.austin_reaves.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.jared_vanderbilt.posicao}</td><td class="j3Text">${jogadores.jared_vanderbilt.nome}</td><td>${jogadores.jared_vanderbilt.pontos}</td><td>${jogadores.jared_vanderbilt.assistencias}</td><td>${jogadores.jared_vanderbilt.rebotes}</td><td>${jogadores.jared_vanderbilt.roubos}</td><td>${jogadores.jared_vanderbilt.tocos}</td><td>${jogadores.jared_vanderbilt.turnovers}</td><td>${jogadores.jared_vanderbilt.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.lebron_james.posicao}</td><td class="j4Text">${jogadores.lebron_james.nome}</td><td>${jogadores.lebron_james.pontos}</td><td>${jogadores.lebron_james.assistencias}</td><td>${jogadores.lebron_james.rebotes}</td><td>${jogadores.lebron_james.roubos}</td><td>${jogadores.lebron_james.tocos}</td><td>${jogadores.lebron_james.turnovers}</td><td>${jogadores.lebron_james.faltas}</td>
        </tr>

        <tr>
        <td>${jogadores.anthony_davis.posicao}</td><td class="j5Text">${jogadores.anthony_davis.nome}</td><td>${jogadores.anthony_davis.pontos}</td><td>${jogadores.anthony_davis.assistencias}</td><td>${jogadores.anthony_davis.rebotes}</td><td>${jogadores.anthony_davis.roubos}</td><td>${jogadores.anthony_davis.tocos}</td><td>${jogadores.anthony_davis.turnovers}</td><td>${jogadores.anthony_davis.faltas}</td>
        </tr>
    </table>
`;


var jogador1 = document.getElementsByClassName("j1Text");

