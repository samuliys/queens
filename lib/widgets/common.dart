import 'package:flutter/material.dart';
import 'package:queens/config/constants.dart';

class GameText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign align;

  const GameText(
    this.text, {
    super.key,
    this.size = FontSize.title,
    this.color = Colors.black,
    this.align = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontWeight: size == FontSize.title
            ? FontWeight.bold
            : FontWeight.normal,
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool primary;
  final double minWidth;
  final Color color;
  const GameButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.primary = false,
    this.minWidth = 200,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    if (primary) {
      return SizedBox(
        width: minWidth,
        child: FilledButton(
          onPressed: () => onPressed(),
          child: GameText(text, size: FontSize.button, color: Colors.white),
        ),
      );
    }
    return SizedBox(
      width: minWidth,
      child: OutlinedButton(
        onPressed: () => onPressed(),
        child: GameText(text, size: FontSize.button, color: color),
      ),
    );
  }
}

class GameActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final double minWidth;
  final Color color;
  final Color buttonColor;
  const GameActionButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.minWidth = 150,
    this.color = Colors.white,
    this.buttonColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth,
      child: FloatingActionButton.extended(
        onPressed: () => onPressed(),
        icon: Icon(icon, color: color),
        label: GameText(text, size: FontSize.button, color: color),
        elevation: 0,
        focusElevation: 0,
        backgroundColor: buttonColor,
      ),
    );
  }
}

class GameScaffold extends StatelessWidget {
  final Widget child;
  const GameScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(Spacing.large),
          width: Breakpoints.lg,
          child: child,
        ),
      ),
    );
  }
}
