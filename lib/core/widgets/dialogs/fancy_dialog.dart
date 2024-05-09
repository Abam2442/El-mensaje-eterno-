import 'package:flutter/material.dart';

class FancyDialog extends StatelessWidget {
  final Widget? child;
  final IconData? icon;
  final double? height;
  final double? width;
  final double iconSize;
  final Color? iconColor;
  const FancyDialog({
    Key? key,
    @required this.child,
    @required this.icon,
    this.iconSize = 32.0,
    this.width = 250.0,
    this.height = 330.0,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: SizedBox(
        height: height! + (iconSize),
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      top: iconSize + 25.0,
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: child),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: iconSize * 2.3,
                width: iconSize * 2.3,
                decoration: BoxDecoration(
                    color: iconColor ?? const Color.fromARGB(255, 100, 229, 53),
                    border: Border.all(color: Colors.white, width: 5.0),
                    borderRadius: BorderRadius.circular((iconSize * 2.3) / 2)),
                child: Center(
                    child: Icon(
                  icon,
                  color: Colors.white,
                  size: iconSize,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
