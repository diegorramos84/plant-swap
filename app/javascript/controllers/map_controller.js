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

      // const start = [this.markerValue[1]["lat"], this.markerValue[1]["lng"]]
      // const endCoords = [this.markerValue[0]["lat"], this.markerValue[0]["lng"]]
      this.#addMarkersToMap()
      this.#fitMapToMarker()
  }

  #addMarkersToMap() {
    this.markerValue.forEach((marker) => {

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "30px"
      customMarker.style.height = "30px"

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map) // adds the custom marker to the map
    })
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
