//imports jQuery plugin to use the star rating with jQuery
import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
  console.log($('#review_rating'))
};

export { initStarRating };
