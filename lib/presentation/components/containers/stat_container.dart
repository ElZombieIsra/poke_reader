import 'package:flutter/material.dart';

class StatContainer extends StatelessWidget {
  final String text;
  final String value;
  final double size;

  const StatContainer({
    Key key,
    @required this.text,
    this.value,
    this.size,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text),
          if (value != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(value),
            ),
        ],
      ),
    );
  }
}
