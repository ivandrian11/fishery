import '../../state/article_state.dart';
import '../../common/config.dart';
import '../../widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _isLoading = true;
  final articleC = Get.put(ArticleState(), permanent: true);

  void getData() async {
    await articleC.getArticles();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (articleC.articles == null) {
      getData();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _appBar = AppBar(
      title: Text('Fishery\'s Article', style: TextStyle(color: mainTextColor)),
    );

    Widget _articlesWidget = _isLoading
        ? Center(child: CircularProgressIndicator())
        : articleC.articles.isEmpty
            ? Center(
                child: Text(
                  'Data has not been loaded. Please restart your app.',
                  style: paragraphTwoTextStyle,
                ),
              )
            : ListView(
                children: articleC.articles
                    .map((article) => ArticleItem(article))
                    .toList(),
              );

    return Scaffold(
      appBar: _appBar,
      body: _articlesWidget,
    );
  }
}
