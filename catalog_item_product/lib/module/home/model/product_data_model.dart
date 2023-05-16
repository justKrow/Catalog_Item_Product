// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ProductDataModel extends Equatable {
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'brandTitle': brandTitle,
        'productName': productName,
        'imageUrl': imageUrl
      };

  @override
  List<Object?> get props => [id, brandTitle, productName, imageUrl];
}
