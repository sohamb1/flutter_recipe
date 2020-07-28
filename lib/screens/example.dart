import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: CurvePainterForNavigationBar(),
                  )),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  child: IconButton(
                      icon: Icon(
                    Icons.fastfood,
                    color: Colors.white,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainterForNavigationBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var diameter = 80;
    var startCurve = (size.width - diameter) / 2;
    var endCurve = startCurve + diameter;

    print(size.width);
    print(size.height);
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.92);
    path.lineTo(startCurve, size.height * 0.92);
    path.quadraticBezierTo(startCurve + 40, size.height * 0.92 + 60,
        endCurve, size.height * 0.92);
    path.lineTo(size.width, size.height * 0.92);
    path.lineTo(size.width, size.height);
    /*path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);*/
    canvas.drawShadow(path.shift(Offset(0, -5)), Colors.grey, 2.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
