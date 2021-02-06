import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

// 1 Initialise the map

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/cuccibar/ckkrcro4v03h217lby45s2poq',
      center: [13.4050, 52.5200],
      zoom: 11
    });

  // [ Out markes on the map ]
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

  // const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5000 });

  element.className = 'marker';
  element.style.backgroundImage = `url('/logo.png')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';

}
};

export { initMapbox };

// markers.forEach((marker) => {
//   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

//   // Create a HTML element for your custom marker
//   const element = document.createElement('div');
//   element.className = 'marker';
//   element.style.backgroundImage = `url('${marker.image_url}')`;
//   element.style.backgroundSize = 'contain';
//   element.style.width = '25px';
//   element.style.height = '25px';

//   // Pass the element as an argument to the new marker
//   new mapboxgl.Marker(element)
//     .setLngLat([marker.lng, marker.lat])
//     .setPopup(popup)
//     .addTo(map);
// });

// // [...]
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// // [...]
// if (mapElement) {
//   // [...]
//   map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
//                                       mapboxgl: mapboxgl }));
// }






// 3 ADD AN EVENT LISTENER IN JS ON THE FORM AND SUBMIT ACTION
// const form = document.querySelector('#geo-query');

// form.addEventListener('submit', (event) => {
//   event.preventDefault(); // <-- to prevent <form>'s native behaviour
//   const input = event.currentTarget.querySelector('#address');
//   fetchGeoApis(input.value);
// });
