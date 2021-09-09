import 'package:basket/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget buildElevatedButton({
  required String label,
  required Function function,
  context,
  double height = 50.0,
  double width = double.infinity,
  bool isUpperCase = true,
  Color color = defaultColor,
}) =>
    SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(isUpperCase ? label.toUpperCase() : label),
        style: ElevatedButton.styleFrom(
            primary: color,
            textStyle: Theme.of(context).textTheme.headline5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );

Widget buildTextButton({
  required Function function,
  required String label,
  required context,
  Color? color,
}) =>
    TextButton(
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: color ?? defaultColor,
            ),
      ),
      onPressed: () => function(),
    );
