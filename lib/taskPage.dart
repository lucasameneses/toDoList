import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/stores/controller.dart';
import 'main.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var list = Get.find<ListController>().list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(0.9, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              child: Card(
                child: ListTile(
                  title: Text(list[index].name),
                ),
              ),
              //Função para excluir Equipamento
              onDismissed: (direction) {
                list.remove(list[index]);
              },
            );
          },
        ),
      ),
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
                  setState(() {
                    list.add(new Category(nameController.text));
                    nameController.text = "";
                    Navigator.of(context).pop();
                  });
                })
          ],
        );
      },
    );
  }
}
