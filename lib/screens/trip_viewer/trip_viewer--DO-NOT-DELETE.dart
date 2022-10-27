import 'dart:math';

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart' hide ReorderableList;

import '../../widgets/text.widget.dart';

class ItemData {
  ItemData(this.key, this.title, this.duration);

  final String title;
  final String duration;
  final Key key;
}

class TPlace {
  String title;
  String time;
  String date;

  TPlace({required this.title, required this.time, required this.date});
}

class TripViewer extends StatefulWidget {
  const TripViewer({Key? key}) : super(key: key);

  @override
  State<TripViewer> createState() => _TripViewerState();
}

class _TripViewerState extends State<TripViewer> {
  late List<ItemData> _items;
  final snapSizes = [.05, .5];

  late List<List<TPlace>> fullTrip;
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();
    _items = [];
    for (int i = 0; i < 10; ++i) {
      _items.add(ItemData(ValueKey(i), 'Place Name $i', "9:00 - 10:00"));
    }

    fullTrip = [
      [
        TPlace(title: 'Place 1', time: '9:00 - 10:00', date: 'July 1'),
        TPlace(title: 'Place 2', time: '10:00 - 11:00', date: 'July 1')
      ],
      [
        TPlace(title: 'Place 3', time: '9:00 - 10:00', date: 'July 2'),
        TPlace(title: 'Place 4', time: '10:00 - 11:00', date: 'July 2')
      ]
    ];

    _contents = fullTrip
        .map(
          (dayTrip) => DragAndDropList(
              contentsWhenEmpty: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child:
                    const Text('Seems like your will be unavailable for a day'),
              ),
              header: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 4),
                child: Text(
                  'Day ${dayTrip[0].date}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              children: dayTrip.isNotEmpty
                  ? dayTrip
                      .map((place) => DragAndDropItem(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(12),
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/google_logo.png"),
                                      height: 12.0,
                                      width: 12.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        B1Text(place.title),
                                        Text(place.time)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList()
                  : []),
        )
        .toList();
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final trips = ModalRoute.of(context)!.settings.arguments as List<Trip>;

    var backgroundColor = const Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
        appBar: null,
        body: DraggableScrollableSheet(
          initialChildSize: snapSizes[1],
          minChildSize: snapSizes.reduce(min),
          maxChildSize: snapSizes.reduce(max),
          snap: true,
          snapSizes: snapSizes,
          builder: (BuildContext context, ScrollController scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  const SliverAppBar(
                    title: Padding(
                      padding: EdgeInsets.only(top: 6),
                      // child: SheetHeader(),
                    ),
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    primary: false,
                    floating: true,
                    pinned: true,
                    stretch: false,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: DragAndDropLists(
                        children: _contents,
                        onItemReorder: _onItemReorder,
                        onListReorder: _onListReorder,
                        listPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        itemDivider: Divider(
                          thickness: 2,
                          height: 2,
                          color: backgroundColor,
                        ),
                        itemDecorationWhileDragging: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        listInnerDecoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        lastItemTargetHeight: 8,
                        addLastItemTargetHeightToTop: true,
                        lastListTargetSize: 40,
                        listDragHandle: const DragHandle(
                          verticalAlignment: DragHandleVerticalAlignment.top,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.drag_handle,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        itemDragHandle: const DragHandle(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.drag_handle,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.data,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  final ItemData data;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 32.0, 0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_outline_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      key: ValueKey(data.title),
      onDismissed: (DismissDirection direction) {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: B1Text('Port Da vinci')),
    );
  }
}
