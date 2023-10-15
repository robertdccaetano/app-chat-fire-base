import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RefreshProgressIndicator(),
            // CircularProgressIndicator(
            //   color: Colors.white,
            // ),
            SizedBox(
              height: 10,
            ),
            Text('Carregando',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.bodyLarge?.color,
                )),
          ],
        ),
      ),
    );
  }
}
