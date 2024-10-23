<!-- Popup cho success -->
<div id="successPopup" class="popup-background">
    <div class="popup-box success">
        <i class="fas fa-check-circle"></i> <!-- Icon success -->
        <h2 class="success">Success!</h2>
        <p>${success}</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<!-- Popup cho error -->
<div id="errorPopup" class="popup-background">
    <div class="popup-box error">
        <i class="fas fa-exclamation-circle"></i> <!-- Icon lỗi -->
        <h2 class="error">Error!</h2>
        <p>${error}</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<div id="messagePopup" class="popup-background">
    <div class="popup-box message">
        <i class="fas fa-exclamation-circle"></i> <!-- Icon lỗi -->
        <h2 class="message">Message</h2>
        <p>${message}</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<script>
    function showSuccessPopup() {
        const successPopup = document.getElementById('successPopup');
        successPopup.classList.add('show');
        const popupBox = successPopup.querySelector('.popup-box');
        setTimeout(() => {
            popupBox.classList.add('show');
        }, 10);
    }

    function showErrorPopup() {
        const errorPopup = document.getElementById('errorPopup');
        errorPopup.classList.add('show');
        const popupBox = errorPopup.querySelector('.popup-box');
        setTimeout(() => {
            popupBox.classList.add('show');
        }, 10);
    }

    function showMessagePopup(message) {
        const messagePopup = document.getElementById('messagePopup');
        const messageText = document.getElementById('messageText');
        if (messageText) {
            messageText.innerText = message || 'This is a default message!'; // Cập nhật nội dung message
        }
        messagePopup.classList.add('show');
        const popupBox = messagePopup.querySelector('.popup-box');
        setTimeout(() => {
            popupBox.classList.add('show');
        }, 10);
    }

    function closePopup() {
        const popups = document.querySelectorAll('.popup-background.show');
        popups.forEach(popup => {
            const popupBox = popup.querySelector('.popup-box');
            popupBox.classList.remove('show');
            setTimeout(() => {
                popup.classList.remove('show');
            }, 300);
        });
    }

</script>

<c:if test="${not empty success}">
    <script>
        showSuccessPopup();
    </script>
</c:if>

<c:if test="${not empty error}">
    <script>
        showErrorPopup();
    </script>
</c:if>
<c:if test="${not empty message}">
    <script>
        showMessagePopup();
    </script>
</c:if>