$(function() {

  $(document).on('click', '.product-detail__seller__delete__button', function() {

    $('html, body').css('overflow', 'hidden');
    $('.modal-wrapper').show();
  });

  $(document).on('click', '.modal-wrapper__inner__button--left', function() {

    $('html, body').css('overflow', 'visible');
    $('.modal-wrapper').hide();
  });
});
