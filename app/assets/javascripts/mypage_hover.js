$(document).on('turbolinks:load', function(){
  $(".mypage-nav-list-item").on("mouseover",function () {
    $(this).css({
      backgroundColor: "#fafafa",
    });
    $(this).next().css({
      margin: "-40px 10px 0 0",
      color: "#333"
    });
  });
  $(".mypage-nav-list-item").on("mouseout",function () {
    $(this).css({
      backgroundColor: ""
    });
    $(this).next().css({
      margin: "",
      color: ""
    });
  });

  $(".header__container__bottom__right .personal__menu__list__news .mypage__nav__list li").on("mouseover",function () {
    $(this).css({
      backgroundColor: "#fafafa",
    });
    $(this).children().children().css({
      color: "#333"
    });
  });
  $(".header__container__bottom__right .personal__menu__list__news .mypage__nav__list li").on("mouseout",function () {
    $(this).css({
      backgroundColor: ""
    });
    $(this).children().children().css({
      color: ""
    });
  });
});