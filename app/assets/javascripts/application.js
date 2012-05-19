// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.addresspicker
//= require pano2vr_player
//= require qtp_library
//= require ac_quicktime
//= require jquery.coda-slider-2.0
//= require_self
//= require_tree .

$(function() {
  $("#classroom_search input").keyup(function() {
    $.get($("#classroom_search").attr("action"), $("#classroom_search").serialize(), null, "script");
    return false;
  });
});


