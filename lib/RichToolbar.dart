import 'const.dart';
import 'package:flutter/material.dart';

const defaultActions = <String>[
  actions.insertImage,
  actions.setBold,
  actions.setItalic,
  actions.insertBulletsList,
  actions.insertOrderedList,
  actions.insertLink,
];

Map getDefaultIcon() {
  Map texts = new Map();
  texts[actions.insertImage] = new Image.asset('assets/icon_format_media.png', package: 'flutter_rich_editor');
  texts[actions.setBold] = new Image.asset('assets/icon_format_bold.png', package: 'flutter_rich_editor');
  texts[actions.setItalic] = new Image.asset('assets/icon_format_italic.png', package: 'flutter_rich_editor');
  texts[actions.insertBulletsList] = new Image.asset('assets/icon_format_ul.png', package: 'flutter_rich_editor');
  texts[actions.insertOrderedList] = new Image.asset('assets/icon_format_ol.png', package: 'flutter_rich_editor');
  texts[actions.insertLink] = new Image.asset('assets/icon_format_link.png', package: 'flutter_rich_editor');
  return texts;
}

class RichToolbar extends StatefulWidget {
  List<String> actions;
  Map<String, Image> iconMap;

  RichToolbar({this.actions = defaultActions, this.iconMap}) : super();

  @override
  State<StatefulWidget> createState() => RichToolbarState();
}

class RichToolbarState extends State<RichToolbar> {
  InkWell getIconButton(action) {
    Map icons = getDefaultIcon();
    Image icon;
    if (widget.iconMap != null && widget.iconMap.containsKey(action)) {
      icon = widget.iconMap[action];
    } else if (icons.containsKey(action)) {
      icon = icons[action];
    }
    return InkWell(child: icon, onTap: () => {print(action)});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.actions);
    return Material(
      color: Color(0xFFF5FCFF),
      child: Container(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [...widget.actions.map((e) => getIconButton(e))],
          )),
    );
  }
}
