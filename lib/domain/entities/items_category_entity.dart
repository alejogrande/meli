class ItemsCategoryEntity {
    String? siteId;
    String? countryDefaultTimeZone;
    Paging? paging;
    List<Result>? results;

    ItemsCategoryEntity({
        this.siteId,
        this.countryDefaultTimeZone,
        this.paging,
        this.results,
    });

}

class Paging {
    int? total;
    int? primaryResults;
    int? offset;
    int? limit;

    Paging({
        this.total,
        this.primaryResults,
        this.offset,
        this.limit,
    });

}

class Result {
    String? id;
    String? title;
    String? condition;
    String? thumbnailId;
    String? catalogProductId;
    String? listingTypeId;
    String? permalink;
    String? buyingMode;
    String? siteId;
    String? categoryId;
    String? domainId;
    String? thumbnail;
    String? currencyId;
    int? orderBackend;
    int? price;
    int? originalPrice;
    dynamic salePrice;
    int? availableQuantity;
    dynamic officialStoreId;
    bool? useThumbnailId;
    bool? acceptsMercadopago;
    Shipping? shipping;
    DateTime? stopTime;
    Seller? seller;

    Result({
        this.id,
        this.title,
        this.condition,
        this.thumbnailId,
        this.catalogProductId,
        this.listingTypeId,
        this.permalink,
        this.buyingMode,
        this.siteId,
        this.categoryId,
        this.domainId,
        this.thumbnail,
        this.currencyId,
        this.orderBackend,
        this.price,
        this.originalPrice,
        this.salePrice,
        this.availableQuantity,
        this.officialStoreId,
        this.useThumbnailId,
        this.acceptsMercadopago,
        this.shipping,
        this.stopTime,
        this.seller,
    });

}

class Seller {
    int? id;
    String? nickname;

    Seller({
        this.id,
        this.nickname,
    });

}

class Shipping {
    bool? storePickUp;
    bool? freeShipping;
    String? logisticType;
    String? mode;
    List<String>? tags;
    dynamic benefits;
    dynamic promise;

    Shipping({
        this.storePickUp,
        this.freeShipping,
        this.logisticType,
        this.mode,
        this.tags,
        this.benefits,
        this.promise,
    });

}
