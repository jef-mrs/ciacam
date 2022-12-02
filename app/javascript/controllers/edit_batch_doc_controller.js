import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {

  static targets = ["new", "insert", "form", 'inserted', "edit"]


  edit(event) {
    event.preventDefault()
    fetch(this.editTarget, {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
    .then(response => response.json())
    .then((data)=>{
        this.insertedTarget.innerHTML =""
        this.insertedTarget.insertAdjacentHTML("beforeend", data.form)
      })
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
        this.inseredTarget.innerHTML = ""
        if (data.error) {
          this.insertedTarget.innerHTML = ""
          this.insertedTarget.innerHTML = data.error
        } else {
          this.insertedTarget.innerHTML = ""
          this.insertedTarget.innerHTML = data.inserted_item

        }
        }
      )
  }
}
