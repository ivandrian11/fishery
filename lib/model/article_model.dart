class ArticleModel {
  String author;
  String title;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel({
    this.author,
    this.title,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  ArticleModel.fromJSON(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    urlToImage = json['urlToImage'];
    publishedAt = json['published_at'];
    content = json['content'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'author': author,
      'title': title,
      'urlToImage': urlToImage,
      'published_at': publishedAt,
      'content': content
    };
  }
}
