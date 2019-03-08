import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
      const flarker = new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
      flarker._element.innerHTML = `
        <div class="price-popup-card">
          £${marker.flice}
        </div>
      `
    });
    fitMapToMarkers(map, markers);
  }
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};


// const addMarkersToMap = (map, markers) => {
  // const markers = JSON.parse(mapElement.dataset.markers);
  // markers.forEach((marker) => {
    // // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this
    // new mapboxgl.Marker()
    //   .setLngLat([ marker.lng, marker.lat ])
    //   .setPopup(popup) // <-- add this
  //   //   .addTo(map);
  // });
  //   fitMapToMarkers(map, markers);
// };

export { initMapbox };
