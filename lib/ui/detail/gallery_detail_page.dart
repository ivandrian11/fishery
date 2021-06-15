import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../model/gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GalleryModel gallery = Get.arguments as GalleryModel;

    Widget _appBar = AppBar(
      title: Text(gallery.name, style: TextStyle(color: mainTextColor)),
    );

    Widget _galleryDetailWidget = ListView(
      children: [
        Hero(
          tag: gallery.urlToImage,
          child: Image.network(gallery.urlToImage),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: (SizeConfig.safeBlockVertical * 1.6).roundToDouble(),
            horizontal: (SizeConfig.safeBlockHorizontal * 2.78).roundToDouble(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(gallery.name, style: headingOneTextStyle),
              Divider(color: Colors.grey),
              Text(
                'Location: ${gallery.location}',
                style: TextStyle(
                  fontSize:
                      (SizeConfig.safeBlockHorizontal * 3.89).roundToDouble(),
                ),
              ),
              Divider(color: Colors.grey),
              Text(
                gallery.content,
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
      body: _galleryDetailWidget,
    );
  }
}
