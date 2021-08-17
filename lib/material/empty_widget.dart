import 'package:flutter/material.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  _EmptyWidgetState createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(empty_message),
    );
  }
}
