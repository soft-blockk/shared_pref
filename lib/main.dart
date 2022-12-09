import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Preference());

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  TextEditingController ctr = TextEditingController();
  String? savedData;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          centerTitle: true,
          title: Text(
            "Shared Prefference",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              savedData == null ? Text("nodata") : Text(savedData!),
              SizedBox(
                height: 20,
              ),
              TextField(
                enabled: true,
                controller: ctr,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 40, maxWidth: 250),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print(ctr.text);
                  saveData(ctr.text);
                  getData();
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveData(value) async {
    final SharedPreferences a = await SharedPreferences.getInstance();
    a.setString("pao", value);
  }

  void getData() async {
    final SharedPreferences instence = await SharedPreferences.getInstance();
    setState(() {
      savedData = instence.getString("pao");
    });
  }
}
