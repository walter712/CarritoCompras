// Seleccionamos el carrusel usando el ID
const carouselElement = document.querySelector('#carouselExampleDark');

// Pausa el carrusel cuando el ratón está sobre él y lo reanuda cuando se quita
carouselElement.addEventListener('mouseenter', () => {
  bootstrap.Carousel.getInstance(carouselElement).pause();
});

carouselElement.addEventListener('mouseleave', () => {
  bootstrap.Carousel.getInstance(carouselElement).cycle();
});

// Agregamos un efecto de atenuación a los botones de navegación
const prevButton = document.querySelector('.carousel-control-prev');
const nextButton = document.querySelector('.carousel-control-next');

prevButton.addEventListener('mousedown', () => {
    prevButton.style.opacity = '0.5';
});
prevButton.addEventListener('mouseup', () => {
    prevButton.style.opacity = '1';
});

nextButton.addEventListener('mousedown', () => {
    nextButton.style.opacity = '0.5';
});
nextButton.addEventListener('mouseup', () => {
    nextButton.style.opacity = '1';
});
