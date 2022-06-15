// Entry point for the build script in your package.json
import Swal from "sweetalert2"
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initStarRating } from './plugins/init_star_rating';

initStarRating();
