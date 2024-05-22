import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input"]

    search() {
        const query = this.inputTarget.value
        if (query.length > 3) {
            this.element.requestSubmit()
        }
    }
}
