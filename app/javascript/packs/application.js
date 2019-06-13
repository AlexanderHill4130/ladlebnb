import "bootstrap";
import "../plugins/flatpickr";
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../plugins/navbar';
initUpdateNavbarOnScroll();
import { loadDynamicBannerText } from '../plugins/banner';
loadDynamicBannerText();
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();

