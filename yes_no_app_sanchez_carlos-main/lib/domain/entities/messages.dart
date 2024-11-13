
enum FromWho { mine, Songoku }

class Messages {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final String time;

  Messages({ 
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.time,});
  
  Messages copyWith(
      {String? text, String? imageUrl, FromWho? formWho, String? time}) {
    return Messages(
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      fromWho: formWho ?? this.fromWho,
      time: time ?? this.time,);
      }
}