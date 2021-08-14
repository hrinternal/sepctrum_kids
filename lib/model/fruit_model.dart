class FruitsEntity {
  String? image;
  String? audio;
  String? text;

  FruitsEntity({
    this.image,
    this.audio,
    this.text,
  });

  factory FruitsEntity.fromJson(Map<String, dynamic> parsedJson) {
    return FruitsEntity(
      image: parsedJson['image'],
      audio: parsedJson['audio'],
      text: parsedJson['text']
    );
  }
}
