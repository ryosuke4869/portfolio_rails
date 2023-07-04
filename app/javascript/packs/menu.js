$(function(){
  function toggleMenu() {
    $('.menu').toggleClass('is-active');
  }
  $('.menu-btn').off('click').on('click', toggleMenu);
});
