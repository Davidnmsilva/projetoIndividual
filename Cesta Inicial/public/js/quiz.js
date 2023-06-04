const questions = [
    {
        question: 'Qual é este momento?<br><audio controls><source src="./Assets/Audios/Audio Jeremy Lin.wav" type="audio/wav"></audio>',
        answers: [
            { text: "Jeremy Lin game winner, contra o Knicks", correct: false },
            { text: "Jeremy Lin game winner, contra o Raptors", correct: true },
            { text: "Carmelo Anthony game winner, contra o Knicks", correct: false },
            { text: "Carmelo Anthony game winner, contra o Raptors", correct: false }
        ],
        video: './Assets/Videos/Jeremy Lin - Contra o Raptors.mp4'
    },
    {
        question: 'Qual é este momento?<br><audio controls><source src="./Assets/Audios/Audio Ray Allen.wav" type="audio/wav"></audio>',
        answers: [
            { text: "Ray Allen game winner, contra o Heat", correct: false },
            { text: "Paul Pierce game winner, contra o Celtics", correct: false },
            { text: "Ray Allen game winner, contra o Bulls", correct: true },
            { text: "Paul Pierce game winner, contra o Heat", correct: false }
        ],
        video: './Assets/Videos/Ray Allen - Contra o Bulls.mp4'
    },
    {
        question: 'Qual é este momento?<br><audio controls><source src="./Assets/Audios/Audio Block By James.wav" type="audio/wav"></audio>',
        answers: [
            { text: "Quem sou eu", correct: true },
            { text: "Caneta Azul", correct: false },
            { text: "Azul Caneta", correct: false },
            { text: "Esta marcad", correct: false }
        ],
        video: './Assets/Videos/Block By James.mp4'
    },
    {
        question: 'Qual é este momento?<br><audio controls><source src="./Assets/Audios/Audio Drose.wav" type="audio/wav"></audio>',
        answers: [
            { text: "Quem sou eu", correct: false },
            { text: "Caneta Azul", correct: true },
            { text: "Azul Caneta", correct: false },
            { text: "Esta marcad", correct: false }
        ],
        video: './Assets/Videos/DRose.mp4'
    },
    {
        question: 'Qual é este momento?<br><audio controls><source src="./Assets/Audios/Audio Jeremy Lin.wav" type="audio/wav"></audio>',
        answers: [
            { text: "Quem sou eu", correct: false },
            { text: "Caneta Azul", correct: false },
            { text: "Azul Caneta", correct: true },
            { text: "Esta marcad", correct: false }
        ],
        video: './Assets/Videos/Jeremy Lin - Contra o Raptors.mp4'
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
        if(sessionStorage.telaNarracao == 'Narrações'){
            videoContainer.style.display = 'block';
            var videoAtual = questions[currentQuestionIndex].video;
            videoId.setAttribute("src", videoAtual);
            videoId.volume = 0.25;
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
    questionElement.innerHTML = `Você pontuou ${score} de ${questions.length}!`;
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
        confirmButtonText: 'Você está sendo redirecionado!',
        cancelButtonText: 'Não'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            setInterval(()=>{
                'Voltando!',
                'success'
                window.location = "./../jogos.html";
            }, 2000)
          )
        }
      })
}

startQuiz();