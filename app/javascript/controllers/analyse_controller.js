import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "insert", "new", "form", "insert", 'info', 'number', 'doc', "card", , "insertAnalyse" ]


  connect() {
  }



  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.insertTarget.innerHTML = ""
        if (data.error) {
          this.insertTarget.innerHTML = ""
          this.insertTarget.innerHTML = data.error
        } else {
          this.insertTarget.innerHTML = ""
          this.insertTarget.innerHTML = data.inserted_item
        }
        }
      )
  }
}
