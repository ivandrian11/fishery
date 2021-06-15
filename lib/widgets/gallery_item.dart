import '../common/config.dart';
import '../common/size_config.dart';
import '../model/gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryItem extends StatelessWidget {
  final GalleryModel gallery;

  GalleryItem(this.gallery);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (SizeConfig.safeBlockVertical * 1.3).roundToDouble(),
        horizontal: (SizeConfig.safeBlockHorizontal * 2.78).roundToDouble(),
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/detail-gallery', arguments: gallery),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Hero(
                    tag: gallery.urlToImage,
                    child: Image.network(
                      gallery.urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (SizeConfig.safeBlockVertical * 1.3).roundToDouble(),
              ),
              Expanded(
                child: Text(gallery.name, style: paragraphOneTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
