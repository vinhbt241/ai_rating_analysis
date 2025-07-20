import { application } from "./application"

import AreaChartController from "./area_chart_controller"
import BarChartController from "./bar_chart_controller"
import LineChartController from "./line_chart_controller"
import PieChartController from "./pie_chart_controller"
import DonutChartController from "./donut_chart_controller"

application.register("line-chart", LineChartController)
application.register("bar-chart", BarChartController)
application.register("area-chart", AreaChartController)
application.register("pie-chart", PieChartController)
application.register("donut-chart", DonutChartController)
