import 'package:shared_preferences/shared_preferences.dart';
import 'iphone.dart';

class Lista_iPhone {
  List<iPhone> data = [];

  iPhone toIphone(String cod) {
    List res = cod.split("%");
    iPhone i = iPhone(
        imei: res[0],
        model: res[1],
        battery: res[2],
        price: res[3],
        supported: res[4]);
    return i;
  }

  int count(){
    return data.length;
  }

  Future<bool> save() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    List<String> buffer = [];
    data.forEach((element) {
      buffer.add(element.toString());
    });
    storage.setStringList("buffer", buffer);
    return true;
  }

  Future<bool> load() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    List<String> buffer = [];
    buffer = storage.getStringList("buffer") ?? [];
    data.clear();
    buffer.forEach((element) {
      data.add(toIphone(element));
    });
    return true;
  }

  Future<bool> deleteStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.remove("buffer");
    return true;
  }

  void new_iPhone(iPhone i) {
    data.add(i);
  }

  void update_iPhone(int pos, iPhone i) {
    data[pos] = i;
  }

  void delete_iPhone(int pos) {
    data.removeAt(pos);
  }
}
