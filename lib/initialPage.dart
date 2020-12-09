import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'stores/controller.dart';
import 'taskPage.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var list = Get.find<ListController>().list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: Container(child: Obx(() {
        return ListView(
          children: list.map(
            (element) => ListTile(
              title: Text(element.name),
            ),
          ).toList(),
        );
      })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          exibirDialogo(context);
        },
      ),
    );
  }

  void exibirDialogo(context) {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicione uma categoria'),
          content: TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                hintText: 'Qual o nome da Categoria',
                labelText: 'Nome'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop('Cancel'),
            ),
            FlatButton(
                child: Text('Salvar'),
                onPressed: () {
                  list.add(Category(nameController.text));
                  nameController.text = "";
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
