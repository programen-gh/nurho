document.addEventListener('DOMContentLoaded', function(){
  const imageTop = document.getElementsByClassName("service-image-top")
  const imageBottom = document.getElementsByClassName("service-image-bottom")

  Array.prototype.forEach.call(imageTop, function(e){
    e.height = 250;
    e.width = 400;
  })

  Array.prototype.forEach.call(imageBottom, function(e){
    e.height = 80;
    e.width = 120;
  })
});
