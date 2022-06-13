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
        style: "mapbox://styles/mapbox/streets-v11"
      })
      console.log(this.markerValue)

      this.#addMarkerToMap()
      this.#fitMapToMarker()
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
}
