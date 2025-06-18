import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 =
        Paint()
          ..color = const Color.fromARGB(255, 195, 227, 212)
          ..style = PaintingStyle.fill
          ..strokeWidth = size.width * 0.00
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0008333, size.height * 0.5014286);
    path_0.quadraticBezierTo(
      size.width * 0.3865000,
      size.height * 0.2588286,
      size.width * 0.5191667,
      size.height * 0.3814286,
    );
    path_0.cubicTo(
      size.width * 0.5507917,
      size.height * 0.4055000,
      size.width * 0.6087250,
      size.height * 0.5100286,
      size.width * 0.5990000,
      size.height * 0.5577143,
    );
    path_0.cubicTo(
      size.width * 0.5937917,
      size.height * 0.6077143,
      size.width * 0.5865250,
      size.height * 0.6787714,
      size.width * 0.5795000,
      size.height * 0.7348571,
    );
    path_0.cubicTo(
      size.width * 0.5608417,
      size.height * 0.7917286,
      size.width * 0.5475000,
      size.height * 0.8596429,
      size.width * 0.5341667,
      size.height * 0.8928571,
    );
    path_0.quadraticBezierTo(
      size.width * 0.5209167,
      size.height * 0.9242143,
      size.width * 0.5291667,
      size.height,
    );
    path_0.lineTo(size.width * -0.0008333, size.height);
    path_0.lineTo(size.width * -0.0008333, size.height * 0.5014286);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
