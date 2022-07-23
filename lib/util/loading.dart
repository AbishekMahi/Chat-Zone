import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF262525),
      child: const Center(
        child: SpinKitCircle(
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
