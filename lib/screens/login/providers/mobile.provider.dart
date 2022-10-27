import 'package:flutter_riverpod/flutter_riverpod.dart';

final mobileProvider = StateProvider<String>((_) => '');

changeMobile(WidgetRef ref, String mobileNumber) {
  ref.read(mobileProvider.notifier).state = mobileNumber;
}
