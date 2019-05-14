$(document).on('turbolinks:load', function(){
  $('.slick-main').slick({
    dots:true,
    customPaging: function(slick,index) {
      var targetImage = $(slick.$slides[index]).find('img').attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  $( '.slick-main' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
});
