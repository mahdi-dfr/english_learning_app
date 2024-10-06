import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vaje_yar/core/resource/route_helper.dart';
import 'package:vaje_yar/core/utils/colors.dart';
import 'package:vaje_yar/feature/home/presentation/widget/main_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.foregroundColor));

    // Data for the chart
    // Data for the chart
    List<ChartData> getChartData() {
      return <ChartData>[
        // The progress part (e.g., 25%)
        ChartData('Completed', 25, Colors.black),
        // The remaining part (e.g., 75%)
        ChartData('Remaining', 75, Colors.white),
      ];
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(children: [
            Container(
              width: width,
              height: height / 3 + 5,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(
              width: width,
              height: height / 3,
              decoration: BoxDecoration(
                color: AppColors.foregroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: ()=> Get.toNamed(RouteHelper.exam),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: width / 2,
                        child: Icon(
                          Icons.play_arrow,
                          size: width / 2,
                        ),

                        // child: Icon(Icons.play_arrow, color: Colors.black, size: width/2,),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width / 2,
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          // Render doughnut chart to represent progress
                          DoughnutSeries<ChartData, String>(
                            strokeColor: Colors.black,
                            dataSource: getChartData(),
                            xValueMapper: (ChartData data, _) => data.label,
                            yValueMapper: (ChartData data, _) => data.value,
                            // Showing data labels inside the chart
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            // Customize the inner radius for a progress style chart
                            radius: '80%',
                            innerRadius: '70%',
                            pointColorMapper: (ChartData data, _) => data.color,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          const SizedBox(
            height: 100,
          ),
          const MainMenuWidget()
        ],
      )),
    );
  }
}

class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}
