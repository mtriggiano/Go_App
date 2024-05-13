// app/assets/javascripts/active_admin.js
//= require active_admin/base
//= require tinymce


$(document).ready(function() {
    if ($('.select2-ajax').length > 0) {
      $('.select2-ajax').select2({
        ajax: {
          url: function (params) {
            return '/admin/clientes/search?q=' + params.term;
          },
          dataType: 'json',
          delay: 250,
          processResults: function (data) {
            return {
              results: $.map(data, function (item) {
                return {
                  text: item.nombre + ' ' + item.apellido + ' - ' + item.dni_cuit,
                  id: item.id
                }
              })
            };
          },
          cache: true
        },
        minimumInputLength: 1,
        placeholder: 'Buscar por nombre, apellido o DNI/CUIT'
      });
    }
  });

  document.addEventListener('DOMContentLoaded', function() {
    tinymce.init({
      selector: 'textarea.tinymce',
      plugins: 'image',
      toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent | image',
      menubar: false,
      automatic_uploads: true,
      images_upload_url: '/uploads/create', // Actualizado para usar el nuevo endpoint
      file_picker_types: 'image',
      images_reuse_filename: true
    });
  });
  
  