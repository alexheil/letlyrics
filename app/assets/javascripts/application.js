// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var flashTimeout = function() {

  setTimeout(function() {
    $('.flash_js').fadeOut();
  }, 8000);

  // $('body').fadeIn(1000);

};

$(document).ready(flashTimeout);
$(document).on('turbolinks:load', flashTimeout);

var menuToggle = function() {

  $('#menu-click-open').click(function() {
    $('#menu-container').fadeIn(300);
  });

  $('#menu-click-close').click(function() {
    $('#menu-container').fadeOut(300);
  });

};

$(document).ready(menuToggle);
$(document).on('turbolinks:load', menuToggle);



var formTabs = function() {

  $('#remember-inactive').change(function(){
    if($(this).is(":checked")) {
      $('#remember-tab').addClass("remember-active");
      $('#remember-tab').removeClass("remember-inactive");
    } else {
      $('#remember-tab').removeClass("remember-active");
      $('#remember-tab').addClass("remember-inactive");
    }
  });

};

$(document).ready(formTabs);
$(document).on('turbolinks:load', formTabs);


var addLyrics = function() {

  $('.site-form-click').click(function() {
    $('#menu-container').fadeOut(300);
    $('#site-content').fadeOut(300);
    $('#register-form').fadeOut(300);
    $('#site-form').delay(300).fadeIn(300);
  });

  $('.register-click').click(function() {
    $('#menu-container').fadeOut(300);
    $('#site-content').fadeOut(300);
    $('#site-form').fadeOut(300);
    $('#register-form').delay(300).fadeIn(300);
  });


  $('.close-form-click').click(function() {
    $('#site-form').fadeOut(300);
    $('#register-form').fadeOut(300);
    $('#site-content').delay(300).fadeIn(300);
  });
  
};

$(document).ready(addLyrics);
$(document).on('turbolinks:load', addLyrics);


var transitionContent = function() {

  function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min);
  };

  var newBackground = getRandomInt(0, 10);

  $('.slider-' + newBackground).show();

  function changeBackground() {

    newBackground++;

    var currentBackground = newBackground - 1;

    if(newBackground > 10) currentBackground = 10;
    if(newBackground > 10) newBackground = 1;

    $('.slider-' + currentBackground).fadeOut(1000, function() {
      $('.slider-' + newBackground).fadeIn(1300);
    });

    setTimeout(changeBackground, 10000);
  }

  setTimeout(changeBackground, 10000);

};

$(document).ready(transitionContent);
$(document).on('turbolinks:load', transitionContent);
