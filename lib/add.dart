//ADD ORIGINAL

import 'package:flutter/material.dart';
import 'package:u2_practica2/iphone.dart';
import 'package:u2_practica2/principal.dart';

class Add extends StatefulWidget {
  const Add({Key? key});

  @override
  State<Add> createState() => _AddState();
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

class _AddState extends State<Add> {
  bool soportado = false;
  TextEditingController txtIMEI = TextEditingController();
  String txtModelo = Modelos.first.toString();
  TextEditingController txtBateria = TextEditingController();
  TextEditingController txtPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller: txtIMEI,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.numbers), label: Text("IMEI")),
                ),
                DropdownButtonFormField(
                    items: Modelos.map((e) {
                      return DropdownMenuItem(child: Text(e), value: e);
                    }).toList(),
                    onChanged: (item) {
                      setState(() {
                        txtModelo = item.toString();
                      });
                    },
                    value: txtModelo),
                TextField(
                  controller: txtBateria,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.battery_2_bar_sharp),
                      label: Text("Vida útil de batería")),
                ),
                TextField(
                  controller: txtPrecio,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.price_change_sharp),
                      label: Text("Precio")),
                ),
                CheckboxListTile(
                    value: soportado,
                    title: Text("¿Soporte?"),
                    onChanged: (data) {
                      setState(() {
                        soportado = data!;
                      });
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    iPhone i = iPhone(
                        imei: txtIMEI.text,
                        model: txtModelo,
                        battery: txtBateria.text,
                        price: txtPrecio.text,
                        supported: soportado.toString());
                    l.new_iPhone(i);
                    l.save();
                    l.load();
                    limpiar();
                    pantalla = Add();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("iPhone registrado"), duration: Duration(milliseconds: 1000),backgroundColor: Colors.green,));
                  },
                  child: Text("Add")),
              SizedBox(width: 45),
              ElevatedButton(
                  onPressed: () {
                    limpiar();
                  },
                  child: Text("Clean")),
            ],
          )
        ],
      ),
    );
  }

  void limpiar() {
    txtBateria.clear();
    txtIMEI.clear();
    txtPrecio.clear();
    setState(() {
      soportado = false;
      txtModelo = Modelos.first.toString();
    });
  }
}
