$(function(){
  $("ul.personal__menu li").hover(function() {
    $("ul.pulldown", this).show();
  }, function(){
    $("ul.pulldown",this).hide();
  });
});