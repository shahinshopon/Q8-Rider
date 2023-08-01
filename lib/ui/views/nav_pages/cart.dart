// import 'package:chart_sparkline/chart_sparkline.dart';
// import 'package:d_chart/d_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Cart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Center(
//             child: AspectRatio(
//               aspectRatio: 3,
//               child: DChartLine(
//                 includePoints: true,
//                 // includeArea: true,
//                 data: [
//                   {
//                     'id': 'Line',
//                     'data': [
//                       {'domain': 2020 - 2020, 'measure': 4.1},
//                       {'domain': 2021 - 2020, 'measure': 4},
//                       {'domain': 2022 - 2020, 'measure': 8},
//                       {'domain': 2023 - 2020, 'measure': 1},
//                     ],
//                   },
//                 ],
//                 lineColor: (lineData, index, id) => Colors.amber,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//               Container(height: 25,width: 25,child: Center(child: Text('T')),color: Colors.amber),
//             ],
//           ),
//           AspectRatio(
//             aspectRatio: 3,
//             child: Sparkline(
//               data: [0.0, 1.0, 1.5, 2.0, 0.0, -1.0, -0.5],
//               gridLinelabelPrefix: '\$',
//               gridLineLabelPrecision: 3,
//               enableGridLines: true,
//               lineWidth: 3.0,
              
//               lineGradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.purple[800]!, Colors.purple[200]!],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('1/1/15'),
//               Text('1/1/16'),
//               Text('1/1/17'),
//               Text('1/1/18'),
//               Text('1/1/19'),
//               Text('1/1/20'),
//               Text('1/1/21'),
//             ],
//           ),
//           AspectRatio(
//             aspectRatio: 3,
//             child: SfCartesianChart(
//               // Initialize category axis
//               primaryXAxis: CategoryAxis(),
          
//               series: <LineSeries<SalesData, String>>[
//                 LineSeries<SalesData, String>(
//                   // Bind data source
//                   dataSource:  <SalesData>[
//                     SalesData('Jan', 35),
//                     SalesData('Feb', 28),
//                     SalesData('Mar', 34),
//                     SalesData('Apr', 32),
//                     SalesData('May', 40)
//                   ],
//                   xValueMapper: (SalesData sales, _) => sales.year,
//                   yValueMapper: (SalesData sales, _) => sales.sales
//                 )
//               ]
//             ),
//           )
        
//         ],
//       ),
//     );
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }