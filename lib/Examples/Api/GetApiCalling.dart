import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/ApiProvider.dart';

class ApiCalling extends StatelessWidget {
  const ApiCalling({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("GET API"),
        ),
        body: Consumer<ApiProvider>(
          builder: (context, value, _) => GridView.builder(
            itemCount: value.products.length,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.network(
                        value.products[index].image!,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              value.products[index].title!,
                              maxLines: 1,
                            ),
                            Text(
                              value.products[index].price.toString() ?? "Free",
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
