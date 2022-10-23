import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "form", "insert", "index"]


  // connect() {
  //   console.log(this.formTarget.action)
  // }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.insertTarget.innerHTML =""
          this.insertTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        } else {
          this.indexTarget.outerHTML = data.index
          this.insertTarget.insertAdjacentHTML("beforeend", data.error)
          console.log(data.error)
        }
      })
  }
}
