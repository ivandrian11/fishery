import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ArticleModel article = Get.arguments as ArticleModel;

    Widget _appBar = AppBar(
      title: Text(article.title, style: TextStyle(color: mainTextColor)),
    );

    Widget _articleDetailWidget = ListView(
      children: [
        Hero(
          tag: article.urlToImage,
          child: Image.network(article.urlToImage),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: (SizeConfig.safeBlockVertical * 1.6).roundToDouble(),
            horizontal: (SizeConfig.safeBlockHorizontal * 2.78).roundToDouble(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title, style: headingOneTextStyle),
              Divider(color: Colors.grey),
              Text(
                'Date: ${article.publishedAt}',
                style: TextStyle(
                  fontSize:
                      (SizeConfig.safeBlockHorizontal * 3.89).roundToDouble(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Author: ${article.author}',
                style: TextStyle(
                  fontSize:
                      (SizeConfig.safeBlockHorizontal * 3.89).roundToDouble(),
                ),
              ),
              Divider(color: Colors.grey),
              Text(
                article.content,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize:
                      (SizeConfig.safeBlockHorizontal * 4.4).roundToDouble(),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: _articleDetailWidget,
    );
  }
}
