$(document).on('turbolinks:load', function() {
  $(".selectpicker").selectpicker();
  
  $('.ckeditor:visible').each(function() {
  var id = $(this).attr('id');
    if (!CKEDITOR.instances[id]) {
       CKEDITOR.replace(id);
  }});
  
  $('.list-group-item > label').change(function(){
    $(this).parent().toggleClass("active");
  });
  
  $('a.panel-title').click(function(){
    event.preventDefault();
    $(this).children('.fa').toggleClass('hidden');
    $(this).parent().next().toggleClass("hidden");
  });
  
});