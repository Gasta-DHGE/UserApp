import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({super.key});
  bool _sw = true;
  @override
  State<StatefulWidget> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Hello World"),
            MaterialButton(
              onPressed: () {},
              child: const Text("Hello World"),
            ),
            const Card(
              child: Text("Hello World"),
            ),
            Switch(
                value: widget._sw,
                onChanged: (value) {
                  setState(() {
                    widget._sw = value;
                  });
                })
          ],
        )),
      ),
    );
  }
}
