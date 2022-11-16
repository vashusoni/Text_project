import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_projects/app/services/home_page_services.dart';

import '../model/data_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  bool isColors = false;
  String massage = "please select checkBox";
  bool selected = false;
List<bool>boxStatus=[];
  //
  // Random rnd = Random();
  // int min = 7, max = 12;
  int number = 0;


  @override
  void initState() {
  boxStatus.add(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          leadingWidth: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 14,
                        child: Text(
                          "Total No Boxes to be displayed on each side",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: .3,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                              ],
                              onChanged: (value) {
                                int val = int.parse(value);
                                if (val <= 11) {
                                  if (value.length == 2) {
                                    setState(() {
                                      number = int.parse(value);
                                      massage =
                                          "How many boxes do you want to select";
                                    });
                                  }
                                } else if (val > 11) {
                                  setState(() {
                                    massage =
                                        "total number of Box to de displayed on each side not more the 11";
                                  });
                                }
                              },
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  )),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 14,
                        child: Text(
                          "Max No of Total Selection allowed for selection on both the Sides",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: .3,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                              ],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              onChanged: (value) {
                                int val = int.parse(value);
                                if (val <= 22) {
                                  log("max selecting number is$value");
                                  setState(() {
                                    massage = "please select alphabet number";
                                  });
                                } else if (value.length == 2) {
                                  setState(() {
                                    isColors = true;
                                    massage =
                                        "Error:Unable to select as max no of Secting reched(22)";
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  )),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 14,
                        child: Text(
                          "Max No of Alphabets allowed for selecting",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: .3,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                              ],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              onChanged: (value) {
                                setState(() {
                                  int val = int.parse(value);
                                  if (val <= 11) {
                                    if (value.length == 2) {
                                      setState(() {
                                        massage = "please select number";
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      massage =
                                          "you can select alphabets more then 11";
                                    });
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  )),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 14,
                        child: Text(
                          "Max No of Number allowed for selecting",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: .3,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                              ],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              onChanged: (value) {
                                setState(() {
                                  int val = int.parse(value);
                                  if (val <= 11) {
                                    if (value.length == 2) {
                                      setState(() {
                                        massage = "please select checkbox";
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      massage =
                                          "you can not select Number more then 11";
                                    });
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                  )),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              width: MediaQuery.of(context).size.width / 2.1,
              child: FutureBuilder<List<DataModel>>(
                  future: HomePageServices().getJsonData(),
                  builder: (context, alphaSnapShot) {
                    if (alphaSnapShot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: number,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(alphaSnapShot.data![index].alpha),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: boxStatus[index],
                            onChanged: (val) {
                              setState(() {
                                boxStatus[index]=! boxStatus[index];
                                _isChecked = val!;
                              });
                            },
                          );
                        },
                      );
                    } else if (alphaSnapShot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Text("Data not found");
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2.1,
            )
          ],
        ),
        bottomSheet: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.purple,
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(massage),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
