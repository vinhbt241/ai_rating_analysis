import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts"

export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const options = {
      chart: {
        type: "bar",
        fontFamily: "inherit",
        height: 240,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false,
        },
        stacked: true,
      },
      plotOptions: {
        bar: {
          barHeight: "50%",
          horizontal: true,
        },
      },
      dataLabels: {
        enabled: false,
      },
      series: [
        {
          name: "Container for a Fanta",
          data: [44, 55, 41, 37, 22, 43, 21],
        },
        {
          name: "Strange sunglasses",
          data: [53, 32, 33, 52, 13, 43, 32],
        },
        {
          name: "Pen Pineapple Apple Pen",
          data: [12, 17, 11, 9, 15, 11, 20],
        },
        {
          name: "Binoculars",
          data: [9, 7, 5, 8, 6, 9, 4],
        },
        {
          name: "Magical notebook",
          data: [25, 12, 19, 32, 25, 24, 10],
        },
      ],
      tooltip: {
        theme: "dark",
      },
      grid: {
        padding: {
          top: -20,
          right: 0,
          left: -4,
          bottom: -4,
        },
        strokeDashArray: 4,
      },
      xaxis: {
        labels: {
          padding: 0,
          formatter: function (val) {
            return val + "K"
          },
        },
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },
        categories: ["2008", "2009", "2010", "2011", "2012", "2013", "2014"],
      },
      yaxis: {
        labels: {
          padding: 4,
        },
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
