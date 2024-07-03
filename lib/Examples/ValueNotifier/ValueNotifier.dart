import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/CounterProvider.dart';

class ValueNotifierPage extends StatelessWidget {
  const ValueNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            ValueListenableBuilder(
              valueListenable: isSelected,
              builder: (context, value, child) {
                return IconButton(
                  onPressed: () {
                    isSelected.value = !isSelected.value;
                  },
                  icon: Icon(
                    Icons.heart_broken,
                    size: 80,
                    color: isSelected.value ? Colors.deepPurple : Colors.black,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
