$(document).on('turbolinks:load', function() {
  $(".selectpicker").selectpicker();
  
    $('.ckeditor:visible').each(function() {
    var id = $(this).attr('id');
    if (!CKEDITOR.instances[id]) {
       CKEDITOR.replace(id);
    }});
});