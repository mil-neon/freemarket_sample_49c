$(document).on('turbolinks:load', function(){
  $('.top-carousel-stage-outer-stage.slick').slick({
    autoplay:true,
    dots:true,
  });
  $( '.top-carousel-stage-outer-stage.slick' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
});
