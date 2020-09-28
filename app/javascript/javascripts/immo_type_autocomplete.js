$( document ).on('turbolinks:load', function() {
    return $("#property_properties_type").autocomplete({
     source: ["appartement", "maison"]
    });
   });