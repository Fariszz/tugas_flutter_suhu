import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  TextEditingController inputCelciusController = TextEditingController();

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(inputCelciusController.text);
      _reamur = (4 * _inputUser) / 5;
      _kelvin = _inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Input(inputCelciusController: inputCelciusController),
              Container(
                width: 400.0,
                height: 400.0,
                margin: const EdgeInsets.only(left: 30, right: 30),
                alignment: Alignment.center,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Text(
                                  "Suhu dalam Kelvin",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "$_kelvin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 40),
                                  ))
                            ],
                          ),
                          height: 150,
                          width: 150,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Text(
                                  "Suhu dalam Reamur",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "$_reamur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 40),
                                  ))
                            ],
                          ),
                          height: 150,
                          width: 150,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Convert(konvertHandler: _konversiSuhu)
            ],
          ),
        ),
      ),
    );
  }
}

class Convert extends StatelessWidget {
  final VoidCallback konvertHandler;
  const Convert({Key? key, required this.konvertHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: konvertHandler,
                  child: const Text(
                    'Konversi Suhu',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.inputCelciusController,
  }) : super(key: key);

  final TextEditingController inputCelciusController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputCelciusController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration:
          const InputDecoration(hintText: "Masukkan suhu dalam Celcius"),
    );
  }
}
