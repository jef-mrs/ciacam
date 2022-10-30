import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "insert", "supplier", "batch", "product", "insertCard" ]


  connect() {
  }

  supplier(event) {
    event.preventDefault()

    fetch(this.supplierTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.json())
      .then((data)=>{
        if (data.index) {
          this.insertTarget.innerHTML =""
          this.insertTarget.insertAdjacentHTML("beforeend", data.index)
          this.insertCardTarget.innerHTML =""
          this.insertCardTarget.insertAdjacentHTML("beforeend", data.card)
        }
      })
  }

  batch(event) {
    event.preventDefault()

    fetch(this.batchTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.json())
      .then((data)=>{
        if (data.index) {
          this.insertTarget.innerHTML =""
          this.insertTarget.insertAdjacentHTML("beforeend", data.index)
          this.insertCardTarget.innerHTML =""
          this.insertCardTarget.insertAdjacentHTML("beforeend", data.card)
        }
      })
  }

  product(event) {
    event.preventDefault()

    fetch(this.productTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.json())
      .then((data)=>{
        if (data.index) {
          this.insertTarget.innerHTML =""
          this.insertTarget.insertAdjacentHTML("beforeend", data.index)
          this.insertCardTarget.innerHTML =""
          this.insertCardTarget.insertAdjacentHTML("beforeend", data.card)
        }
      })
  }
}
