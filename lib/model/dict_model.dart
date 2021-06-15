class DictModel {
  String title;
  String description;

  DictModel({this.title, this.description});

  DictModel.fromJSON(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'title': title,
      'description': description,
    };
  }
}
