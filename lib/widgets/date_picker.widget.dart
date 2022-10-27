// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../constants/strings.dart';
// import 'secondary_button.dart';

// class DatePicker extends StatefulWidget {
//   const DatePicker({Key? key}) : super(key: key);

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   DateTime _dob = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//   }

//   onClick() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _dob,
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//       helpText: StringConstants.enterYourDOB,
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dob = pickedDate; //set output date to TextField value.
//       });
//     }
//   }

//   getText() {
//     if (_dob == DateTime.now()) {
//       return StringConstants.enterYourDOB;
//     }

//     return '${StringConstants.enterYourDOB} ${DateFormat.yMMMMd().format(_dob)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SecondaryButton(
//       text: getText(),
//       onPressed: onClick,
//     );
//   }
// }
