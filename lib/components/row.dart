import 'package:flutter/material.dart';

class RowFn extends StatelessWidget {
  final String keys;
  final String values;

  const RowFn(this.keys, this.values, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            keys,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'Montserrat',
              letterSpacing: 0.5,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            values,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'Montserrat',
              letterSpacing: 0.5,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
