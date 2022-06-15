import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="sweet-alert"
export default class extends Controller {
  static values = {
    plant: String
  }
  connect() {
    console.log("Hello")
  }

  open(event) {
    const id = this.plantValue
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
    event.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        console.log(`/plants/${id}`)
        fetch(
          `/plants/${id}`, {
            method: 'DELETE',
            headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken }
          }
        ).then(function() {
          Swal.fire(
            'Deleted!',
            'Your plant has been deleted.',
            'success'
          ).then(function() {
            window.location.reload()
          })
        })
      }
    })
  }
}
