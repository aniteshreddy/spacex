// To parse this JSON data, do
//
//     final launchData = launchDataFromJson(jsonString);

import 'dart:convert';

List<LaunchData> launchDataFromJson(String str) =>
    List<LaunchData>.from(json.decode(str).map((x) => LaunchData.fromJson(x)));

String launchDataToJson(List<LaunchData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaunchData {
  LaunchData({
    this.missionName,
    this.launchDateLocal,
    this.launchSite,
    this.links,
    this.rocket,
    this.ships,
  });

  String missionName;
  DateTime launchDateLocal;
  LaunchSite launchSite;
  Links links;
  Rocket rocket;
  List<Ship> ships;

  factory LaunchData.fromJson(Map<String, dynamic> json) => LaunchData(
        missionName: json["mission_name"],
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        links: Links.fromJson(json["links"]),
        rocket: Rocket.fromJson(json["rocket"]),
        ships: List<Ship>.from(json["ships"].map((x) => Ship.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mission_name": missionName,
        "launch_date_local": launchDateLocal.toIso8601String(),
        "launch_site": launchSite.toJson(),
        "links": links.toJson(),
        "rocket": rocket.toJson(),
        "ships": List<dynamic>.from(ships.map((x) => x.toJson())),
      };
}

class LaunchSite {
  LaunchSite({
    this.siteNameLong,
  });

  String siteNameLong;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteNameLong: json["site_name_long"],
      );

  Map<String, dynamic> toJson() => {
        "site_name_long": siteNameLong,
      };
}

class Links {
  Links({
    this.articleLink,
    this.videoLink,
  });

  String articleLink;
  String videoLink;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        articleLink: json["article_link"] == null ? null : json["article_link"],
        videoLink: json["video_link"],
      );

  Map<String, dynamic> toJson() => {
        "article_link": articleLink == null ? null : articleLink,
        "video_link": videoLink,
      };
}

class Rocket {
  Rocket({
    this.rocketName,
    this.firstStage,
  });

  String rocketName;
  FirstStage firstStage;

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketName: json["rocket_name"],
        firstStage: FirstStage.fromJson(json["first_stage"]),
      );

  Map<String, dynamic> toJson() => {
        "rocket_name": rocketName,
        "first_stage": firstStage.toJson(),
      };
}

class FirstStage {
  FirstStage({
    this.cores,
  });

  List<CoreElement> cores;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: List<CoreElement>.from(
            json["cores"].map((x) => CoreElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
      };
}

class CoreElement {
  CoreElement({
    this.core,
  });

  CoreCore core;

  factory CoreElement.fromJson(Map<String, dynamic> json) => CoreElement(
        core: CoreCore.fromJson(json["core"]),
      );

  Map<String, dynamic> toJson() => {
        "core": core.toJson(),
      };
}

class CoreCore {
  CoreCore({
    this.reuseCount,
    this.status,
  });

  int reuseCount;
  String status;

  factory CoreCore.fromJson(Map<String, dynamic> json) => CoreCore(
        reuseCount: json["reuse_count"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "reuse_count": reuseCount,
        "status": status == null ? null : status,
      };
}

class Ship {
  Ship({
    this.name,
    this.homePort,
    this.image,
  });

  String name;
  HomePort homePort;
  String image;

  factory Ship.fromJson(Map<String, dynamic> json) {
    try {
      return Ship(
        name: json["name"],
        homePort: homePortValues.map[json["home_port"]],
        image: json["image"],
      );
    } catch (e) {
      return Ship(
        name: null,
        homePort: null,
        image: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "home_port": homePortValues.reverse[homePort],
        "image": image,
      };
}

enum HomePort { PORT_CANAVERAL, PORT_OF_LOS_ANGELES }

final homePortValues = EnumValues({
  "Port Canaveral": HomePort.PORT_CANAVERAL,
  "Port of Los Angeles": HomePort.PORT_OF_LOS_ANGELES
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
