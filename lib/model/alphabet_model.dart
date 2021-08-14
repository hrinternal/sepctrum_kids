class AlphabetsEntity {
  String? text;
  String? audio;

  AlphabetsEntity({
    this.text,
    this.audio,
  });

  factory AlphabetsEntity.fromJson(Map<String, dynamic> parsedJson) {
    return AlphabetsEntity(
      text: parsedJson['text'],
      audio: parsedJson['audio'],
    );
  }
}
