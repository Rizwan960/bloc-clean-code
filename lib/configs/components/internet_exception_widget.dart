import 'package:bloc_template/configs/extention/sizedbox_extention.dart';
import 'package:bloc_template/configs/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.of(context).size.height * 0.15).height,
        const Icon(
          Icons.cloud_off,
          size: 50,
          color: Colors.red,
        ),
        30.toDouble().height,
        const Center(
          child: Text(
            "We are unable to show results. \nPlease check your data\nConnection.",
            style: AppFonts.mediumBlack20,
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: widget.onPress,
            child: const Text(
              "RETRY",
              style: AppFonts.black14,
            ))
      ],
    );
  }
}
