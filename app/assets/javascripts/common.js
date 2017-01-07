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
    $(this).siblings('.panel').children('ul').children('li').addClass('active');
    $(this).siblings('.panel').children('ul').children('li').children('input').prop('checked', true)
  });
  
  $('a.select-cancel-btn').click(function(){
    event.preventDefault();
    $(this).toggleClass('hidden');
    $(this).siblings('a').toggleClass("hidden");
    $(this).siblings('.panel').children('ul').children('li').removeClass('active');
    $(this).siblings('.panel').children('ul').children('li').children('input').prop('checked', false)
  });
  $('a.return-history-title').click(function(){
    event.preventDefault();
    $(this).parent().siblings('.panel-body').toggleClass('hidden');
    $(this).children().children('.fa').toggleClass('hidden');
  })
});