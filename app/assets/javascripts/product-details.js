$(function () {
  $(".product-detail__item__main__photo__mini-box__dot").hover(function () {
    $('.product-detail__item__main__photo__biggest').attr('src', $(this).attr('src'))
  });
});