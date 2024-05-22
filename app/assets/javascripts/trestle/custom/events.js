document.addEventListener("DOMContentLoaded", function () {
  var eyeIcons = document.querySelectorAll(".eye-icon");

  eyeIcons.forEach(function (icon) {
    icon.addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();

      var passwordField = this.previousElementSibling;
      if (passwordField.dataset.visible === "true") {
        passwordField.innerHTML = "********";
        passwordField.dataset.visible = "false";
        this.classList.remove("fa-eye-slash");
        this.classList.add("fa-eye");
      } else {
        passwordField.innerHTML = passwordField.dataset.password;
        passwordField.dataset.visible = "true";
        this.classList.remove("fa-eye");
        this.classList.add("fa-eye-slash");
      }
    });
  });
});
