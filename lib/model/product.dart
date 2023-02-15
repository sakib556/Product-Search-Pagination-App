class ProductResponse {
  ProductResponse({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.categories,
    required this.products,
  });

  List<dynamic> categories;
  Products products;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        products: Products.fromMap(json["products"]),
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "products": products.toMap(),
      };
}

class Products {
  Products({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<Result> results;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.id,
    required this.brand,
    required this.image,
    required this.charge,
    required this.images,
    required this.slug,
    required this.productName,
    required this.model,
    required this.commissionType,
    required this.amount,
    required this.tag,
    required this.description,
    required this.note,
    required this.embaddedVideoLink,
    required this.maximumOrder,
    required this.stock,
    required this.isBackOrder,
    required this.specification,
    required this.warranty,
    required this.preOrder,
    required this.productReview,
    required this.isSeller,
    required this.isPhone,
    required this.willShowEmi,
    required this.badge,
    required this.isActive,
    required this.sackEquivalent,
    required this.createdAt,
    required this.updatedAt,
    required this.language,
    required this.seller,
    required this.combo,
    required this.createdBy,
    required this.updatedBy,
    required this.category,
    required this.relatedProduct,
    required this.filterValue,
    required this.distributors,
  });

  int id;
  Brand brand;
  String image;
  Charge charge;
  List<Image> images;
  String slug;
  String productName;
  String model;
  String commissionType;
  String amount;
  String tag;
  String description;
  String note;
  String embaddedVideoLink;
  int maximumOrder;
  int stock;
  bool isBackOrder;
  String specification;
  String warranty;
  bool preOrder;
  int productReview;
  bool isSeller;
  bool isPhone;
  bool willShowEmi;
  dynamic badge;
  bool isActive;
  String sackEquivalent;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic language;
  String seller;
  dynamic combo;
  String createdBy;
  dynamic updatedBy;
  List<int> category;
  List<dynamic> relatedProduct;
  List<dynamic> filterValue;
  List<dynamic> distributors;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        brand: Brand.fromMap(json["brand"]),
        image: json["image"],
        charge: Charge.fromMap(json["charge"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        slug: json["slug"],
        productName: json["product_name"],
        model: json["model"],
        commissionType: json["commission_type"],
        amount: json["amount"],
        tag: json["tag"],
        description: json["description"],
        note: json["note"],
        embaddedVideoLink: json["embadded_video_link"],
        maximumOrder: json["maximum_order"],
        stock: json["stock"],
        isBackOrder: json["is_back_order"],
        specification: json["specification"],
        warranty: json["warranty"],
        preOrder: json["pre_order"],
        productReview: json["product_review"],
        isSeller: json["is_seller"],
        isPhone: json["is_phone"],
        willShowEmi: json["will_show_emi"],
        badge: json["badge"],
        isActive: json["is_active"],
        sackEquivalent: json["sack_equivalent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        language: json["language"],
        seller: json["seller"],
        combo: json["combo"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        category: List<int>.from(json["category"].map((x) => x)),
        relatedProduct:
            List<dynamic>.from(json["related_product"].map((x) => x)),
        filterValue: List<dynamic>.from(json["filter_value"].map((x) => x)),
        distributors: List<dynamic>.from(json["distributors"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand.toMap(),
        "image": image,
        "charge": charge.toMap(),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "slug": slug,
        "product_name": productName,
        "model": model,
        "commission_type": commissionType,
        "amount": amount,
        "tag": tag,
        "description": description,
        "note": note,
        "embadded_video_link": embaddedVideoLink,
        "maximum_order": maximumOrder,
        "stock": stock,
        "is_back_order": isBackOrder,
        "specification": specification,
        "warranty": warranty,
        "pre_order": preOrder,
        "product_review": productReview,
        "is_seller": isSeller,
        "is_phone": isPhone,
        "will_show_emi": willShowEmi,
        "badge": badge,
        "is_active": isActive,
        "sack_equivalent": sackEquivalent,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "language": language,
        "seller": seller,
        "combo": combo,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "category": List<dynamic>.from(category.map((x) => x)),
        "related_product": List<dynamic>.from(relatedProduct.map((x) => x)),
        "filter_value": List<dynamic>.from(filterValue.map((x) => x)),
        "distributors": List<dynamic>.from(distributors.map((x) => x)),
      };
}

class Brand {
  Brand({
    required this.name,
    required this.image,
    required this.headerImage,
    required this.slug,
  });

  String name;
  String image;
  dynamic headerImage;
  String slug;

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        name: json["name"],
        image: json["image"],
        headerImage: json["header_image"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "header_image": headerImage,
        "slug": slug,
      };
}

class Charge {
  Charge({
    required this.bookingPrice,
    required this.currentCharge,
    required this.discountCharge,
    required this.sellingPrice,
    required this.profit,
    required this.isEvent,
    required this.eventId,
    required this.highlight,
    required this.highlightId,
    required this.groupping,
    required this.grouppingId,
    required this.campaignSectionId,
    required this.campaignSection,
    required this.message,
  });

  double bookingPrice;
  double currentCharge;
  dynamic discountCharge;
  double sellingPrice;
  double profit; //
  bool isEvent;
  dynamic eventId;
  bool highlight;
  dynamic highlightId;
  bool groupping;
  dynamic grouppingId;
  dynamic campaignSectionId;
  bool campaignSection;
  dynamic message;

  factory Charge.fromMap(Map<String, dynamic> json) => Charge(
        bookingPrice: json["booking_price"],
        currentCharge: json["current_charge"],
        discountCharge: json["discount_charge"],
        sellingPrice: json["selling_price"],
        profit: json["profit"],
        isEvent: json["is_event"],
        eventId: json["event_id"],
        highlight: json["highlight"],
        highlightId: json["highlight_id"],
        groupping: json["groupping"],
        grouppingId: json["groupping_id"],
        campaignSectionId: json["campaign_section_id"],
        campaignSection: json["campaign_section"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "booking_price": bookingPrice,
        "current_charge": currentCharge,
        "discount_charge": discountCharge,
        "selling_price": sellingPrice,
        "profit": profit,
        "is_event": isEvent,
        "event_id": eventId,
        "highlight": highlight,
        "highlight_id": highlightId,
        "groupping": groupping,
        "groupping_id": grouppingId,
        "campaign_section_id": campaignSectionId,
        "campaign_section": campaignSection,
        "message": message,
      };
}

class Image {
  Image({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });

  int id;
  String image;
  bool isPrimary;
  int product;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        isPrimary: json["is_primary"],
        product: json["product"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "is_primary": isPrimary,
        "product": product,
      };
}
