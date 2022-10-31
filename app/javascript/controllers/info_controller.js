import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "insert", "model" ]


  connect() {
  }


  info(event) {
    event.preventDefault()

    fetch(this.modelTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
    .then(response => response.json())
    .then((data)=>{
        this.insertTarget.innerHTML =""
        this.insertTarget.insertAdjacentHTML("beforeend", data.form)
      })
  }
}
