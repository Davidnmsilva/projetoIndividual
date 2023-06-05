const questions = [
    {
        question: 'Qual o único time que conquistou 11 campeonatos em 13 anos?',
        answers: [
            { text: "Golden State Warriors", correct: false },
            { text: "Los Angeles Lakers", correct: false },
            { text: "Boston Celtics", correct: true },
            { text: "Chicago Bulls", correct: false }
        ]
    },
    {
        question: 'Quais os times que Kareem Abdul Jabbar jogou?',
        answers: [
            { text: "Los Angeles Lakers e Milwaukee Bucks", correct: true },
            { text: "Los Angeles Lakers e Miami Heat", correct: false },
            { text: "Milwaukee Bucks e Boston Celtics", correct: false },
            { text: "Boston Celtics e Miami Heat", correct: false }
        ]
    },
    {
        question: 'Qual o time conhecido como THE PROCESS?',
        answers: [
            { text: "Washington Wizards", correct: false },
            { text: "Atlanta Hawks", correct: false },
            { text: "Indiana Pacers", correct: false },
            { text: "Philadelphia 76ers", correct: true }
        ]
    },
    {
        question: 'Qual o time que a cultura é tão forte que é conhecido como THE CULTURE?',
        answers: [
            { text: "New York Knicks", correct: false },
            { text: "Toronto Raptors", correct: false },
            { text: "Miami Heat", correct: true },
            { text: "Brooklyn Nets", correct: false }
        ]
    },
    {
        question: 'Qual o time mais valioso da liga, em doláres?<b',
        answers: [
            { text: "Golden State Warriors", correct: false },
            { text: "New York Knicks", correct: true },
            { text: "Los Angeles Lakers", correct: false },
            { text: "Brooklyn Nets", correct: false }
        ]
    },
    {
        question: 'Qual o único time que conseguiu o famoso 3-Peat (Vencer o titulo da NBA por 3 temporadas consecutivas) duas vezes?<b',
        answers: [
            { text: "Chicago Bulls", correct: true },
            { text: "Milwaukee Bucks", correct: false },
            { text: "Boston Celtics", correct: false },
            { text: "Los Angeles Lakes", correct: false }
        ]
    },
    {
        question: 'Qual o único time que virou um 3 - 1 nas finais?',
        answers: [
            { text: "Chicago Bulls", correct: false },
            { text: "Washington Wizards", correct: false },
            { text: "Cleveland Cavaliers", correct: true },
            { text: "Orlando Magic", correct: false }
        ]
    },
    {
        question: 'Qual o time que Dwight Howards jogou no seu auge?',
        answers: [
            { text: "Orlando Magic", correct: true },
            { text: "Atlanta Hawks", correct: false },
            { text: "Houston Rockets", correct: false },
            { text: "Los Angeles Lakers", correct: false }
        ]
    },
    {
        question: 'Qual o time que joga na Arena Capital One?',
        answers: [
            { text: "Detroit Pistons", correct: false },
            { text: "Charlotte Hornets", correct: false },
            { text: "Golden State Warriors", correct: false },
            { text: "Washington Wizards", correct: true }
        ]
    },
    {
        question: 'Qual o time que já foi conhecido como os Bad Boys?',
        answers: [
            { text: "Boston Celtics", correct: false },
            { text: "Detroit Pistons", correct: true },
            { text: "Indiana Pacers", correct: false },
            { text: "Cleveland Cavalies", correct: false }
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