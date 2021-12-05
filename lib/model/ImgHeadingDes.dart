import 'dart:convert';

class ImgHeadingDes {
  String name, description,image;


  ImgHeadingDes(
      {
        this.name,
        this.description,
        this.image});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory ImgHeadingDes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ImgHeadingDes(
        name: map['name'],
        description: map['description'],
        image: map['image']);
  }

  factory ImgHeadingDes.fromJson(String source) => ImgHeadingDes.fromMap(
    json.decode(source),
  );
}
