import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart' hide ReorderableList;
import '../../../constants/strings.constant.dart';

import '../../../widgets/text.widget.dart';

class DndItem {
  String title;
  String subTitle;
  String image;

  DndItem({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class DndList {
  static DragAndDropList getDndList(String header, List<DndItem> items) {
    return DragAndDropList(
        contentsWhenEmpty: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child:
              const Text(StringConstants.seemsLikeYouWillBeUnavailableForADay),
        ),
        header: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 4),
          child: Text(
            header,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        children: items.isNotEmpty
            ? items
                .map((item) => DragAndDropItem(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.network(
                              item.image,
                              fit: BoxFit.cover,
                              height: 24.0,
                              width: 24.0,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  B1Text(item.title),
                                  Text(item.subTitle)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList()
            : []);
  }
}
