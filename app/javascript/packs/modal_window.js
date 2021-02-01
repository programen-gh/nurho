document.addEventListener("DOMContentLoaded", function(){
  {
    const open = document.getElementById("open");
    const search = document.getElementById("search");
    const modal = document.getElementById("modal");
    const mask = document.getElementById("mask");

    open.addEventListener("click", function () {
      modal.removeAttribute("class", "hidden");
      mask.removeAttribute("class", "hidden");
    });
    search.addEventListener("click", function () {
      modal.classList.add("hidden");
      mask.classList.add("hidden");
    });
    mask.addEventListener("click", function () {
      modal.classList.add("hidden");
      mask.classList.add("hidden");
    });
  }
});