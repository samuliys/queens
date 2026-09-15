import 'package:flutter/material.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/config/constants.dart';

class Statistic extends StatelessWidget {
  final String label;
  final String value;

  const Statistic(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double titleSize = width < Breakpoints.sb ? FontSize.button : FontSize.subtitle;
    double subtitleSize = width < Breakpoints.sb ? FontSize.body : FontSize.button;
    return Card(
      child: Center(
        child: ListTile(
          title: GameText(value, size: titleSize),
          subtitle: GameText(label.toUpperCase(), size: subtitleSize),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
