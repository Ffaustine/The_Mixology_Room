document.addEventListener("DOMContentLoaded", function() {
  var myCarousel = document.getElementById("myCarousel");
  var carousel = new bootstrap.Carousel(myCarousel, {
    interval: 5000, // Définir l'intervalle de changement des slides (en millisecondes)
    wrap: true // Activer le défilement en boucle du carousel
  });
});
