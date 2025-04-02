import 'package:flutter/widgets.dart';

class OrientationView extends StatelessWidget {
  final Widget child;

  const OrientationView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: SafeArea(child: child),
            ),
          ),
        );
      },
    );
  }
}
