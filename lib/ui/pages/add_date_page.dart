import 'package:bmi_calculator/blocs/date_bloc.dart';
import 'package:bmi_calculator/constants/routes.dart';
import 'package:bmi_calculator/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDatePage extends StatefulWidget {
  @override
  _AddDatePageState createState() => _AddDatePageState();
}

class _AddDatePageState extends State<AddDatePage> {
  final dateBloc = DateBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: FittedBox(
                    child: Text(
                      welcomeToBMICalculator,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                pleaseEnterYourBirthDate,
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        color: Colors.grey[400],
                        spreadRadius: 1,
                        offset: Offset(
                          0,
                          10,
                        ),
                      ),
                    ],
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (datetime) {
                      dateBloc.onDateChanged(datetime);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<DateTime>(
                  stream: dateBloc.isGreater,
                  builder: (context, AsyncSnapshot<DateTime> isGreater) {
                    return Text(
                      isGreater.hasError
                          ? isGreater.error
                          : (isGreater.hasData ? '' : ''),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    );
                  }),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    StreamBuilder<DateTime>(
                        stream: dateBloc.isGreater,
                        builder: (context, AsyncSnapshot<DateTime> isGreater) {
                          return RaisedButton(
                            color: Colors.indigo,
                            onPressed: isGreater.hasError
                                ? null
                                : (isGreater.hasData
                                    ? () {
                                        Navigator.of(context)
                                            .pushNamed(calculator);
                                      }
                                    : null),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: Text(
                                  goToCalculator,
                                  style: Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() async {
    await dateBloc.dispose();
    super.dispose();
  }
}
