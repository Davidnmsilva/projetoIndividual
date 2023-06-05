const questions = [
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Jeremy Lin game winner, contra o Knicks", correct: false },
            { text: "Jeremy Lin game winner, contra o Raptors", correct: true },
            { text: "Carmelo Anthony game winner, contra o Knicks", correct: false },
            { text: "Carmelo Anthony game winner, contra o Raptors", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Ray Allen game winner, contra o Heat", correct: false },
            { text: "Paul Pierce game winner, contra o Celtics", correct: false },
            { text: "Ray Allen game winner, contra o Bulls", correct: true },
            { text: "Paul Pierce game winner, contra o Heat", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Lebron James bloqueando Iguodala, contra o Warriors.", correct: true },
            { text: "Lebron James bloqueando Iguodala, contra o Cavs.", correct: false },
            { text: "Iguodala bloqueando Lebron James, contra o Cavs.", correct: false },
            { text: "Lebron James bloqueando Curry, contra o Warriors.", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Derrick Rose enterrada em cima de Nash, contra o Suns", correct: false },
            { text: "Goran Dragic enterrada em cima de Nash, contra o Bulls", correct: false },
            { text: "Steve Nash enterrada em cima de Rose", correct: false },
            { text: "Derrick Rose enterrada em cima de Dragic, contra o Suns", correct: true }
        ]
    },
    {
        question: 'Qual é este momento?<b',
        answers: [
            { text: "DeAndre Jordan enterrada contra o Clippers", correct: false },
            { text: "DeAndre Jordan enterrada contra o Mavericks", correct: false },
            { text: "DeAndre Jordan enterrada contra o Celtics", correct: false },
            { text: "DeAndre Jordan enterrada contra o Pistons", correct: true }
        ]
    },
    {
        question: 'Qual é este momento?<b',
        answers: [
            { text: "Carmelo Anthony empata o jogo contra o Bulls", correct: true },
            { text: "Carmelo Anthony vence o jogo contra o Bulls", correct: false },
            { text: "Carmelo Anthony vence o jogo contra o Pacers", correct: false },
            { text: "Carmelo Anthony empata o jogo contra o Pacers", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Curry game winner contra o Cavs", correct: false },
            { text: "Curry game winner contra o Wizards", correct: false },
            { text: "Curry game winner contra o Thunder", correct: true },
            { text: "Curry game winner contra o Blazers", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Ray Allen salva o Boston Celtics empatando o jogo", correct: false },
            { text: "Ray Allen salva o Miami Heat empatando o jogo.", correct: true },
            { text: "Ray Allen salva o Miami Heat ganhando o jogo", correct: false },
            { text: "Ray Allen salva o Boston Celtics ganhando o jogo", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Blake Griffin enterrada contra o Thunder", correct: true },
            { text: "Blake Griffin enterrada contra o Mavericks", correct: false },
            { text: "Blake Griffin enterrada contra o Celtics", correct: false },
            { text: "Blake Griffin enterrada contra o Clippers", correct: false }
        ]
    },
    {
        question: 'Qual é este momento?',
        answers: [
            { text: "Kawhi Leonard empata o jogo para o Raptors", correct: false },
            { text: "Kawhi Leonard vence o jogo para o Spurs", correct: false },
            { text: "Kawhi Leonard empata o jogo para o Spurs", correct: false },
            { text: "Kawhi Leonard vence o jogo para o Raptors", correct: true }
        ]
    }
];

const questionElement = document.getElementById('question');
const answerButtons = document.getElementById("answer-buttons");
const nextButton = document.getElementById("next-btn");
const videoContainer = document.getElementById("video-container");
const videoSource = document.getElementById("video-source");
const videoId = document.getElementById("video");

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
        if(sessionStorage.telaLeste == 'Leste'){
            
        }
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
        videoId.pause();
        videoContainer.style.display = "none";
        showQuestion();
    } else {
        videoId.pause();
        videoContainer.style.display = "none";
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