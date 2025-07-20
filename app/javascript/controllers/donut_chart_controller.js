import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts"

export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const options = {
      chart: {
        type: "donut",
        fontFamily: "inherit",
        height: 240,
        sparkline: {
          enabled: true,
        },
        animations: {
          enabled: false,
        },
      },
      series: [7, 93],
      labels: ["Confidence", ""],
      grid: {
        strokeDashArray: 4,
      },
      colors: ["rgba(255, 255, 255, 0)", "blue"],
      legend: {
        show: false,
      },
      tooltip: {
        fillSeriesColor: true,
      },
    }

    new ApexCharts(this.chartTarget, options).render()
  }
}
