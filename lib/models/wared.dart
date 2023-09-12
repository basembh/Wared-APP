//   https://app.quicktype.io/


// To parse this JSON data, do
//
//     final wared = waredFromJson(jsonString);

import 'dart:convert';

List<Wared> waredFromJson(String str) => List<Wared>.from(json.decode(str).map((x) => Wared.fromJson(x)));

String waredToJson(List<Wared> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wared {
  
    int waredSerial;
    String? actions;
 
    Wared({
        required this.waredSerial,
                 this.actions,
    });

    factory Wared.fromJson(Map<String, dynamic> json) => Wared(
        waredSerial: json["wared_serial"],
        actions: json["actions"],
    );

    Map<String, dynamic> toJson() => {
        "wared_serial": waredSerial,
        "actions": actions,
    };
}
