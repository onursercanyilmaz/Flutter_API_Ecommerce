import 'package:flutter/material.dart';

class StatefulTextWidget extends StatefulWidget {
  StatefulTextWidget( this.myValue, {Key? key, }) : super(key: key);
  num myValue;

  @override
  State<StatefulWidget> createState() {
    return _StatefulTextWidgetState();
  }
}

class _StatefulTextWidgetState extends State<StatefulTextWidget> {
  late num localValue;

  @override
  initState() {
    localValue = widget.myValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(localValue.toString());
  }
}
