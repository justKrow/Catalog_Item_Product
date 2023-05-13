class ProductDataModel {
  String? id;
  String? brandTitle;
  String? productName;
  String? imageUrl;

  ProductDataModel({this.id, this.brandTitle, this.productName, this.imageUrl});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandTitle = json['brandTitle'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
  }
}
