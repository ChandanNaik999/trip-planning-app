import 'dart:math';

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart' hide ReorderableList;

import '../../../constants/strings.constant.dart';
import '../../filters/models/dnd.model.dart';
import '../models/save_trip.request.dart';
import '../util/model_conversion.util.dart';
import 'dnd_list.component.dart';
import 'sheet_header.component.dart';

class TripBottomSheet extends StatefulWidget {
  final DndModel dndModel;
  final Function(SaveTripRequest) onSaveList;

  const TripBottomSheet({
    required this.dndModel,
    required this.onSaveList,
    Key? key,
  }) : super(key: key);

  @override
  State<TripBottomSheet> createState() => _TripBottomSheetState();
}

class _TripBottomSheetState extends State<TripBottomSheet> {
  late DndTrip _currentSelection;

  final snapSizes = [.05, .5];

  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();
    _onChangeList(0);
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      // move ui
      // var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      // _contents[newListIndex].children.insert(newItemIndex, movedItem);

      // move in list
      var movedPlace =
          _currentSelection.route[oldListIndex].items.removeAt(oldItemIndex);
      _currentSelection.route[newListIndex].items
          .insert(newItemIndex, movedPlace);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      // move ui
      // var movedList = _contents.removeAt(oldListIndex);
      // _contents.insert(newListIndex, movedList);

      var movedDayTrip = _currentSelection.route.removeAt(oldListIndex);
      _currentSelection.route.insert(newListIndex, movedDayTrip);
    });
  } 

  _onChangeList(int newIndex) {
    setState(() {
      _currentSelection = DndTrip.copy(obj: widget.dndModel.trips[newIndex]);
    });
  }

  _onSaveList() async {
    final transformedTrip =
        DndModelConverter.convert(_currentSelection, widget.dndModel.places);
    await widget.onSaveList(transformedTrip);
  }

  @override
  Widget build(BuildContext context) {
    _contents = _currentSelection.route
        .map(
          (route) => DndList.getDndList(
            route.date,
            route.items.map((item) {
              final place = widget.dndModel.places[item.id]!;
              return DndItem(
                title: place.name,
                subTitle: item.startTime,
                image: place.image,
              );
            }).toList(),
          ),
        )
        .toList();

    var backgroundColor = const Color.fromARGB(255, 243, 242, 248);

    return DraggableScrollableSheet(
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
              SliverAppBar(
                title: SheetHeader(
                  header: StringConstants.trip,
                  onChangeIndex: _onChangeList,
                  numItems: widget.dndModel.trips.length,
                  onSave: _onSaveList,
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
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                    listDragHandle: DragHandle(
                      verticalAlignment: DragHandleVerticalAlignment.top,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.drag_handle,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                    itemDragHandle: DragHandle(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.drag_handle,
                          color: Theme.of(context).colorScheme.background,
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
    );
  }
}
