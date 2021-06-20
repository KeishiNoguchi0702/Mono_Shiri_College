$(function(){
  console.log('ok');
  $('.articles').hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.sub_menu",this).slideUp();
  });
});