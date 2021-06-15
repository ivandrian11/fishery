import '../../common/config.dart';
import '../../widgets/gallery_item.dart';
import '../../state/gallery_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _isLoading = true;
  final galleryC = Get.put(GalleryState(), permanent: true);

  void getData() async {
    await galleryC.getGalleries();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (galleryC.galeries == null) {
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
      title: Text('Fishery\'s Gallery', style: TextStyle(color: mainTextColor)),
    );

    Widget _galleriesWidget = _isLoading
        ? Center(child: CircularProgressIndicator())
        : galleryC.galeries.isEmpty
            ? Center(
                child: Text(
                  'Data has not been loaded. Please restart your app.',
                  style: paragraphTwoTextStyle,
                ),
              )
            : GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: galleryC.galeries
                    .map((gallery) => GalleryItem(gallery))
                    .toList(),
              );

    return Scaffold(
      appBar: _appBar,
      body: _galleriesWidget,
    );
  }
}
