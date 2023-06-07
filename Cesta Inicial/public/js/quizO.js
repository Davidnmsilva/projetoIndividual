const questions = [
    {
        question: 'Qual foi o time que mais conquistou titulos nos ultimos 10 anos?',
        answers: [
            { text: "Golden State Warriors", correct: true },
            { text: "Los Angeles Lakers", correct: false },
            { text: "Cleveland Cavaliers", correct: false },
            { text: "Miami Heat", correct: false }
        ]
    },
    {
        question: 'Qual o time que tinha o trio conhecido como "Run TMC"',
        answers: [
            { text: "Minnesotta Timberwolves", correct: false },
            { text: "Oklahoma City Thunder", correct: false },
            { text: "Portland Trail Blazers", correct: false },
            { text: "Sacramento Kings", correct: true }
        ]
    },
    {
        question: 'O jogador Alex English, jogou em qual time?',
        answers: [
            { text: "Houston Rockets", correct: false },
            { text: "Denver Nuggets", correct: true },
            { text: "Memphis Grizzlies", correct: false },
            { text: "Phoenix Suns", correct: false }
        ]
    },
    {
        question: 'Qual o último ano que o Phoenix Suns foi para as finais?',
        answers: [
            { text: "2020", correct: false },
            { text: "2018", correct: false },
            { text: "2021", correct: true },
            { text: "2015", correct: false }
        ]
    },
    {
        question: 'Quem é o jovem promissor que lidera o Memphis Grizzlies?',
        answers: [
            { text: "Ja Morant", correct: true },
            { text: "Luka Doncic", correct: false },
            { text: "Jayson Tatum", correct: false },
            { text: "Zion Williamson", correct: false }
        ]
    },
    {
        question: 'Qual o time que venceu seu único titulo em 1977?',
        answers: [
            { text: "New Orleans Pelicans", correct: false },
            { text: "Utah Jazz", correct: false },
            { text: "Portland Trail Blazers", correct: true },
            { text: "San Antonio Spurs", correct: false }
        ]
    },
    {
        question: 'Qual o time que uniu os fãs após o desastre do furacão Katrina?',
        answers: [
            { text: "New Orleans Pelicans", correct: true },
            { text: "Washington Wizards", correct: false },
            { text: "Oklahoma City Thunder", correct: false },
            { text: "Portland Trail Blazers", correct: false }
        ]
    },
    {
        question: 'Hakeem Olajuwon ganhou seu titulo por qual time?',
        answers: [
            { text: "Dallas Mavericks", correct: false },
            { text: "Houston Rockets", correct: true },
            { text: "San Antonio Spurs", correct: false },
            { text: "Oklahoma City Thunder", correct: false }
        ]
    },
    {
        question: 'Qual a estrela do Dallas Mavericks atualmente?',
        answers: [
            { text: "Shai Gilgeous-Alexander", correct: false },
            { text: "Ja Morant", correct: false },
            { text: "Luka Dončić", correct: true },
            { text: "Lauri Markannen", correct: false }
        ]
    },
    {
        question: 'Quem é o time de Los Angeles que não tem titulos',
        answers: [
            { text: "Los Angeles Blazers", correct: false },
            { text: "Los Angeles Lakers", correct: false },
            { text: "Los Angeles Mavericks", correct: false },
            { text: "Los Angeles Clippers", correct: true }
        ]
    }
];

const questionElement = document.getElementById('question');
const answerButtons = document.getElementById("answer-buttons");
const nextButton = document.getElementById("next-btn");

let currentQuestionIndex = 0;
let score = 0;


function startQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    nextButton.innerHTML = "Next";
    showQuestion();
}

function showQuestion() {
    resetState();
    let currentQuestion = questions[currentQuestionIndex];
    let questionNo = currentQuestionIndex + 1;
    questionElement.innerHTML = questionNo + ". " + currentQuestion.question;

    currentQuestion.answers.forEach(answer => {
        const button = document.createElement("button");
        button.innerHTML = answer.text;
        button.classList.add("btn");
        answerButtons.appendChild(button);
        if (answer.correct) {
            button.dataset.correct = answer.correct;
        }
        button.addEventListener("click", selectAnswer);
    });
}

function resetState() {
    nextButton.style.display = "none";
    while (answerButtons.firstChild) {
        answerButtons.removeChild(answerButtons.firstChild);
    }
}



function selectAnswer(e) {
    const selectedBtn = e.target;
    const isCorrect = selectedBtn.dataset.correct === "true";
    if (isCorrect) {
        selectedBtn.classList.add("correct");
        score++;
    } else {
        selectedBtn.classList.add("incorrect");
    }
    Array.from(answerButtons.children).forEach(button => {
        if (button.dataset.correct === "true") {
            button.classList.add("correct");
        }
        button.disabled = true;
    });
    nextButton.style.display = "block";
}

function showScore() {
    resetState();
    questionElement.innerHTML = `Você pontuou ${score} de ${questions.length}!<br><br>`;
    if(score < 5){
        questionElement.innerHTML += `Parece que você ainda é um novato no mundo da NBA.`;
    } else if(score <= 9){
        questionElement.innerHTML += `Parece que você tem conhecimento do mundo da NBA, mas ainda pode descobrir mais.`;
    } else{
        questionElement.innerHTML += `Parece que você é um expert no mundo da NBA. Parabéns!! <br><br>
        <img height="100px" src="https://static.vecteezy.com/system/resources/previews/019/023/677/original/gold-trophy-symbol-icon-png.png">`;
    }
    nextButton.innerHTML = "Jogar Novamente";
    nextButton.style.display = "block";
}

function handleNextButton() {
    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
        showQuestion();
    } else {
        showScore();
    }
}

nextButton.addEventListener("click", () => {
    if (currentQuestionIndex < questions.length) {
        handleNextButton();
    } else {
        startQuiz();
    }
})

function voltarTela(){
    Swal.fire({
        title: 'Tem certeza?',
        text: "Você vai sair do quiz!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sim',
        cancelButtonText: 'Não'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Você está sendo redirecionado!',
            setInterval(()=>{
                window.location = "./../jogos.html";
            }, 2000)
          )
        }
      })
}

startQuiz();