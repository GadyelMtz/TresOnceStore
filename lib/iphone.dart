class iPhone{
  String imei;
  String model;
  String battery;
  String price;
  String supported;

  iPhone({
    required this.imei,
    required this.model,
    required this.battery,
    required this.price,
    required this.supported
  });

  String toString(){
    return "$imei%$model%$battery%$price%$supported";
  }
}