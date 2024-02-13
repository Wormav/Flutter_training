class Activity {
  String name;
  String image;
  String? id;
  String city;
  double price;

  Activity(
      {required this.name,
      required this.city,
      this.id,
      required this.price,
      required this.image});
}
