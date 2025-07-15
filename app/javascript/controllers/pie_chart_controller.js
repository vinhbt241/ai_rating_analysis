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
      series: [44, 55, 12, 2],
      labels: ["Direct", "Affilliate", "E-mail", "Other"],
      tooltip: {
        theme: "dark",
      },
      grid: {
        strokeDashArray: 4,
      },
      legend: {
        show: true,
        position: "bottom",
        offsetY: 12,
        markers: {
          width: 10,
          height: 10,
          radius: 100,
        },
        itemMargin: {
          horizontal: 8,
          vertical: 8,
        },
      },
    }

    new ApexCharts(this.chartTarget, options).render()
  }
}
