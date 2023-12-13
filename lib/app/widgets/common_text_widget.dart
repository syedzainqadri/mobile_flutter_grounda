import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextStyle? textTheme;
  final int? maxLines;


  const CommonTextWidget({
    super.key,
    required this.text,
    this.style,
    this.align,
    this.textTheme,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.labelLarge,
      textAlign: align ?? TextAlign.center,
      maxLines: maxLines,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}
