import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
    static values = {
      apiKey: String,
      marker: Array
    }
    connect() {
      mapboxgl.accessToken = this.apiKeyValue

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v11",
        center:[ this.markerValue[1]["lat"], this.markerValue[1]["lng"]]
      })

      const start = [this.markerValue[1]["lat"], this.markerValue[1]["lng"]]
      const endCoords = [this.markerValue[0]["lat"], this.markerValue[0]["lng"]]
      this.#addMarkerToMap()
      this.#fitMapToMarker()
      // console.log("yo")
      // this.#getRoute(start)
      //   this.map.addLayer({
      //     id: 'point',
      //     type: 'circle',
      //     source: {
      //       type: 'geojson',
      //       data: {
      //         type: 'FeatureCollection',
      //         features: [
      //           {
      //             type: 'Feature',
      //             properties: {},
      //             geometry: {
      //               type: 'Point',
      //               coordinates: start
      //             }
      //           }
      //         ]
      //       }
      //     },
      //     paint: {
      //       'circle-radius': 10,
      //       'circle-color': '#3887be'
      //     }
      //   });
      //   // this is where the code from the next step will go
      //   const end = {
      //     type: 'FeatureCollection',
      //     features: [
      //       {
      //         type: 'Feature',
      //         properties: {},
      //         geometry: {
      //           type: 'Point',
      //           coordinates: endCoords
      //         }
      //       }
      //     ]
      //   };
      //   if (this.map.getLayer('end')) {
      //     this.map.getSource('end').setData(end);
      //   } else {
      //     this.map.addLayer({
      //       id: 'end',
      //       type: 'circle',
      //       source: {
      //         type: 'geojson',
      //         data: {
      //           type: 'FeatureCollection',
      //           features: [
      //             {
      //               type: 'Feature',
      //               properties: {},
      //               geometry: {
      //                 type: 'Point',
      //                 coordinates: endCoords
      //               }
      //             }
      //           ]
      //         }
      //       },
      //       paint: {
      //         'circle-radius': 10,
      //         'circle-color': '#f30'
      //       }
      //     });
      //   }
      //   this.#getRoute(endCoords);

  }

  #addMarkerToMap() {
    this.markerValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  // #getRoute(end) {
  //   console.log("yo")
  //   const query = await fetch(
  //     `https://api.mapbox.com/directions/v5/mapbox/cycling/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
  //     { method: 'GET' }
  //   );

  //   const json = await query.json();
  //   const data = json.routes[0];
  //   const route = data.geometry.coordinates;
  //   const geojson = {
  //     type: 'Feature',
  //     properties: {},
  //     geometry: {
  //       type: 'LineString',
  //       coordinates: route
  //     }
  //   };
  //   // if the route already exists on the map, we'll reset it using setData
  //   if (this.map.getSource('route')) {
  //     this.map.getSource('route').setData(geojson);
  //   }
  //   // otherwise, we'll make a new request
  //   else {
  //     this.map.addLayer({
  //       id: 'route',
  //       type: 'line',
  //       source: {
  //         type: 'geojson',
  //         data: geojson
  //       },
  //       layout: {
  //         'line-join': 'round',
  //         'line-cap': 'round'
  //       },
  //       paint: {
  //         'line-color': '#3887be',
  //         'line-width': 5,
  //         'line-opacity': 0.75
  //       }
  //     });
  //   }

  // }
}



















        // Add starting point to the map
    //     this.map.addLayer({
    //       id: 'point',
    //       type: 'circle',
    //       source: {
    //         type: 'geojson',
    //         data: {
    //           type: 'FeatureCollection',
    //           features: [
    //             {
    //               type: 'Feature',
    //               properties: {},
    //               geometry: {
    //                 type: 'Point',
    //                 coordinates: start
    //               }
    //             }
    //           ]
    //         }
    //       },
    //       paint: {
    //         'circle-radius': 10,
    //         'circle-color': '#3887be'
    //       }
    //     });
    //     // this is where the code from the next step will go
    //     const end = {
    //       type: 'FeatureCollection',
    //       features: [
    //         {
    //           type: 'Feature',
    //           properties: {},
    //           geometry: {
    //             type: 'Point',
    //             coordinates: endCoords
    //           }
    //         }
    //       ]
    //     };
    //     if (this.map.getLayer('end')) {
    //       this.map.getSource('end').setData(end);
    //     } else {
    //       this.map.addLayer({
    //         id: 'end',
    //         type: 'circle',
    //         source: {
    //           type: 'geojson',
    //           data: {
    //             type: 'FeatureCollection',
    //             features: [
    //               {
    //                 type: 'Feature',
    //                 properties: {},
    //                 geometry: {
    //                   type: 'Point',
    //                   coordinates: endCoords
    //                 }
    //               }
    //             ]
    //           }
    //         },
    //         paint: {
    //           'circle-radius': 10,
    //           'circle-color': '#f30'
    //         }
    //       });
    //     }
    //     this.#getRoute(endCoords);

    // }
















    // const query = await fetch(
    //   `https://api.mapbox.com/directions/v5/mapbox/cycling/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
    //   { method: 'GET' }
    // );
    // const json = await query.json();
    // const data = json.routes[0];
    // const route = data.geometry.coordinates;
    // const geojson = {
    //   type: 'Feature',
    //   properties: {},
    //   geometry: {
    //     type: 'LineString',
    //     coordinates: route
    //   }
    // };
    // // if the route already exists on the map, we'll reset it using setData
    // if (this.map.getSource('route')) {
    //   this.map.getSource('route').setData(geojson);
    // }
    // // otherwise, we'll make a new request
    // else {
    //   this.map.addLayer({
    //     id: 'route',
    //     type: 'line',
    //     source: {
    //       type: 'geojson',
    //       data: geojson
    //     },
    //     layout: {
    //       'line-join': 'round',
    //       'line-cap': 'round'
    //     },
    //     paint: {
    //       'line-color': '#3887be',
    //       'line-width': 5,
    //       'line-opacity': 0.75
    //     }
    //   });
    // }
