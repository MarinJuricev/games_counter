import 'package:intl/intl.dart';

import '../../domain/service/time_provider.dart';

class TimeProviderImpl implements TimeProvider {
  @override
  String provideCurrentTime(String desiredDateFormat) {
    final now = new DateTime.now();
    return DateFormat(desiredDateFormat).format(now);
  }
}
