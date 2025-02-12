import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result extends StatelessWidget {
  final int v;
  Result({
    super.key,
    required this.isMale,
    required this.result,
    required this.age,
  }): v = result.toInt();
  final bool isMale;
  final double result;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 60,
                        axisLabelStyle: GaugeTextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(startValue: 0, endValue: 20, color:Colors.green),
                          GaugeRange(startValue: 20,endValue: 40,color: Colors.orange),
                          GaugeRange(startValue: 40,endValue: 60,color: Colors.red)],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: result,
                            needleColor: Colors.white,
                            knobStyle: KnobStyle(
                              color: Colors.amber,
                              borderColor: Colors.white,
                            ),)],
                        annotations: <GaugeAnnotation>[

                          GaugeAnnotation(widget: Text('$v',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
                              angle: 90, positionFactor: 0.5
                          )]
                    )]),
            ],
          ),
        ),
      ),
    );
  }
}