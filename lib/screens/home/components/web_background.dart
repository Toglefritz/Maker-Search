import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

/// A point class to represent each node in the web.
class Point {
  double x, y; // The x and y coordinates of the point
  double dx, dy; // The delta movement on each axis

  Point(this.x, this.y, this.dx, this.dy);

  /// Updates the position of the point and reverses direction upon edge collision.
  void update(Size size) {
    x += dx;
    y += dy;

    // Reverse direction if the point hits the boundary
    if (x < 0 || x > size.width) dx = -dx;
    if (y < 0 || y > size.height) dy = -dy;
  }
}

/// A widget that uses the [CustomPainter] to draw the background effect.
class WebBackground extends StatefulWidget {
  const WebBackground({super.key, required this.width, required this.height});

  /// The width of the background effect.
  final double width;

  /// The height of the background effect.
  final double height;

  @override
  WebBackgroundState createState() => WebBackgroundState();
}

class WebBackgroundState extends State<WebBackground> {
  final List<Point> points = [];
  final int numberOfPoints = 50;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numberOfPoints; i++) {
      points.add(
        Point(
          random.nextDouble() * widget.width,
          random.nextDouble() * widget.height,
          random.nextDouble() * 2 - 1,
          random.nextDouble() * 2 - 1,
        ),
      );
    }

    // Update the points' position over time to create the moving effect.
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        for (Point point in points) {
          point.update(MediaQuery.of(context).size);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WebPainter(points),
      child: Container(),
    );
  }
}

/// Custom painter class to draw the web-like effect using the points.
class WebPainter extends CustomPainter {
  final List<Point> points;

  WebPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    for (var point in points) {
      for (var otherPoint in points) {
        if (point != otherPoint) {
          if ((point.x - otherPoint.x).abs() < 100 && (point.y - otherPoint.y).abs() < 100) {
            canvas.drawLine(Offset(point.x, point.y), Offset(otherPoint.x, otherPoint.y), paint);
          }
        }
      }
    }

    for (var point in points) {
      canvas.drawCircle(Offset(point.x, point.y), 3.0, paint..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(WebPainter oldDelegate) => true;
}
