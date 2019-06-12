import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};
const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb' // <-- use your own!
});

export { initAutocomplete };
