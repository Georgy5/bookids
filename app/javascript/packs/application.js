import "bootstrap";
import "jquery-bar-rating";


$(function() {
  $('#review_stars').barrating({theme: 'fontawesome-stars'});
  $('.review-stars-select').each(function() {
    $(this).barrating({theme: 'fontawesome-stars', readonly: true, emptyValue: 0});
  })
});

$(function() {
  $('.choice').click(function() {
    $(this).toggleClass('active');
  });
});

$(function() {
  $('.save-button').click(function() {
    $(this).addClass('hidden');
  });
});


