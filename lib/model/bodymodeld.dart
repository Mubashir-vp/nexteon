// To parse this JSON data, do
//
//     final body = bodyFromJson(jsonString);

import 'dart:convert';

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));

String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
    Body({
        this.sortType,
        this.sortOrder,
        this.statusArray,
        this.screenType,
        this.responseFormat,
        this.subCategoryIds,
        this.categoryIds,
        this.limit,
        this.skip,
        this.searchingText,
    });

    int? sortType;
    int ?sortOrder;
    List<int?>? statusArray;
    List<int?>? screenType;
    List<int?>? responseFormat;
    List<dynamic>? subCategoryIds;
    List<dynamic>? categoryIds;
    int? limit;
    int? skip;
    String? searchingText;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        sortType: json["sortType"],
        sortOrder: json["sortOrder"],
        statusArray: List<int>.from(json["statusArray"].map((x) => x)),
        screenType: List<int>.from(json["screenType"].map((x) => x)),
        responseFormat: List<int>.from(json["responseFormat"].map((x) => x)),
        subCategoryIds: List<dynamic>.from(json["subCategoryIds"].map((x) => x)),
        categoryIds: List<dynamic>.from(json["categoryIds"].map((x) => x)),
        limit: json["limit"],
        skip: json["skip"],
        searchingText: json["searchingText"],
    );

    Map<String, dynamic> toJson() => {
        "sortType": sortType,
        "sortOrder": sortOrder,
        "statusArray": List<dynamic>.from(statusArray!.map((x) => x)),
        "screenType": List<dynamic>.from(screenType!.map((x) => x)),
        "responseFormat": List<dynamic>.from(responseFormat!.map((x) => x)),
        "subCategoryIds": List<dynamic>.from(subCategoryIds!.map((x) => x)),
        "categoryIds": List<dynamic>.from(categoryIds!.map((x) => x)),
        "limit": limit,
        "skip": skip,
        "searchingText": searchingText,
    };
}
