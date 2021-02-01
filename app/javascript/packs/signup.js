document.addEventListener('DOMContentLoaded', function(){
  const btn = document.getElementById("btn")
  const url = document.getElementById("url")

  btn.addEventListener("click", function(){
    url.removeAttribute("class", "company-sign-up")
  })
})