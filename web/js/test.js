

//accessing all the dom elements
const startWin = document.getElementById('startWindow');
const startbtn = document.querySelector('.startButton');

const navbarDesign = document.getElementById('navbar-design');
const bold = document.querySelector('.bold');
const italic = document.querySelector('.italics');
const underline = document.querySelector('.underline');
const submitbtn = document.getElementById('submit-btn');

const nav = document.getElementById('nav');
const timer = document.getElementById('timer');
const charCount = document.getElementById('char-count');
const lineCount = document.getElementById('line-count');
const paraCount = document.getElementById('para-count');
const wpm = document.getElementById('wpm');
const incorrect = document.getElementById('incorrect-words');
const accuracy = document.getElementById('accuracy');

const paraBox = document.getElementById('para-box');
const input = document.querySelector('.input-box');
const output = document.querySelector('.output-box');
const mytxt = document.getElementById('mytxt');


const closeWin = document.getElementById('closeWindow');
const newTestWindow = document.getElementById('newTestWindow');

let timeLeft = 60;

function test() {
    startWin.style.display = 'none';
    navbarDesign.style.display = 'block';
    nav.style.display = 'block';
    paraBox.style.display = 'block';
    timer.textContent = 'Time Left 60';
    charCount.textContent = 'No Of Characters 0';
    lineCount.textContent = 'No of lines 0';
    paraCount.textContent = 'No of paragraphs 0';
    wpm.textContent = 'Words Per Minute 0';
    incorrect.textContent = 'Mistyped Words 0';
    accuracy.textContent = 'Accuracy %';
}
//Test will start after clicking this button
startbtn.addEventListener('click', test);

function endTest() {
    closeWin.style.display = 'block';
    navbarDesign.style.display = 'none';
    nav.style.display = 'none';
    paraBox.style.display = 'none';
}
//Test will end after clicking this button
submitbtn.addEventListener('click', endTest);



function startTimer() {
    var getTime = setInterval(function () {
        timeLeft--;
        timer.textContent = 'Time Left ' + timeLeft + 's';

        if (timeLeft === 0) {
            clearInterval(getTime);
            document.body.appendChild(newTestWindow);
            newTestWindow.style.display = 'block';
            navbarDesign.style.display = 'none';
        }
    }, 1000);
    output.removeEventListener('keyup', startTimer);
}
//Timer will start after typing
output.addEventListener('keyup', startTimer);


const countChars = () => {
    let characters = output.innerText.split('');
    charCount.textContent = 'No of characters ' + characters.length;
};
output.addEventListener('keyup', countChars);


const countLines = () => {
    let lines = output.innerText.split('\n').filter(val => val !== '');
    lineCount.textContent = 'No of lines ' + lines.length;
};
output.addEventListener('keydown', countLines);


const countPara = () => {
    let para = output.innerText.match(/\n\n+/g);
    if (para !== null)
    {
        paraCount.textContent = 'No of paragraphs ' + ((para.length) + 1);
    } else {
        paraCount.textContent = 'No of paragraphs ' + 0;
    }

};
output.addEventListener('keydown', countPara);


//Disabling the back button
function disableBack()
{
    window.history.forward();
}
setTimeout("disableBack()", 0);
window.onunload = function () {
    null;
};


function exeCmd(command) {
    document.execCommand(command, false, null);
}

function fontEditor(command, arg) {
    document.execCommand(command, false, arg);
}


 