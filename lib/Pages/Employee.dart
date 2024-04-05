import 'package:flutter/material.dart';
import 'package:flutter_crud_opration/Pages/home.dart';
import 'package:flutter_crud_opration/Service/database.dart';
import 'package:random_string/random_string.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController ageControler = TextEditingController();
  TextEditingController locationControler = TextEditingController();

  addData(String name, String Age, String location) async {
    if (name == "" || Age == "" || location == "") {
      print(Text("Please Enter Data"));
    } else {
      String Id = randomAlphaNumeric(10);
      Map<String, dynamic> employeeInfoMap = {
        "Name": nameControler.text,
        "Age": ageControler.text,
        "Id": Id,
        "Location": locationControler.text
      };
      await DatabaseMethos()
          .addEmployeeDetails(employeeInfoMap, Id)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const homePage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Employee",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Form",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: nameControler,
                    decoration: InputDecoration(
                        hintText: "Enter name", border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Age",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: ageControler,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                      hintText: "Enter Age",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: locationControler,
                    decoration: InputDecoration(
                        hintText: "Enter Location", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Container(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () async {
                              addData(
                                  nameControler.text.toString(),
                                  ageControler.text.toString(),
                                  locationControler.text.toString());
                            },
                            child: Text("Add"))))
              ],
            ),
          ),
        ]));
  }
}
