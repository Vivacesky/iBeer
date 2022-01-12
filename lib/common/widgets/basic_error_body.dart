import 'package:flutter/widgets.dart';

class BasicErrorBody extends StatelessWidget {
  final Object object;

  const BasicErrorBody({Key? key, required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        object.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
