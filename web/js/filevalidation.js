var fileTypes = [
    '.doc',
    '.docx',
    'text/plain',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'];

function validFileType(file) {
    for (var i = 0; i < fileTypes.length; i++) {
        if (file.type === fileTypes[i]) {
            var ext = document.getElementById('ext');
            ext.value = file.type;
            return true;
        }
    }
    return false;
}
function returnFileSize(number) {
    if (number < 1024) {
        return number + 'bytes';
    } else if (number >= 1024 && number < 1048576) {
        return (number / 1024).toFixed(1) + 'KB';
    } else if (number >= 1048576) {
        return (number / 1048576).toFixed(1) + 'MB';
    }
}

function fileDisplay() {
    var inFile = document.getElementById('inputGroupFile01').files;
    for (var i = 0; i < inFile.length; i++) {
        var lbl = document.querySelector('.custom-file-label');
        var size = document.getElementById('size');
        var char = document.getElementById('chars');
        if (validFileType(inFile[i])) {
            lbl.textContent = 'File name ' + inFile[i].name;
            size.value = returnFileSize(inFile[i].size);

            var reader = new FileReader();
            reader.readAsText(inFile[i], "UTF-8");
            reader.onload = function (evt) {
                const textarea = document.querySelector(".input-box");
                textarea.innerHTML = evt.target.result;
                const chars = textarea.innerHTML.length;
                const words = Math.floor(chars / 5);
                char.value = chars;
            };

        } else {
            lbl.textContent = 'Not a valid file type. Update your selection.';
        }
    }
}

$('#input').datetimepicker({
    uiLibrary: 'bootstrap4',
    modal: true,
    footer: true
});
