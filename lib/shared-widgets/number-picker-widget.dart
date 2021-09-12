import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  final int min;
  final int max;
  final int step;
  final String title;
  final onChangeFn;

  const CustomNumberPicker(
      {Key key, this.min, this.max, this.step, this.title, this.onChangeFn})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomNumberPickerState();
  }
}

class CustomNumberPickerState extends State<CustomNumberPicker> {
  int currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        NumberPicker(
          value: currentValue,
          minValue: widget.min,
          maxValue: widget.max,
          selectedTextStyle: TextStyle(color: Color.fromRGBO(225, 0, 117, 1), fontWeight: FontWeight.bold, fontSize: 26),
          step: widget.step,
          itemHeight: 100,
          textStyle: TextStyle(color: Colors.grey[700]),
          axis: Axis.horizontal,
          onChanged: (value) {
            widget.onChangeFn(value);
            setState(() {
              currentValue = value;
            });
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = currentValue - widget.step;
                if (newValue >= widget.min) {
                  currentValue = newValue;
                  // widget.onChangeFn(newValue);
                }
              }),
            ),
            Text('${widget.title}: $currentValue'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = currentValue + widget.step;
                if (newValue <= widget.max) {
                  currentValue = newValue;
                  // widget.onChangeFn(newValue);
                }
              }),
            ),
          ],
        ),
      ],
    );
  }
}
