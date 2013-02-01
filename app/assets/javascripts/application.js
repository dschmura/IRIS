// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui

// Loads all Bootstrap javascripts
//= require bootstrap
//= require pano2vr_player
//= require qtp_library
//= require ac_quicktime

//= require html5slider.js


$(document).ready(function(){
    $('a').tooltip();
    //$('a[href="' + this.location.pathname + '"]').parent().addClass('active');
    
    
});

/*menu handler. Sets current link to active in nav bars in header and footer for current page.*/
$(function(){
  function stripTrailingSlash(str) {
    
    if(str.substr(-1) == '/') {
      return str.substr(0, str.length - 1);
    }
    return str;
  }

  var url = window.location.pathname;  
  var activePage = stripTrailingSlash(url);

  $('.nav li a').each(function(){  
    var currentPage = stripTrailingSlash($(this).attr('href'));

    if (activePage == currentPage){
      $(this).parent().addClass('active'); 
    }
   
     
  });
});





//= require_tree .
//= require_self
//= require jquery.ui.addresspicker
