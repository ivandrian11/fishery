class GalleryModel {
  String name;
  String urlToImage;
  String location;
  String content;

  GalleryModel({
    this.name,
    this.urlToImage,
    this.location,
    this.content,
  });

  GalleryModel.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    urlToImage = json['urlToImage'];
    location = json['location'];
    content = json['content'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'urlToImage': urlToImage,
      'location': location,
      'content': content,
    };
  }
}
