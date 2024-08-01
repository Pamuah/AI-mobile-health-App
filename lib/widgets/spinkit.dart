import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitWidget extends StatefulWidget {
  const SpinkitWidget({super.key});

  @override
  State<SpinkitWidget> createState() => _SpinkitWidgetState();
}

class _SpinkitWidgetState extends State<SpinkitWidget> {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.white : Colors.green,
          ),
        );
      },
    );
  }
}
