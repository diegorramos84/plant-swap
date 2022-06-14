import { Controller } from "@hotwired/stimulus";
import { initStarRating } from '../plugins/init_star_rating';

// Connects to data-controller="star-rating"
export default class extends Controller {
  connect() {
    initStarRating();
  }
}
