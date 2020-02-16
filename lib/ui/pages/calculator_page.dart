import 'package:bmi_calculator/blocs/calculator_bloc.dart';
import 'package:bmi_calculator/constants/routes.dart';
import 'package:bmi_calculator/constants/strings.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final calculatorBloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.of(context).pushNamed(info);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        _buildEnterField(
                          weight,
                          [
                            kg,
                            lb,
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildEnterField(
                          height,
                          [
                            cm,
                            inch,
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        StreamBuilder<String>(
                            initialData: '0',
                            stream: calculatorBloc.resultStream,
                            builder: (context, snapshot) {
                              return Text(
                                  'Calculation result: ${snapshot.data}');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<BMI>(
                            stream: calculatorBloc.classResultStream,
                            builder: (context, bmi) {
                              Color underweight;
                              Color normal;
                              Color overweight;
                              Color obese;

                              switch (bmi.data) {
                                case BMI.Underweight:
                                  underweight = Colors.yellow;
                                  normal = null;
                                  overweight = null;
                                  obese = null;
                                  break;
                                case BMI.Normal:
                                  underweight = null;
                                  normal = Colors.green;
                                  overweight = null;
                                  obese = null;
                                  break;
                                case BMI.Overweight:
                                  underweight = null;
                                  normal = null;
                                  overweight = Colors.redAccent;
                                  obese = null;
                                  break;
                                case BMI.Obese:
                                  underweight = null;
                                  normal = null;
                                  overweight = null;
                                  obese = Colors.red;
                                  break;
                              }

                              return Text.rich(
                                TextSpan(
                                  text: null,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: classUnderWeight,
                                      style: TextStyle(
                                        color: underweight,
                                      ),
                                    ),
                                    TextSpan(
                                      text: classNormal,
                                      style: TextStyle(
                                        color: normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: classOverWeight,
                                      style: TextStyle(
                                        color: overweight,
                                      ),
                                    ),
                                    TextSpan(
                                      text: classObese,
                                      style: TextStyle(
                                        color: obese,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: StreamBuilder<String>(
                        stream: calculatorBloc.weightStream,
                        builder: (context, weight) {
                          return StreamBuilder<String>(
                              stream: calculatorBloc.heightStream,
                              builder: (context, height) {
                                return RaisedButton(
                                  onPressed: weight.hasData
                                      ? (height.hasData
                                          ? (weight.hasError
                                              ? null
                                              : (height.hasError
                                                  ? null
                                                  : () {
                                                      calculatorBloc
                                                          .onCalculateClicked();
                                                    }))
                                          : null)
                                      : null,
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    calculate,
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                );
                              });
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnterField(
    String title,
    List<String> choices,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Spacer(),
        Text(title),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: StreamBuilder<String>(
              stream: title == weight
                  ? calculatorBloc.weightStream
                  : calculatorBloc.heightStream,
              builder: (context, snapshot) {
                return TextFormField(
                    maxLength: title == weight ? null : 3,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                    ),
                    onChanged: (value) {
                      title == weight
                          ? calculatorBloc.onWeightChanged(value)
                          : calculatorBloc.onHeightChanged(value);
                    });
              }),
        ),
        Spacer(),
      ],
    );
  }

  @override
  void dispose() async {
    await calculatorBloc?.dispose();
    super.dispose();
  }
}
