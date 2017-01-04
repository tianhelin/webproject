$(document).on('turbolinks:load', function() {
  $(".selectpicker").selectpicker();
  
  $('.ckeditor:visible').each(function() {
  var id = $(this).attr('id');
    if (!CKEDITOR.instances[id]) {
       CKEDITOR.replace(id);
  }});
  
  $('.list-group-item a').click(function(){
    event.preventDefault();
    $(this).parent().toggleClass("active");
    $(this).siblings("input").prop('checked', true)
  });
  
  $('a.panel-title').click(function(){
    event.preventDefault();
    $(this).children('.fa').toggleClass('hidden');
    $(this).parent().next().toggleClass("hidden");
  });
  
  $('a.select-all-btn').click(function(){
    event.preventDefault();
    $(this).toggleClass('hidden');
    $(this).siblings('a').toggleClass("hidden");
    $('ul.user-list li').addClass('active');
    $('ul.user-list li').children("input").prop('checked', true)
  });
  
  $('a.select-cancel-btn').click(function(){
    event.preventDefault();
    $(this).toggleClass('hidden');
    $(this).siblings('a').toggleClass("hidden");
    $('ul.user-list li').removeClass('active');
    $('ul.user-list li').children("input").prop('checked', false)
  });
  
});