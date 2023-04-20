class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.people,
    required this.price,
    required this.stars,
    required this.description,
    required this.location,

});
  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
        name: json["name"],
        img: json["img"],
        people:json["people"],
        price: json["price"],
        stars: json["stars"],
        description: json["description"],
        location: json["location"]);
  }
}