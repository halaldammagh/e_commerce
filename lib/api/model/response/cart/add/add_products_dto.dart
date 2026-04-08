import 'package:json_annotation/json_annotation.dart';

part 'add_products_dto.g.dart';

@JsonSerializable()
class AddProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  AddProductsDto({this.count, this.id, this.product, this.price});

  factory AddProductsDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductsDtoToJson(this);
  }
}
