import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_o2/models/Informations.dart';
import 'package:flutter_application_o2/providers/information_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InformationProvider>(context,listen: false).initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("database"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, InformationProvider provider, Widget? child) {
            var count = provider.informations.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "No Information Found",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: provider.informations.length,
                  itemBuilder: (context, int index) {
                    Informations data = provider.informations[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: FittedBox(
                            child: Text(data.price.toString()),
                          ),
                        ),
                        title: Text(data.title),
                        subtitle: Text(data.product.toString()),
                      ),
                    );
                  });
            }
          },
        ));
  }
}