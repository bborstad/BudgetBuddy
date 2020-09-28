$( document ).on('turbolinks:load', function() {
    $('#property_properties_type').change(function() {
     if ($( this ).val() == 'appartment') {
      document.getElementById("hide_floor").style.display = "initial";
     }
     else {
      document.getElementById("hide_floor").style.display = "none";
     }
    });
   });