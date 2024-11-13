// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';
import 'package:intl/intl.dart';


class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

     Messages toMessageEntity() => Messages(
      text: answer == 'yes'
          ? 'Si'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      fromWho: FromWho.Songoku,
      imageUrl: image,
      time: DateFormat('hh:mm a').format(DateTime.now()));
}
