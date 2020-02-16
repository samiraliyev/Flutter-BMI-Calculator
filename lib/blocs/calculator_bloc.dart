import 'dart:async';

enum SwitchState {
  Enabled,
  Disabled,
}

enum BMI {
  Underweight,
  Normal,
  Overweight,
  Obese,
}

class CalculatorBloc with InputValidators {
  double _weight = 0;
  double _height = 0;

  final _weightContoller = StreamController<String>.broadcast();
  final _heightController = StreamController<String>.broadcast();
  final _resultController = StreamController<String>();
  final _classResultController = StreamController<BMI>();

  Stream<String> get weightStream =>
      _weightContoller.stream.transform(weightValidator);
  Stream<String> get heightStream =>
      _heightController.stream.transform(heightValidator);
  Stream<String> get resultStream => _resultController.stream;
  Stream<BMI> get classResultStream => _classResultController.stream;

  Function(String) get onWeightChanged => _weightContoller.sink.add;
  Function(String) get onHeightChanged => _heightController.sink.add;

  CalculatorBloc() {
    // listen to weight value
    _weightContoller.stream.listen((newWeight) {
      _weight = double.parse(newWeight);
    }, onError: (_) {
      _weight = 0;
    });

    // listen to height value
    _heightController.stream.listen((newHeight) {
      _height = double.parse(newHeight);
    }, onError: (_) {
      _height = 0;
    });
  }

  /// Calculate BMI value and interprete it
  void onCalculateClicked() {
    double bmiValue;
    BMI bmiClass;

    var heightInMeter = _height / 100;
    bmiValue = _weight / (heightInMeter * heightInMeter);

    if (bmiValue < 18.50) {
      bmiClass = BMI.Underweight;
    } else if (bmiValue >= 18.50 && bmiValue < 25) {
      bmiClass = BMI.Normal;
    } else if (bmiValue >= 25.00 && bmiValue < 30) {
      bmiClass = BMI.Overweight;
    } else {
      bmiClass = BMI.Obese;
    }

    _resultController.sink.add(bmiValue.toStringAsFixed(2));
    _classResultController.sink.add(bmiClass);
  }

  Future<void> dispose() async {
    _weightContoller?.close();
    _heightController?.close();
    _resultController?.close();
    _classResultController?.close();
  }
}

mixin InputValidators {
  var weightValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (weight, sink) {
    try {
      if (double.parse(weight) <= 0) {
        sink.addError("Non-negative!");
      } else {
        sink.add(weight);
      }
    } catch (e) {
      sink.addError('invalid!');
    }
  });

  var heightValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (height, sink) {
    try {
      if (double.parse(height) <= 0) {
        sink.addError("Non-negative!");
      } else {
        sink.add(height);
      }
    } catch (e) {
      sink.addError('Invalid!');
    }
  });
}
