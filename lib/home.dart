import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';


class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 44, 28, 190),
          title: Text('Binamod Grafik')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                    "Son 7 Yılda Gerçekleşen Depremlerin Şiddeti",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 0,
                          width: SizeConfig.blockSizeVertical! * 0,
                        ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartBar(
                      data: [
                        {
                          'id': 'Bar',
                          'data': [
                            {'domain': '2010', 'measure': 3},
                            {'domain': '2011', 'measure': 4},
                            {'domain': '2012', 'measure': 6},
                            {'domain': '2013', 'measure': 8},
                            {'domain': '2014', 'measure': 7},
                            {'domain': '2015', 'measure': 2},
                            {'domain': '2016', 'measure': 5},
                          ],
                        },
                      ],
                      domainLabelPaddingToAxisLine: 16,
                      axisLineTick: 1,
                      axisLinePointTick: 2,
                      axisLinePointWidth: 10,
                      axisLineColor: Color.fromARGB(255, 0, 0, 0),
                      measureLabelPaddingToAxisLine: 16,
                      barColor: (barData, index, id) {
                        if (barData['measure'] < 4)
                          return Colors.green;
                        else
                          return Colors.red;
                      },
                      showBarValue: true,
                      barValue: (barData, index) =>
                          barData['measure'].toString(),
                      verticalDirection: false,
                      barValuePosition: BarValuePosition.auto,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Son 7 Depremde Hayatını Kaybeden Birey Sayısı",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartPie(
                      data: [
                        {'domain': '2010', 'measure': 10},
                        {'domain': '2011', 'measure': 5},
                        {'domain': '2012', 'measure': 20},
                        {'domain': '2013', 'measure': 3},
                        {'domain': '2014', 'measure': 5},
                        {'domain': '2015', 'measure': 7},
                        {'domain': '2016', 'measure': 8},
                      ],
                      fillColor: (pieData, index) => Colors.orange,
                      donutWidth: 30,
                      labelColor: Colors.white,
                      
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                    "Fay Hattının Konumunuza Olan Uzaklığı ve Size Ulaşma Süresinin",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartLine(
                      data: [
                        {
                          'id': 'Line',
                          'data': [
                            {'domain': 0, 'measure': 0},
                            {'domain': 2, 'measure': 10},
                          ],
                        },
                      ],
                      lineColor: (lineData, index, id) => Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
