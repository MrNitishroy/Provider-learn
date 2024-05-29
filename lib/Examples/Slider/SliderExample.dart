import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/SliderProvider.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    SliderProvider sliderProvider =
        Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("SLIDER EXAMPLE"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Slider(
                value: value.sliderValue,
                onChanged: (value) {
                  sliderProvider.sliderValueChange(value);
                },
                min: 0,
                max: 100,
              );
            }),
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Text(
                "Slider Value : ${value.sliderValue}",
                style: TextStyle(
                  fontSize: 30,
                ),
              );
            }),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
