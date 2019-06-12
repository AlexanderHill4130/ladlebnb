import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  // layers

  // fit map to markers
  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5 });
};
// start the map
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb',
      pitch: 60, // pitch in degrees
      bearing: -60 // bearing in degrees
    });
    // mapbox search bar
    map.addControl(new MapboxGeocoder({ mapboxgl: mapboxgl, accessToken: mapboxgl.accessToken }));

    //navigation controls

    map.addControl(new mapboxgl.NavigationControl());
// layers --- 3D Buildings
    map.on('load', function() {
// Insert the layer beneath any symbol layer.
var layers = map.getStyle().layers;

var labelLayerId;
for (var i = 0; i < layers.length; i++) {
if (layers[i].type === 'symbol' && layers[i].layout['text-field']) {
labelLayerId = layers[i].id;
break;
}
}

map.addLayer({
'id': '3d-buildings',
'source': 'composite',
'source-layer': 'building',
'filter': ['==', 'extrude', 'true'],
'type': 'fill-extrusion',
'minzoom': 15,
'paint': {
'fill-extrusion-color': '#aaa',

// use an 'interpolate' expression to add a smooth transition effect to the
// buildings as the user zooms in
'fill-extrusion-height': [
"interpolate", ["linear"], ["zoom"],
15, 0,
15.05, ["get", "height"]
],
'fill-extrusion-base': [
"interpolate", ["linear"], ["zoom"],
15, 0,
15.05, ["get", "min_height"]
],
'fill-extrusion-opacity': .6
}
}, labelLayerId);
});

// DRONE

var url = 'https://wanderdrone.appspot.com/';
map.on('load', function () {
map.loadImage('https://cdn3.iconfinder.com/data/icons/airport-collection/100/9-512.png', function(error, image) {
if (error) throw error;
map.addImage('cat', image);
window.setInterval(function() {
map.getSource('drone').setData(url);
}, 2000);

map.addSource('drone', { type: 'geojson', data: url });
map.addLayer({
"id": "drone",
"type": "symbol",
"source": "drone",
"layout": {
"icon-image": "cat",
"icon-size": 0.025
}
});
});
});

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
    fitMapToMarkers(map, markers);
  }
};




export { initMapbox };
