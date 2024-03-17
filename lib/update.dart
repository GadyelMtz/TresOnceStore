import 'package:flutter/material.dart';
import 'package:u2_practica2/principal.dart';
import 'package:u2_practica2/iphone.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

List Modelos = [
  "iPhone 7",
  "iPhone 7 Plus",
  "iPhone 8",
  "iPhone 8 Plus",
  "iPhone XR",
  "iPhone X",
  "iPhone XS",
  "iPhone XS Max",
  "iPhone SE 2020",
  "iPhone 11",
  "iPhone 11 Pro",
  "iPhone 11 Pro Max",
  "iPhone 12 Mini",
  "iPhone 12",
  "iPhone 12 Pro",
  "iPhone 12 Pro Max",
  "iPhone SE 2023",
  "iPhone 13",
  "iPhone 13 Mini",
  "iPhone 13 Pro",
  "iPhone 13 Pro Max",
  "iPhone 14",
  "iPhone 14 Plus",
  "iPhone 14 Pro",
  "iPhone 14 Pro Max",
  "iPhone 15",
  "iPhone 15 Plus",
  "iPhone 15 Pro",
  "iPhone 15 Pro max",
];

class _UpdateState extends State<Update> {
  bool soportado = false;
  TextEditingController txtIMEI = TextEditingController();
  String txtModelo = Modelos.first.toString();
  TextEditingController txtBateria = TextEditingController();
  TextEditingController txtPrecio = TextEditingController();

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
                  pantalla = Update();
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
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("$index")),
                    title: Text(
                        "IMEI: ${datos[0]} \nModelo: ${datos[1]} \nBateria: ${datos[2]} \nPrecio: ${datos[3]} \nSoporte: ${datos[4]}"),
                    trailing: IconButton(
                      onPressed: () {
                        txtIMEI.text = datos[0];
                        txtModelo = datos[1];
                        txtBateria.text = datos[2];
                        txtPrecio.text = datos[3];
                        setState(() {
                          soportado = datos[4] == "true" ? true : false;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Editar iPhone $index",
                                  textAlign: TextAlign.center),
                              content: SizedBox(
                                width: 450,
                                height: 450,
                                child: ListView(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        TextField(
                                          controller: txtIMEI,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.numbers),
                                            label: Text("IMEI"),
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          items: Modelos.map((e) {
                                            return DropdownMenuItem(
                                                child: Text(e), value: e);
                                          }).toList(),
                                          onChanged: (item) {
                                            setState(() {
                                              txtModelo = item.toString();
                                            });
                                          },
                                          value: txtModelo,
                                        ),
                                        TextField(
                                          controller: txtBateria,
                                          decoration: InputDecoration(
                                            suffixIcon:
                                                Icon(Icons.battery_2_bar_sharp),
                                            label: Text("Vida útil de batería"),
                                          ),
                                        ),
                                        TextField(
                                          controller: txtPrecio,
                                          decoration: InputDecoration(
                                            suffixIcon:
                                                Icon(Icons.price_change_sharp),
                                            label: Text("Precio"),
                                          ),
                                        ),
                                        CheckboxListTile(
                                          value: soportado,
                                          title: Text("¿Soporte?"),
                                          onChanged: (data) {
                                            setState(() {
                                              soportado = data!;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FilledButton(
                                              onPressed: () {
                                                iPhone i = iPhone(
                                                    imei: txtIMEI.text,
                                                    model: txtModelo.toString(),
                                                    battery: txtBateria.text,
                                                    price: txtPrecio.text,
                                                    supported:
                                                        soportado.toString());
                                                l.update_iPhone(index, i);
                                                l.save();
                                                l.load();
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("iPhone actualizado correctamente"), duration: Duration(milliseconds: 1000),backgroundColor: Colors.green,));
                                                setState(() {
                                                  pantalla = Update();
                                                });
                                                },
                                              child: Text("Editar"),
                                              style: FilledButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.red),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            FilledButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancelar"),
                                              style: FilledButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.green),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
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
