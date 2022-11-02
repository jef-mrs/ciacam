import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = [ "insert", "model", "form", "insert", 'info', 'number' ]


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

  close() {
    this.insertTarget.innerHTML = ""
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
          this.infoTarget.innerHTML = ""
          this.infoTarget.innerHTML = data.info
          if (data.number){
            this.numberTarget.innerHTML = ""
            this.numberTarget.innerHTML = data.number
          }
        }
        }
      )
  }
}
