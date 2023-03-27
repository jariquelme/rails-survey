import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["select"]
  static values = {
    url: String,
    param: String
  }

  connect() {
    this.enable_target_if_children_present()
  }

  change(event) {
    this.target().disabled = true

    let params = new URLSearchParams()
    params.append(this.paramValue, event.target.selectedOptions[0].value)
    params.append("target", this.selectTarget.id)

    get(`${this.urlValue}?${params}`, {
      responseKind: 'turbo-stream'
    })
  }

  enable_target_if_children_present() {
    function logNewNodes(records) {
      for (const record of records) {
        if (record.type === "childList" && record.addedNodes.length > 0) {
          record.target.disabled = false
        }
      }
    }

    const observer = new MutationObserver(logNewNodes);
    observer.observe(this.target(), { childList: true });
  }

  target() {
    return document.getElementById(this.selectTarget.id)
  }
}