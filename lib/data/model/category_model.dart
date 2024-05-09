// To parse this JSON data, do
//
//     final itemsCategoryModel = itemsCategoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:challenge_meli/domain/entities/items_category_entity.dart';

ItemsCategoryModel itemsCategoryModelFromJson(String str) => ItemsCategoryModel.fromJson(json.decode(str));


class ItemsCategoryModel extends ItemsCategoryEntity {


    ItemsCategoryModel({
        super.siteId,
        super.countryDefaultTimeZone,
        super.paging,
        super.results,
    });

    factory ItemsCategoryModel.fromJson(Map<String, dynamic> json) => ItemsCategoryModel(
        siteId: json["site_id"],
        countryDefaultTimeZone: json["country_default_time_zone"],
        paging: json["paging"] == null ? null : PagingModel.fromJson(json["paging"]),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => ResultModel.fromJson(x))),
    );

   
}

class PagingModel extends Paging{


    PagingModel({
        super.total,
        super.primaryResults,
        super.offset,
        super.limit,
    });

    factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        total: json["total"],
        primaryResults: json["primary_results"],
        offset: json["offset"],
        limit: json["limit"],
    );

   
}

class ResultModel extends Result {
 

    ResultModel({
        super.id,
        super.title,
        super.condition,
        super.thumbnailId,
        super.catalogProductId,
        super.listingTypeId,
        super.permalink,
        super.buyingMode,
        super.siteId,
        super.categoryId,
        super.domainId,
        super.thumbnail,
        super.currencyId,
        super.orderBackend,
        super.price,
        super.originalPrice,
        super.salePrice,
        super.availableQuantity,
        super.officialStoreId,
        super.useThumbnailId,
        super.acceptsMercadopago,
        super.shipping,
        super.stopTime,
        super.seller,
    });

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        title: json["title"],
        condition: json["condition"],
        thumbnailId: json["thumbnail_id"],
        catalogProductId: json["catalog_product_id"],
        listingTypeId: json["listing_type_id"],
        permalink: json["permalink"],
        buyingMode: json["buying_mode"],
        siteId: json["site_id"],
        categoryId: json["category_id"],
        domainId: json["domain_id"],
        thumbnail: json["thumbnail"],
        currencyId: json["currency_id"],
        orderBackend: json["order_backend"],
        price: json["price"],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        availableQuantity: json["available_quantity"],
        officialStoreId: json["official_store_id"],
        useThumbnailId: json["use_thumbnail_id"],
        acceptsMercadopago: json["accepts_mercadopago"],
        shipping: json["shipping"] == null ? null : ShippingModel.fromJson(json["shipping"]),
        stopTime: json["stop_time"] == null ? null : DateTime.parse(json["stop_time"]),
        seller: json["seller"] == null ? null : SellerModel.fromJson(json["seller"]),
    );

   
   
}

class SellerModel extends Seller {

    SellerModel({
        super.id,
        super.nickname,
    });

    factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        id: json["id"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
    };
}

class ShippingModel extends  Shipping{


    ShippingModel({
        super.storePickUp,
        super.freeShipping,
        super.logisticType,
        super.mode,
        super.tags,
        super.benefits,
        super.promise,
    });

    factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        storePickUp: json["store_pick_up"],
        freeShipping: json["free_shipping"],
        logisticType: json["logistic_type"],
        mode: json["mode"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        benefits: json["benefits"],
        promise: json["promise"],
    );

   
}
