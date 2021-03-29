import 'dart:convert';

List<Articulos> articulosFromJson(String str) =>
    List<Articulos>.from(json.decode(str).map((x) => Articulos.fromJson(x)));

String articulosToJson(List<Articulos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Articulos {
  Articulos({
    this.name,
    this.oldprice,
    this.picture,
    this.price,
    this.shortDescription,
    this.id,
    this.sku,
    this.stockquantity,
  });

  String name;
  double oldprice;
  String picture;
  double price;
  String shortDescription;
  int id;
  String sku;
  int stockquantity;

  factory Articulos.fromJson(Map<String, dynamic> json) => Articulos(
        name: json["Name"],
        oldprice: json["Oldprice"].toDouble(),
        picture: json["Picture"],
        price: json["Price"].toDouble(),
        shortDescription: json["ShortDescription"],
        id: json["id"],
        sku: json["sku"],
        stockquantity: json["stockquantity"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Oldprice": oldprice,
        "Picture": picture,
        "Price": price,
        "ShortDescription": shortDescription,
        "id": id,
        "sku": sku,
        "stockquantity": stockquantity,
      };
}
