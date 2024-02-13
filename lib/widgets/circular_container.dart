import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircularContainer extends StatelessWidget {
  double? radius;
  Color? color;
  Widget? child;
  double? height;
  double? width;
  CircularContainer({
    this.radius,
    this.child,
    this.height,
    this.width,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: child,
    );
  }
}
