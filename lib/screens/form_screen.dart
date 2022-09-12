import 'package:flutter/material.dart';
import 'package:flutter_application_o2/models/Informations.dart';
import 'package:flutter_application_o2/providers/information_provider.dart';
import 'package:flutter_application_o2/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final productController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField( 
                  decoration: new InputDecoration(labelText: "Product Name"),
                  autofocus: false,
                  controller: titleController,
                  validator: (String? str){
                      if(str!.isEmpty){
                          return "Please Enter";
                      }
                      return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Number of Product"),
                  keyboardType: TextInputType.number,
                  controller: productController,
                  validator: (String? str){
                    if(str!.isEmpty){
                          return "Please Enter product price";
                      }
                      if(double.parse(str)<=0){
                        return "Please Enter Greater Than 0";
                      }
                      return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "product price"),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  validator: (String? str){
                    if(str!.isEmpty){
                          return "Please Enter product price";
                      }
                      if(double.parse(str)<=0){
                        return "Please Enter Greater Than 0";
                      }
                      return null;
                  },
                ),
                FlatButton(
                  child: Text("Add Data"),
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: (){
                    if(formKey.currentState!.validate()){   
                      var title = titleController.text;
                      var product = productController.text;  
                      var price = priceController.text;  

                      Informations statement = Informations(
                        title:title,
                        product: double.parse(product),
                        price: double.parse(price),
                      );   

                      var provider = Provider.of<InformationProvider>(context,listen:false);
                      provider.addInformation(statement);
                      Navigator.push(context, MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context){
                        return HomeScreen();
                      }));
                    }
                  }, 
                  )
              ],
            ),
          ),
        ));
  }
}
