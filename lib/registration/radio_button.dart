/*
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:flutter/material.dart';

class Radio extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onChange;

  const Radio({
    Key? key,
    required this.selectedIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  State<Radio> createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  int x = 1;

  @override
  void initState() {
    x = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [

            Radio(
              value: 1,
              groupValue: x,
              onChanged: (value) {
                setState(() {
                  x = value!;
                  widget.onChange(value);
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppString.textPayusingVisaMasterCard,
              style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
            ),
          ],
        ),
      ],
    ));
  }
}
*/
