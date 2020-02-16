import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'v1.0.0\n',
            style: Theme.of(context).textTheme.display2,
            children: [
              TextSpan(
                text:
                    'Developed with \u2764️ by\nAzerbaijan Flutter Users Community\n',
              ),
              TextSpan(
                text: 'Developer: Kanan Yusubov',
              ),
            ],
          ),
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
