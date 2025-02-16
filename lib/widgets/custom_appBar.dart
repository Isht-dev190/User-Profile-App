import 'dart:ui';

import 'package:flutter/material.dart';

class custom_appBar extends OutlinedBorder {
 
  const custom_appBar({super.side});

  Path _getPath(Rect rect) {
      final Path path = Path();
      final Size size = Size(rect.width, rect.height * 5);

    final double p0 = size.height * 0.7;
    path.lineTo(0.0, p0);

    // First curve
    final Offset controlPoint1 = Offset(size.width * 0.3, size.height * 0.4);
    final Offset peakPoint1 = Offset(size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, peakPoint1.dx, peakPoint1.dy);

    // Second Curve
    final Offset controlPoint2 = Offset(size.width *0.7, size.height * 0.65);
    final Offset endPoint = Offset(size.width, size.height *0.7);
    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }

    final Gradient gradient = LinearGradient(colors: [
      Color(0xFFFCBF49), // 33%
      Color(0xFFF77F00), // 73%
      Color(0xFFDC7100),],
      stops: [0.50, 0.73, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    );

    final Paint paint  = Paint()..shader = gradient.createShader(rect);
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return custom_appBar(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return custom_appBar(side: side ?? this.side);
  }

  
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is custom_appBar) {
      return custom_appBar(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  
  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is custom_appBar) {
      return custom_appBar(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}