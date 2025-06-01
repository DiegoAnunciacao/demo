import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon", "navbar", "link"]

  connect() {
    this.open = false
    this._update()
    window.addEventListener("scroll", this.handleScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this))
  }

  toggle() {
    this.open = !this.open
    this._update()
  }

  _update() {
    this.menuTarget.classList.toggle("hidden", !this.open)
    this.openIconTarget.classList.toggle("hidden", this.open)
    this.closeIconTarget.classList.toggle("hidden", !this.open)
  }

  handleScroll() {
    const scrollY = window.scrollY

    if (scrollY > 10) {
      this.navbarTarget.classList.add("bg-white/80", "shadow", "py-3")
      this.navbarTarget.classList.remove("bg-transparent", "py-5")
    } else {
      this.navbarTarget.classList.remove("bg-white/80", "shadow", "py-3")
      this.navbarTarget.classList.add("bg-transparent", "py-5")
    }
  }

}
