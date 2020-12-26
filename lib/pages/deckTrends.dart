import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

const String usage = "The latest deck trends of the month";

class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withSampleData() {
    return new NumericComboLinePointChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  var axis = charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
            fontSize: 10, color: charts.MaterialPalette.white), //chnage white color as per your requirement.
      ));


  @override
  Widget build(BuildContext context) {
    return new charts.NumericComboChart(seriesList,
        animate: animate,
        // Configure the default renderer as a line renderer. This will be used
        // for any series that does not define a rendererIdKey.
        defaultRenderer: new charts.LineRendererConfig(),
        domainAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.SmallTickRendererSpec(

              // Tick and Label styling here.
                labelStyle: new charts.TextStyleSpec(
                    fontSize: 18, // size in Pts.
                    color: charts.MaterialPalette.white),

                // Change the line colors to match text color.
                lineStyle: new charts.LineStyleSpec(
                    color: charts.MaterialPalette.white))),
        /// Assign a custom style for the measure axis.
        primaryMeasureAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
                labelStyle: new charts.TextStyleSpec(
                    fontSize: 18, // size in Pts.
                    color: charts.MaterialPalette.white),

                // Change the line colors to match text color.
                lineStyle: new charts.LineStyleSpec(
                    color: charts.MaterialPalette.white))),
        // Custom renderer configuration for the point series.
        customSeriesRenderers: [
          new charts.PointRendererConfig(
            // ID used to link series to this renderer.
              customRendererId: 'customPoint')
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {

    final desktopSalesData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    final tableSalesData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    final mobileSalesData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: mobileSalesData)
      // Configure our custom point renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}


/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class DeckTrendsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Deck trends"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // textWidgets.title(usage, 0, 5, 0, 10, 30),
              Text(usage, style: TextStyle(fontSize: 18)),
              Expanded(child: NumericComboLinePointChart.withSampleData())
            ],
          ),
        )
    );
  }
}