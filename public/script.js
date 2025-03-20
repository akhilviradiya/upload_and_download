document.getElementById('downloadBtn').addEventListener('click', function () {
    const filePath = document.getElementById('filePath').value;
    if (!filePath) {
        document.getElementById('downloadMsg').innerHTML = "<span class='error'>Please enter a file path.</span>";
        return;
    }

    fetch(`/download?path=${encodeURIComponent(filePath)}`)
        .then(response => {
            if (!response.ok) throw new Error('File not found.');
            return response.blob();
        })
        .then(blob => {
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = filePath.split('/').pop();
            document.body.appendChild(a);
            a.click();
            a.remove();
            document.getElementById('downloadMsg').innerHTML = "<span class='success'>Download successful!</span>";
            setTimeout(() => location.reload(), 1000);
        })
        .catch(err => {
            document.getElementById('downloadMsg').innerHTML = "<span class='error'>Error: " + err.message + "</span>";
        });
});

document.getElementById('uploadBtn').addEventListener('click', function () {
    const fileInput = document.getElementById('fileInput');
    const uploadMsg = document.getElementById('uploadMsg');
    const uploadingText = document.getElementById('uploading');

    if (!fileInput.files.length) {
        uploadMsg.innerHTML = "<span class='error'>Please select a file.</span>";
        return;
    }

    uploadingText.style.display = "block";  // Show "Uploading..." text

    const formData = new FormData();
    formData.append('file', fileInput.files[0]);

    fetch('/upload', { method: 'POST', body: formData })
        .then(response => response.json())
        .then(data => {
            uploadingText.style.display = "none";  // Hide "Uploading..." text
            uploadMsg.innerHTML = `<span class='success'>${data.message}</span>`;
            setTimeout(() => location.reload(), 1000);
        })
        .catch(err => {
            uploadingText.style.display = "none";
            uploadMsg.innerHTML = "<span class='error'>Error uploading file.</span>";
        });
});

document.getElementById('cancelBtn').addEventListener('click', function () {
    document.getElementById('fileInput').value = "";
    document.getElementById('uploadMsg').innerHTML = "<span class='success'>Upload canceled.</span>";
    setTimeout(() => location.reload(), 1000);
});
