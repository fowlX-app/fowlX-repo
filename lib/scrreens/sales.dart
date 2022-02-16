import 'package:fowl_x/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts in Flutter',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text('My Sales'),
          backgroundColor: Colors.orange,
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Monthly sales trend'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Sales, String>>[
              LineSeries<_Sales, String>(
                  dataSource: <_Sales>[
                    _Sales('Jan', 35000),
                    _Sales('Feb', 28000),
                    _Sales('Mar', 34000),
                    _Sales('Apr', 32000),
                    _Sales('May', 40000),
                    _Sales('Jun', 60000)
                  ],
                  xValueMapper: (_Sales victims, _) => victims.date,
                  yValueMapper: (_Sales victims, _) => victims.salesVal,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}

class _Sales {
  _Sales(this.date, this.salesVal);

  final String date;
  final double salesVal;
}
