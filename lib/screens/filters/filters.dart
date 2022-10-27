import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'api/create-trip.api.dart';
import 'components/category_filter.component.dart';
import 'components/date_picker.component.dart';
import 'components/no_of_people_input.component.dart';
import 'components/place_filter.component.dart';
import 'constants/filter_types.constant.dart';
import 'models/filter.model.dart';
import '../../utils/date.util.dart';
import '../../widgets/primary_button.widget.dart';

import '../../constants/strings.constant.dart';
import '../../widgets/text.widget.dart';
import '../../routes/route.constant.dart';
import '../../widgets/secondary_button.widget.dart';
import 'components/create_trip_loader.component.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;

  FilterModel filters = FilterModel();
  bool _isCreatingTrip = false;

  final _formKey = GlobalKey<FormBuilderState>();

  var categories = ['Romantic', 'Fun', 'Adventurous'];

  _onSubmit() async {
    setState(() {
      _isCreatingTrip = true;
    });
    // try {
      final createTripResponse = await createTrip(filters);
      if (mounted) {
        Navigator.pushNamed(context, Routes.tripViewer,
            arguments: createTripResponse);
      }
    // } catch (e) {
    //   ErrorSnackbar(context: context);
    
    // }
    setState(() {
      _isCreatingTrip = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 20);
    return WillPopScope(
      onWillPop: () async => false,
      child: _isCreatingTrip
          ? CreateTripLoader(onCancel: () {
              setState(() {
                _isCreatingTrip = false;
              });
            })
          : Scaffold(
              appBar: null,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 32),
                      const H2Text(StringConstants.headerFilters),
                      FormBuilder(
                        key: _formKey,
                        onChanged: () {
                          _formKey.currentState!.save();
                          debugPrint(_formKey.currentState!.value.toString());
                        },
                        skipDisabled: true,
                        child: Column(
                          children: <Widget>[
                            separator,
                            PlaceFilter(onChanged: (val) {
                              setState(() {
                                filters.place = val;
                              });
                            }),
                            separator,
                            CategoryFilter(
                              categories: categories,
                              onSelectCategory: (val) {
                                filters.category = val;
                              },
                            ),
                            separator,
                            NoOfPeopleFilter(onChanged: (val) {
                              setState(() {
                                filters.noOfPeople = val;
                              });
                            }),
                            separator,
                            DatePickerFilter(
                              name: FilterType.startDateAndTime,
                              labelText: StringConstants.startDateTime,
                              onChanged: (val) {
                                var dateAndTime = convertDateTimeToString(val);
                                filters.startDate = dateAndTime.item1;
                                filters.startTime = dateAndTime.item2;
                              },
                            ),
                            separator,
                            DatePickerFilter(
                              name: FilterType.endDateAndTime,
                              labelText: StringConstants.endDateTime,
                              onChanged: (val) {
                                var dateAndTime = convertDateTimeToString(val);
                                filters.endDate = dateAndTime.item1;
                                filters.endTime = dateAndTime.item2;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SecondaryButton(
                              text: StringConstants.reset,
                              isHalfSize: true,
                              onPressed: () {
                                _formKey.currentState?.reset();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: PrimaryButton(
                                text: StringConstants.done,
                                isHalfSize: true,
                                onPressed: _isCreatingTrip
                                    ? null
                                    : () {
                                        if (_formKey.currentState
                                                ?.saveAndValidate() ??
                                            false) {
                                          _onSubmit();
                                        }
                                      }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
