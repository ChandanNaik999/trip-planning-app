import '../models/create_trip.response.dart';

import '../models/dnd.model.dart';

class CreateTripResponseConverter {
  static DndModel convert(CreateTripResponse response) {
    return DndModel(
        places: response.places,
        trips: response.trips.map((trip) {
          var oldRoute = trip.route;

          List<DndRoute> newRoute = [];

          for (var oldIdx = 0; oldIdx < oldRoute.length; oldIdx += 1) {
            var newIdx = 0;
            for (; newIdx < newRoute.length; newIdx += 1) {
              if (oldRoute[oldIdx].startDate == newRoute[newIdx].date) {
                newRoute[newIdx].items.add(oldRoute[oldIdx]);

                // refresh the start and endTime of the day depending on the oldRoute[oldIdx]
              }
            }
            if (newIdx == newRoute.length) {
              var oldItem = oldRoute[oldIdx];
              newRoute.add(DndRoute(
                id: oldItem.startDate,
                date: oldItem.startDate,
                startTime: oldItem.startTime,
                endTime: oldItem.endTime,
                items: [oldItem],
              ));
            }
          }

          return DndTrip(
            tripId: trip.tripId,
            endDate: trip.endDate,
            image: trip.image,
            startDate: trip.startDate,
            tripName: trip.tripName,
            route: newRoute,
          );
        }).toList());
    // return [
    //   DndModel(
    //     tasks: Tasks(
    //       task1: Task(
    //           id: '1',
    //           title: 'title',
    //           subTitle: 'subTitle',
    //           image:
    //               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
    //       task2: Task(
    //           id: '2',
    //           title: 'title',
    //           subTitle: 'subTitle',
    //           image:
    //               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
    //     ),
    //     columns: Columns(
    //         column1: Column(id: 'C1', tasks: ['1', '2']),
    //         column2: Column(id: 'C2', tasks: ['1', '2'])),
    //     columnOrder: ['C1', 'C2'],
    //   ),
    //   DndModel(
    //     tasks: Tasks(
    //       task1: Task(
    //           id: '1',
    //           title: 'title',
    //           subTitle: 'subTitle',
    //           image:
    //               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
    //       task2: Task(
    //           id: '2',
    //           title: 'title',
    //           subTitle: 'subTitle',
    //           image:
    //               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
    //     ),
    //     columns: Columns(
    //         column1: Column(id: 'C1', tasks: ['1', '2']),
    //         column2: Column(id: 'C2', tasks: ['1', '2'])),
    //     columnOrder: ['C1', 'C2'],
    //   )
    // ];
  }
}
