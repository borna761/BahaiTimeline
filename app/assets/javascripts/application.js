// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require turbolinks
//= require timeline
//= require ddtf
//= require html-table-search
//= require_tree .

var windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

$(document).on('ready page:load', function () {
  $('.js-toggle-nav').click(function() {
    $('html').toggleClass('show-site-nav');
  });
  $('.site-nav a').click(function() {
    $('html').removeClass('show-site-nav');
  });
  var formFilter = $('.form-filter');
  var labelGroup = $('<br><label class="form-label is-inline">Group</label>')
  var labelCycle = $('<br><label class="form-label is-inline">Cycle</label>')
  formFilter.append(labelGroup)
  $('.js-filter_group').clone(true,true).addClass('form-field is-inline').appendTo(formFilter);
  formFilter.append(labelCycle)
  $('.js-filter_cycle').clone(true,true).addClass('form-field is-inline').appendTo(formFilter);
});
