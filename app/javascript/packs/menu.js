$(document).on('turbolinks:load',function(){
  $('.menu-btn').on('click', function(){
    $('.menu').toggleClass('is-active');
  });
});
