$(document).on('turbolinks:load', function(){
  $(".footer__cell li a").on("mouseover",function () {
    $(this).css({
      'text-decoration': "underline"
    });
  });
  $(".footer__cell li a").on("mouseout",function () {
    $(this).css({
      'text-decoration': ""
    });
  });
});
