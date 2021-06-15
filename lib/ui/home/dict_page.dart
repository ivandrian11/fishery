import '../../state/dict_state.dart';
import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../model/dict_model.dart';
import '../../widgets/dict_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DictPage extends StatefulWidget {
  @override
  _DictPageState createState() => _DictPageState();
}

class _DictPageState extends State<DictPage> {
  final _controller = TextEditingController();
  final dictC = Get.put(DictState(), permanent: true);
  bool _isSearch = false;
  bool _isLoading = true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void getData() async {
    await dictC.getDictionaries();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (dictC.dictionaries == null) {
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
      title: Text(
        'Fishery\'s Dictionary',
        style: TextStyle(color: mainTextColor),
      ),
    );

    Widget _searchTextField = Container(
      padding: EdgeInsets.symmetric(
        vertical: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
        horizontal: (SizeConfig.safeBlockHorizontal * 2.2).roundToDouble(),
      ),
      child: TextField(
        controller: _controller,
        style: inputTextStyle,
        decoration: textFieldDecoration.copyWith(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: mainTextColor,
            size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
          ),
        ),
        onChanged: (input) =>
            setState(() => _isSearch = _controller.text.isNotEmpty),
      ),
    );

    Widget _getList(List<DictModel> list) {
      return ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) => DictItem(list[index]),
        separatorBuilder: (context, index) =>
            Divider(color: secondaryTextColor),
      );
    }

    Widget _performSearch(List<DictModel> list) {
      List<DictModel> filterList = [];
      for (var item in list) {
        if (item.title.toLowerCase().contains(_controller.text.toLowerCase())) {
          filterList.add(item);
        }
      }
      return _getList(filterList);
    }

    Widget _dictionariesWidget = _isLoading
        ? Center(child: CircularProgressIndicator())
        : dictC.dictionaries.isEmpty
            ? Center(
                child: Text(
                  'Data has not been loaded. Please restart your app.',
                  style: paragraphTwoTextStyle,
                ),
              )
            : _isSearch
                ? _performSearch(dictC.dictionaries)
                : _getList(dictC.dictionaries);

    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: [
          _searchTextField,
          Expanded(child: _dictionariesWidget),
        ],
      ),
    );
  }
}
