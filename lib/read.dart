//READ ORIGINAL
import 'package:flutter/material.dart';
import 'package:u2_practica2/principal.dart';
class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    l.load();
    if(l.data.isEmpty){
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Oops... parece que no han cargado los registros"),
              FilledButton(onPressed: (){
                setState(() {
                  pantalla = Read();
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
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(child: Text("$index")),
                      title: Text("IMEI: ${datos[0]} \nModelo: ${datos[1]} \nBateria: ${datos[2]} \nPrecio: ${datos[3]} \nSoporte: ${datos[4]}"),
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
