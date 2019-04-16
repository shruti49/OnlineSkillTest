

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
    input.innerHTML = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.<br><br>Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.<br><br> But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth.<br><br>Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.<br><br>Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.<br><br>But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground.";
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


 