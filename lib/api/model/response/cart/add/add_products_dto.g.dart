// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductsDto _$AddProductsDtoFromJson(Map<String, dynamic> json) =>
    AddProductsDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddProductsDtoToJson(AddProductsDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
