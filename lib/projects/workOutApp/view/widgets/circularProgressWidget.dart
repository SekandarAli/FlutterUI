// ignore_for_file: prefer_const_constructors, prefer_const_declarations, library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

// class CircleProgressBar extends StatefulWidget {
//
//   CircleProgressBar({Key? key,required this.totalTime}) : super(key: key);
//
//   int totalTime;
//
//   @override
//   _CircleProgressBarState createState() => _CircleProgressBarState();
// }
//
// class _CircleProgressBarState extends State<CircleProgressBar> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(width: 50),
//         SizedBox(
//           width: 170,
//           height: 170,
//           child: CustomPaint(
//             painter: CircleProgressBarPainter(
//               progress: _progress,
//               backgroundColor: Colors.pink.shade50,
//               progressColor: Colors.pink,
//             ),
//             child: Center(
//               child: Text(
//                 '$_currentSeconds',
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//         IconButton(onPressed: ()=> navigateToNewScreen(), icon: Icon(Icons.arrow_forward_ios))
//       ],
//     );
//   }
// }

class CircleProgressBarPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  CircleProgressBarPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressBarPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor;
  }
}
