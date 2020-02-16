import 'dart:async';

class DateBloc with DateValidator {
  final StreamController<DateTime> _dateTimeController =
      StreamController<DateTime>.broadcast();

  Function(DateTime) get onDateChanged => _dateTimeController.sink.add;

  Stream<DateTime> get isGreater =>
      _dateTimeController.stream.transform(dateValidator);

  Future<void> dispose() async {
    await _dateTimeController?.close();
  }
}

mixin DateValidator {
  var dateValidator = StreamTransformer<DateTime, DateTime>.fromHandlers(
      handleData: (birthDate, sink) {
    final currentDate = DateTime.now();
    final int difference = currentDate.difference(birthDate).inDays;
    final int differenceInYears = (difference / 365).floor();
    if (differenceInYears >= 20) {
      sink.add(birthDate);
    } else {
      sink.addError('Your age is less than 20!');
    }
  });
}
