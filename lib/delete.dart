import 'package:flutter/material.dart';
import 'package:u2_practica2/principal.dart';
class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}


class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    l.load();
    l.save();
    if(l.data.isEmpty){
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Oops... parece que no han cargado los registros"),
              FilledButton(onPressed: (){
                setState(() {
                  pantalla = Delete();
                });
              }, child: Text("Recargar la página"))
            ],
          ),
        ),
      );
    }
    else
    return Scaffold(
      body: ListView.builder(
        itemCount: l.data.length,
        itemBuilder: (context, index) {
          List<String> datos = l.data.elementAt(index).toString().split("%");
          return Column(
            children: [
              Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("$index")),
                    title: Text("IMEI: ${datos[0]} \nModelo: ${datos[1]} \nBateria: ${datos[2]} \nPrecio: ${datos[3]} \nSoporte: ${datos[4]}"),
                    trailing: IconButton(onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("Eliminar iPhone $index", textAlign: TextAlign.center),
                              content:
                              SizedBox(
                                width: 450,
                                height: 200,
                                child: ListView(
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("¿Estás seguro que quieres eliminar este iPhone?", textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
                                          SizedBox(height: 50,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FilledButton(onPressed: (){
                                                l.delete_iPhone(index);
                                                l.save();
                                                l.load();
                                                Navigator.pop(context);
                                                setState(() {
                                                  pantalla = Delete();
                                                });
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("iPhone eliminado correctamente"), duration: Duration(milliseconds: 1000),backgroundColor: Colors.green,));
                                              }, child: Text("Eliminar"),
                                              style: FilledButton.styleFrom(backgroundColor: Colors.red)),
                                              SizedBox(width: 30,),
                                              FilledButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: Text("Cancelar"),
                                              style: FilledButton.styleFrom(backgroundColor: Colors.green)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                        icon: Icon(Icons.delete) ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
