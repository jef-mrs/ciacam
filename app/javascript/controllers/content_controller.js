import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "insert", "supplier", "batch", "product" ]


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
        }
      })
  }

  batch(event) {
    event.preventDefault()
    console.log(this.batchTarget)
    fetch(this.batchTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
      .then(response => response.json())
      .then((data)=>{
        if (data.index) {
          this.insertTarget.innerHTML =""
          this.insertTarget.insertAdjacentHTML("beforeend", data.index)
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
        }
      })
  }
}
