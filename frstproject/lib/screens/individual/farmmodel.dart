class FarmModel {
  final int farmid;
  final String imageUrl;
  final String title;
  final String city;
  final String review;
  final String description;
  final int price;
  final int available;
  int qty = 1;
  bool isSelected = false;

  FarmModel(this.farmid, this.imageUrl, this.title, this.city, this.review,
      this.description, this.price, this.qty, this.available, this.isSelected);
}

List<FarmModel> farmModel = [
  FarmModel(1, "assets/images/farm1.jpg", "Farm1", "City-1", "Review-1",
      "Description-1", 500, 100, 200, false),

  FarmModel(2, "assets/images/farm2.jpg", "Farm2", "City-2", "Review-2",
      "Description-2", 100, 10, 100, false),

  FarmModel(3, "assets/images/farm3.jpg", "Farm1", "City-1", "Review-1",
      "Description-1", 500, 100, 200, false),
];
