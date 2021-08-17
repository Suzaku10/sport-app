import 'package:flutter/material.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';

class SomethingErrorWidget extends StatefulWidget {
  const SomethingErrorWidget({Key? key}) : super(key: key);

  @override
  _SomethingErrorWidgetState createState() => _SomethingErrorWidgetState();
}

class _SomethingErrorWidgetState extends State<SomethingErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(something_error_message),
    );
  }
}
