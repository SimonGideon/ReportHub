document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("toggle-password-fields")
    .addEventListener("click", function () {
      var passwordFields = document.querySelectorAll(".password-fields");
      passwordFields.forEach(function (field) {
        if (field.style.display === "none") {
          field.style.display = "block";
        } else {
          field.style.display = "none";
        }
      });
    });
});
