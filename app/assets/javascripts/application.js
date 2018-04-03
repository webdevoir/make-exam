// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require tinymce
//= require rails-ujs
//= require cocoon
//= require turbolinks
//= require_tree .



$(document).on('turbolinks:load', function () {
   tinymce.remove();
   tinymce.init({
   		selector:'.tinymce',
   		branding: false,
   		toolbar: 'bold italic underline fontsizeselect bullist numlist subscript superscript forecolor backcolor',
   		menubar: false,
   		plugins: 'link textcolor lists colorpicker textcolor',
   		statusbar: false,

   		 setup: function(ed) {
	        ed.onKeyUp.add(function() {
	            checkFormChanged()
	        });
	    },

   	});
});