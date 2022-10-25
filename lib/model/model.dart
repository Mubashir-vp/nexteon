// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    Model({
        this.data,
    });

    Data? data;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.list,
    });

    List<ListElement?> ?list;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x!.toJson())),
    };
}

class ListElement {
    ListElement({
        this.id,
        this.code,
        this.categoryId,
        this.createdUserId,
        this.dataGuard,
        this.description,
        this.globalGalleryId,
        this.name,
        this.status,
        this.categoryDetails,
        this.globalGalleryDetails,
    });

    String? id;
    int ?code;
    String? categoryId;
    dynamic createdUserId;
    List<int?>? dataGuard;
    String? description;
    String? globalGalleryId;
    String? name;
    int ?status;
    CategoryDetails? categoryDetails;
    GlobalGalleryDetails? globalGalleryDetails;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        code: json["_code"],
        categoryId: json["_categoryId"],
        createdUserId: json["_createdUserId"],
        dataGuard: List<int>.from(json["_dataGuard"].map((x) => x)),
        description: json["_description"],
        globalGalleryId: json["_globalGalleryId"],
        name: json["_name"],
        status: json["_status"],
        categoryDetails: CategoryDetails.fromJson(json["categoryDetails"]),
        globalGalleryDetails: GlobalGalleryDetails.fromJson(json["globalGalleryDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_code": code,
        "_categoryId": categoryId,
        "_createdUserId": createdUserId,
        "_dataGuard": List<dynamic>.from(dataGuard!.map((x) => x)),
        "_description": description,
        "_globalGalleryId": globalGalleryId,
        "_name": name,
        "_status": status,
        "categoryDetails": categoryDetails!.toJson(),
        "globalGalleryDetails": globalGalleryDetails!.toJson(),
    };
}

class CategoryDetails {
    CategoryDetails({
        this.id,
        this.code,
        this.name,
        this.status,
    });

    String? id;
    int ?code;
    String? name;
    int ?status;

    factory CategoryDetails.fromJson(Map<String, dynamic> json) => CategoryDetails(
        id: json["_id"],
        code: json["_code"],
        name: json["_name"],
        status: json["_status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_code": code,
        "_name": name,
        "_status": status,
    };
}

class GlobalGalleryDetails {
    GlobalGalleryDetails({
        this.id,
        this.docType,
        this.url,
    });

    String? id;
    int ?docType;
    String? url;

    factory GlobalGalleryDetails.fromJson(Map<String, dynamic> json) => GlobalGalleryDetails(
        id: json["_id"],
        docType: json["_docType"],
        url: json["_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_docType": docType,
        "_url": url,
    };
}
