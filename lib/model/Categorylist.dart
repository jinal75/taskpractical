// To parse this JSON data, do
//
//     final categorylist = categorylistFromJson(jsonString);

import 'dart:convert';

Categorylist categorylistFromJson(String str) => Categorylist.fromJson(json.decode(str));

String categorylistToJson(Categorylist data) => json.encode(data.toJson());

class Categorylist {
  int code;
  List<Category> categories;
  List<dynamic> pages;
  Settings settings;

  Categorylist({
    required this.code,
    required this.categories,
    required this.pages,
    required this.settings,
  });

  factory Categorylist.fromJson(Map<String, dynamic> json) => Categorylist(
    code: json["code"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    pages: List<dynamic>.from(json["pages"].map((x) => x)),
    settings: Settings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "pages": List<dynamic>.from(pages.map((x) => x)),
    "settings": settings.toJson(),
  };
}

class Category {
  int id;
  int? parentId;
  String slug;
  String image;
  String bannerImage;
  int star;
  int sortOrder;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Category> children;
  List<CategoryTranslation> categoryTranslations;

  Category({
    required this.id,
    this.parentId,
    required this.slug,
    required this.image,
    required this.bannerImage,
    required this.star,
    required this.sortOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.children,
    required this.categoryTranslations,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    slug: json["slug"],
    image: json["image"],
    bannerImage: json["banner_image"],
    star: json["star"],
    sortOrder: json["sort_order"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    children: List<Category>.from(json["children"].map((x) => Category.fromJson(x))),
    categoryTranslations: List<CategoryTranslation>.from(json["category_translations"].map((x) => CategoryTranslation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "slug": slug,
    "image": image,
    "banner_image": bannerImage,
    "star": star,
    "sort_order": sortOrder,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
    "category_translations": List<dynamic>.from(categoryTranslations.map((x) => x.toJson())),
  };
}

class CategoryTranslation {
  int id;
  int categoryId;
  Locale locale;
  String name;
  dynamic description;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;

  CategoryTranslation({
    required this.id,
    required this.categoryId,
    required this.locale,
    required this.name,
    this.description,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
  });

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) => CategoryTranslation(
    id: json["id"],
    categoryId: json["category_id"],
    locale: localeValues.map[json["locale"]]!,
    name: json["name"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "locale": localeValues.reverse[locale],
    "name": name,
    "description": description,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
  };
}

enum Locale { EN }

final localeValues = EnumValues({
  "EN": Locale.EN
});

class Settings {
  String siteName;
  String siteEmail;
  String sitePhone;
  String address;
  String countryId;
  String stateId;
  String cityId;
  String zipcode;
  String favicon;
  String logo;
  String authLogo;
  String siteTagLine;
  String metaTitle;
  String metaDescription;
  City city;

  Settings({
    required this.siteName,
    required this.siteEmail,
    required this.sitePhone,
    required this.address,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.zipcode,
    required this.favicon,
    required this.logo,
    required this.authLogo,
    required this.siteTagLine,
    required this.metaTitle,
    required this.metaDescription,
    required this.city,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    siteName: json["site_name"],
    siteEmail: json["site_email"],
    sitePhone: json["site_phone"],
    address: json["address"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    zipcode: json["zipcode"],
    favicon: json["favicon"],
    logo: json["logo"],
    authLogo: json["auth_logo"],
    siteTagLine: json["site_tag_line"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "site_name": siteName,
    "site_email": siteEmail,
    "site_phone": sitePhone,
    "address": address,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "zipcode": zipcode,
    "favicon": favicon,
    "logo": logo,
    "auth_logo": authLogo,
    "site_tag_line": siteTagLine,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "city": city.toJson(),
  };
}

class City {
  int id;
  String name;
  int? stateId;
  dynamic sortOrder;
  int status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  City? state;
  int? countryId;
  Country? country;

  City({
    required this.id,
    required this.name,
    this.stateId,
    this.sortOrder,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.countryId,
    this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    sortOrder: json["sort_order"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    state: json["state"] == null ? null : City.fromJson(json["state"]),
    countryId: json["country_id"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "sort_order": sortOrder,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "state": state?.toJson(),
    "country_id": countryId,
    "country": country?.toJson(),
  };
}

class Country {
  int id;
  String name;
  String phonecode;
  String code;
  dynamic flag;
  dynamic sortOrder;
  int status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Country({
    required this.id,
    required this.name,
    required this.phonecode,
    required this.code,
    this.flag,
    this.sortOrder,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    phonecode: json["phonecode"],
    code: json["code"],
    flag: json["flag"],
    sortOrder: json["sort_order"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phonecode": phonecode,
    "code": code,
    "flag": flag,
    "sort_order": sortOrder,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
