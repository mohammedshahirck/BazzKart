import 'package:flutter/material.dart';

class OrSepration extends StatelessWidget {
  const OrSepration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width) / 2 - 40,
          child: const Divider(),
        ),
        const Text('Or'),
        SizedBox(
          width: (MediaQuery.of(context).size.width) / 2 - 40,
          child: const Divider(),
        ),
      ],
    );
  }
}
