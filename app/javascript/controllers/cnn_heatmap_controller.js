import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="model-layer"
export default class extends Controller {
  static targets = ["model", "layer"]
  static values = {
    layers: Object,
  }

  updateLayers() {
    const selectedModel = this.modelTarget.value
    const layers = this.layersValue[selectedModel] || []

    this.layerTarget.innerHTML = ""

    const promptOption = document.createElement("option")
    promptOption.text = "Choose target layer"
    promptOption.disabled = true
    promptOption.selected = true
    this.layerTarget.appendChild(promptOption)

    layers.forEach((layer) => {
      const option = document.createElement("option")
      option.value = layer
      option.text = layer
      this.layerTarget.appendChild(option)
    })
  }
}
