import "bootstrap";
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../plugins/navbar';
initUpdateNavbarOnScroll();
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

initMapbox();

