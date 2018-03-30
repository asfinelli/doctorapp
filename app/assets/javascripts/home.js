

$(document).ready(function(){
  $("#show").click(function(){
    $(".sign-up").toggle();
  });
  $("#login").click(function(){
    $(".user-login").toggle();

  });
  $("#doctor-login").click(function(){
    $(".doc-login").toggle();
  });
  $("#show").click(function(){
    $(".jumbotron").toggle();
});
$("#login").click(function(){
  $(".doc-login").hide();

});
$("#doctor-login").click(function(){
  $(".user-login").hide();
});
});
