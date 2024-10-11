import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"];
  connect() {
    this.index = 0;
  }

  next() {
    if (this.index < this.containerTarget.children.length - 1) {
      this.index++;
    } else {
      this.index = 0;
    }
    this.updateCarousel();
  }

  prev() {
    if (this.index > 0) {
      this.index--;
    } else {
      this.index = this.containerTarget.children.length - 1;
    }
    this.updateCarousel();
  }

  updateCarousel() {
    const offset = this.index * this.containerTarget.children[0].offsetWidth;
    this.containerTarget.style.transform = `translateX(-${offset}px)`;
  }
}
