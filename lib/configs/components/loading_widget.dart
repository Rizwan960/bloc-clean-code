import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  final Color color;
  const LoadingWidget({super.key, this.size = 60, this.color = Colors.black});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: widget.color,
      ),
    );
  }
}
