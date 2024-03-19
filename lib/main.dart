import 'package:flutter/material.dart';
import 'package:u2_practica2/principal.dart';

void main() {
  runApp(const TresOnceStore());
}

class TresOnceStore extends StatefulWidget {
  const TresOnceStore({Key? key}) : super(key: key);

  @override
  State<TresOnceStore> createState() => _TresOnceStoreState();

  static void updateFlag(BuildContext context, bool newValue) {
    final _TresOnceStoreState? state =
    context.findAncestorStateOfType<_TresOnceStoreState>();
    state?.updateFlag(newValue);
  }

}





class _TresOnceStoreState extends State<TresOnceStore> {
  bool flag = false;
  void updateFlag(bool newValue) {
    setState(() {
      flag = newValue;
    });
  }

  String titulo = "Inicio de sesión";
  String usr = "GadyelMtz";
  String pwd = "20400775";
  TextEditingController txtUsr = TextEditingController();
  TextEditingController txtPwd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titulo,
      home: Builder(
        builder: (BuildContext context) {
          if (flag == false) {
            return miApp(context);
          } else {
            return Principal();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget miApp(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulo,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: layout(context),
    );
  }

  Widget layout(context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/apple.png", height: 220),
          TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.account_box), labelText: "User"),
            controller: txtUsr,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.password),
              labelText: "Password",
            ),
            controller: txtPwd,
          ),
          SizedBox(height: 50),
          IconButton(
              tooltip: "Iniciar Sesión",
              onPressed: () {
                setState(() {
                  if (txtUsr.text == usr && txtPwd.text == pwd) {
                    titulo = "TresOnce - Tienda de iPhones";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Bienvenido GadyelMtz"),
                      duration: Duration(milliseconds: 1000),
                    ));
                    flag = true;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text("Contraseña y/o Usuario incorrectos"),
                      duration: Duration(milliseconds: 800),
                    ));
                  }
                });
              },
              icon: Icon(Icons.door_back_door_outlined))
        ],
      ),
    ));
  }
}
