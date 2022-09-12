import 'package:flutter/material.dart';
import 'package:flutter_application_o2/models/Informations.dart';
import 'package:flutter_application_o2/providers/information_provider.dart';
import 'package:flutter_application_o2/screens/form_screen.dart';
import 'package:flutter_application_o2/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return InformationProvider();
        })
      ],
      child: MaterialApp(
        title: 'database',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const MyHomePage(title: 'Database App'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InformationProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: TabBarView(children: [HomeScreen(), FormScreen()]),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "Order",
            ),
            Tab(
              icon: Icon(Icons.add),
              text: "+",
            )
          ],
        ),
      ),
    );
  }
}
