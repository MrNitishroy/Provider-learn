import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/CounterProvider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    print("Re Build UI ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("COUNTER PAGE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CounterProvider>(builder: (context, value, child) {
                  print("Text Re Build");
                  return Text(
                    value.number.toString(),
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterProvider.decreaseValue();
                  },
                  child: Text("Decrease"),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    counterProvider.increaseValue();
                  },
                  child: Text("Increase"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
