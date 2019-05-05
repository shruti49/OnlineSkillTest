
//accessing all the dom elements
const navbarDesign = document.getElementById('navbar-design');
const nav = document.getElementById('nav');
const navbar = document.getElementById('navbar');
const paraBox = document.getElementById('para-box');
const bold = document.querySelector('.bold');
const italic = document.querySelector('.italics');
const underline = document.querySelector('.underline');
const submitbtn = document.getElementById('submit-btn');

const timer = document.getElementById('timer');
const charCount = document.getElementById('char-count');
const lineCount = document.getElementById('line-count');
const paraCount = document.getElementById('para-count');
const wordspermin = document.getElementById('wpm');
const incorrect = document.getElementById('error');
const accuracy = document.getElementById('accuracy');

const input = document.querySelector('.input-box');
const output = document.querySelector('.output-box');
const mytxt = document.getElementById('mytxt');

const closeWin = document.getElementById('closeWindow');
const newTestWindow = document.getElementById('newTestWindow');

let counter = document.getElementById('xyz').value;
let c = document.getElementById('hide').value;

let timeStart = null;
let timeEnd = null;

/**
 * Words Per Minute
 * @param {number} characters - Total Number of characters
 * @param {number} timestamp - Total time taken
 */
const calculateWPM = (characters, timestamp) => {
    const words = characters / 5;
    return Math.floor
            (words / (timestamp / 60));
};

const wpm = () => {
    timeEnd = new Date(Date.now()).getTime(); // for counting `words per mins`
    wordspermin.value = calculateWPM(
            output.innerText.split('').length,
            (timeEnd - timeStart) / 1000
            );
};

output.addEventListener('keydown', wpm);
/**
 * Calculates Accuracy
 * @param {*} inputText - `input.innerText`
 * @param {*} outputText - `output.innerText.trim()`
 */
const calculateAccuracy = (inputText, outputText) => {
    const sampleText = inputText.split(' ');
    const typedText = outputText.split(' ');
    let wrongWords = 0;

    for (let i = 0; i < sampleText.length; i++) {
        if (sampleText[i] !== typedText[i] && typedText[i] && sampleText[i]) {
            wrongWords += 1;
        }
    }
    incorrect.value = wrongWords;
    return (Math.floor(((typedText.length - wrongWords) / sampleText.length) * 100));

};

const acc = () => {
    accuracy.value = calculateAccuracy(
            input.innerText,
            output.innerText.trim()
            );
};

output.addEventListener('keydown', acc);


const countChars = () => {
    let chars = output.innerText.length;
    charCount.value = chars + 1;
};
output.addEventListener('keydown', countChars);

const countLines = () => {
    let lines = output.innerText.split('\n').filter(val => val !== '');
    lineCount.value = lines.length;
};
output.addEventListener('keydown', countLines);


const countPara = () => {
    let para = output.innerText.match(/\n\n+/g);
    if (para !== null) {
        paraCount.value = (para.length) + 1;
    } else {
        paraCount.value = 0;
    }
};
output.addEventListener('keydown', countPara);

function myfun() {
    input.innerHTML = c;
    let min = Math.floor(counter / 60);
    let sec = counter % 60;
    timer.value = `0${min}:0${sec}`;
}

function store() {
    window.location.href = "http://localhost:8084/OnlineSkillTest/Storeresult?value1=" + wordspermin.value + "&value2=" + accuracy.value + "&value3=" +incorrect.value;
}

function countdown() {
    timeStart = new Date(Date.now()).getTime(); // for counting `words per mins`
    function timeleft() {
        counter--;
        let min = Math.floor(counter / 60);
        let sec = counter % 60;
        if (min < 0 && sec < 0) {
            window.open('testsubmission.jsp');
            return;
        }
        if (sec < 10) {
            timer.value = `0${min}:0${sec}`;
        } else {
            timer.value = `0${min}:${sec}`;
        }
    }
    setInterval(timeleft, 1000);
    output.removeEventListener('keypress', countdown);
}
output.addEventListener('keypress', countdown);




//Disabling the back button
function disableBack() {
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

