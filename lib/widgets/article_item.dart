import '../common/config.dart';
import '../common/size_config.dart';
import '../model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  ArticleItem(this.article);

  @override
  build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (SizeConfig.safeBlockVertical * 1.3).roundToDouble(),
        horizontal: (SizeConfig.safeBlockHorizontal * 4.4).roundToDouble(),
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/detail-article', arguments: article),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: article.urlToImage,
                  child: Image.network(article.urlToImage),
                ),
              ),
            ),
            SizedBox(
              width: (SizeConfig.safeBlockHorizontal * 2.2).roundToDouble(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: paragraphOneTextStyle.copyWith(
                      fontSize: (SizeConfig.safeBlockHorizontal * 3.89)
                          .roundToDouble(),
                    ),
                  ),
                  Text(
                    article.author,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: (SizeConfig.safeBlockHorizontal * 3.3)
                          .roundToDouble(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
