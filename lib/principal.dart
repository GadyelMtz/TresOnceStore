import 'package:flutter/material.dart';
import 'package:u2_practica2/add.dart';
import 'package:u2_practica2/lista_iPhone.dart';
import 'package:u2_practica2/read.dart';
import 'package:u2_practica2/main.dart';
import 'package:u2_practica2/delete.dart';
import 'package:u2_practica2/update.dart';

Lista_iPhone l = Lista_iPhone();


class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

Widget pantalla = Center(
  child: Text(style: TextStyle(fontSize: 25), "Bienvenido"),
);


class _PrincipalState extends State<Principal> {
  Lista_iPhone l = Lista_iPhone();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TresOnce Store - Venta de iPhones"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Menú", style: TextStyle(fontSize: 30))],
              ),
            ),
            ListTile(
              title: Text("Create iPhone"),
              leading: Icon(Icons.add),
              onTap: () {
                setState(() {
                  l.load();
                  pantalla = Add();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text("Read iPhone"),
              leading: Icon(Icons.list),
              onTap: () {
                setState(() {
                  l.load();
                  pantalla = Read();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text("Update iPhone"),
              leading: Icon(Icons.edit),
              onTap: () {
                setState(() {
                  l.load();
                  pantalla = Update();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text("Delete iPhone"),
              leading: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  l.load();
                  pantalla = Delete();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text("Cerrar sesión"),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                setState(() {
                  TresOnceStore.updateFlag(context, false);
                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
      ),
      body: pantalla,
    );
  }
}
