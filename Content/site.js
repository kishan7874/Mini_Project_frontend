document.addEventListener("DOMContentLoaded", function () {
    var buttons = document.querySelectorAll(".add-btn");
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener("click", function () {
            var original = this.value || this.innerText;
            var self = this;
            window.setTimeout(function () {
                if (self.value !== undefined) self.value = "ADDED";
                self.classList.add("added");
                window.setTimeout(function () {
                    if (self.value !== undefined) self.value = original;
                    self.classList.remove("added");
                }, 800);
            }, 30);
        });
    }
});