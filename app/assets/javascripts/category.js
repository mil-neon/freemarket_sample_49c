$(document).on('turbolinks:load', function(){
  $(".header__container__bottom__left__search--menu__list__categories").hover(function() {
    $(this).children("ul").show();
  }, function(){
    $(this).children("ul").hide();
  });
  $(".category-menu__level1 li").on("mouseover",function () {
    $(this).css({
      backgroundColor: "#ea352d"
    });
  });
  $(".category-menu__level1 li").on("mouseout",function () {
    $(this).css({
      backgroundColor: ""
    });
  });
  $(".category-menu__level1 li").hover(function() {
    $(this).children("ul").show();
  }, function(){
    $(this).children("ul").hide();
  });
  $(".category-menu__level1__level2 li").on("mouseover", function () {
    $(this).css({
      backgroundColor: "#eee"
    });
  });
  $(".category-menu__level1__level2 li").on("mouseout", function () {
    $(this).css({
      backgroundColor: ""
    });
  });
  $(".header__container__bottom__left__search--menu__list__brands").hover(function() {
    $(this).children("ul").show();
  }, function(){
    $(this).children("ul").hide();
  });
  $(".brand-menu__level1 li").on("mouseover",function () {
    $(this).css({
      backgroundColor: "#ea352d"
    });
  });
  $(".brand-menu__level1 li").on("mouseout",function () {
    $(this).css({
      backgroundColor: ""
    });
  });
  $(".personal__menu__list__mypage--link").on("mouseover",function () {
    $(this).children().css({
      color: "#0099e8"
    });
  });
  $(".personal__menu__list__mypage--link").on("mouseout",function () {
    $(this).children().css({
      color: "",
    });
  });
  $(".personal__menu__list__todo--link").on("mouseover",function () {
    $(this).children().css({
      color: "#0099e8"
    });
  });
  $(".personal__menu__list__todo--link").on("mouseout",function () {
    $(this).children().css({
      color: "",
    });
  });
  $(".personal__menu__list__news--link").on("mouseover",function () {
    $(this).children().css({
      color: "#0099e8"
    });
  });
  $(".personal__menu__list__news--link").on("mouseout",function () {
    $(this).children().css({
      color: "",
    });
  });
  $(".personal__menu__list__mypage .mypage__link__box .mypage__nav__list li").on("mouseover",function () {
    $(this).css({
      backgroundColor: "#fafafa",
    });
    $(this).children().children().css({
      color: "#333",
      right: "5px"
    });
  });
  $(".personal__menu__list__mypage .mypage__link__box .mypage__nav__list li").on("mouseout",function () {
    $(this).css({
      backgroundColor: ""
    });
    $(this).children().children().css({
      color: "",
      right: ""
    });
  });
});
