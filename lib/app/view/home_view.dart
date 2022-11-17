import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_projects/app/services/home_page_services.dart';

import '../model/data_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController eachSideController=TextEditingController();
  TextEditingController totalController=TextEditingController();
  TextEditingController digitController=TextEditingController();
  TextEditingController alphaController=TextEditingController();
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
                            child: Consumer<HomePageServices>(
                                builder: (context, provider, child) {
                              return TextFormField(
                                controller: eachSideController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (value) {
                                  totalController.clear();
                                  digitController.clear();
                                  alphaController.clear();
                                  if (int.parse(value) <= 11) {
                                    provider.setLimitedTotalCheckBox(
                                        int.parse(value));
                                    provider
                                        .setEachSideCheckBox(int.parse(value));
                                    provider.getJsonData();
                                    provider.setMessage(
                                        "how many check boxes you want to select");
                                    provider.setMessageBgColors(true);
                                  } else {
                                    provider.setMessage(
                                        "you can not select more then(11) Boxes");
                                    provider.setMessageBgColors(false);
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
                              );
                            }),
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
                            child: Consumer<HomePageServices>(
                                builder: (context, provider, child) {
                              return TextFormField(
                                controller: totalController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (value) {
                                  if (provider.limitedTotalCheckBox >=
                                      int.parse(value)) {
                                    provider.seTotalCheckBox(int.parse(value));
                                    provider.setMessage(
                                        "please select max no of Alphabet..");
                                    provider.setMessageBgColors(true);
                                    return;
                                  } else {
                                    provider.setMessage(
                                        "You can not select more then${provider.limitedTotalCheckBox}");
                                    provider.setMessageBgColors(false);
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
                              );
                            }),
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
                            child: Consumer<HomePageServices>(
                                builder: (context, provider, child) {
                              return TextFormField(
                                controller: alphaController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (value) {
                                  if (provider.selectingEachSideCheckBox >=
                                      int.parse(value)) {
                                    provider
                                        .setAlphabetCheckBox(int.parse(value));
                                    provider.setMessage(
                                        "please select max no of Digits..");
                                    provider.setMessageBgColors(true);
                                  } else {
                                    provider.setMessage(
                                        "You can not select more then ${provider.selectingEachSideCheckBox}");
                                    provider.setMessageBgColors(false);
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
                              );
                            }),
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
                            child: Consumer<HomePageServices>(
                                builder: (context, provider, child) {
                              return TextFormField(
                                controller: digitController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (value) {
                                  if (provider.selectingEachSideCheckBox >=
                                      int.parse(value)) {
                                    provider.setDigitCheckBox(int.parse(value));
                                    provider.setMessage(
                                        "please select checkBox..!");
                                    provider.setMessageBgColors(true);
                                  } else {
                                    provider.setMessage(
                                        "You can not select more then ${provider.selectingEachSideCheckBox}");
                                    provider.setMessageBgColors(false);
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
                              );
                            }),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              height: MediaQuery.of(context).size.height - 120,
              child: FutureBuilder<List<DataModel>>(
                  future: HomePageServices().getJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Consumer<HomePageServices>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.selectingEachSideCheckBox,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(snapshot.data![index].alpha),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: provider
                                  .alphabetMap[snapshot.data![index].alpha],
                              onChanged: (val) {
                                if (provider.alphaValue <
                                    provider.selectingAlphabetCheckBox) {
                                  provider.setAlpha(provider.alphabetMap[
                                              snapshot.data![index].alpha] ==
                                          true
                                      ? provider.alphaValue - 1
                                      : provider.alphaValue + 1);
                                  log("alphaValue${provider.alphaValue}");
                                  provider.setAlphaMap(
                                      key: snapshot.data![index].alpha);
                                  provider.setMessage("You select alpha check box${provider.alphaValue}");
                                  provider.setMessageBgColors(true);
                                }
                                else {
                                  provider.setMessage("You can not select more then alpha check box ${provider.selectingAlphabetCheckBox}");
                                  provider.setMessageBgColors(false);

                                }
                              },
                            );
                          },
                        );
                      });
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(child: Text("Something is Wrong..!"));
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: 1,
              color: Colors.black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              height: MediaQuery.of(context).size.height - 120,
              child: FutureBuilder<List<DataModel>>(
                  future: HomePageServices().getJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Consumer<HomePageServices>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.selectingEachSideCheckBox,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(snapshot.data![index].digit),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: provider
                                  .digitMap[snapshot.data![index].digit],
                              onChanged: (val) {
                                if (provider.digitValue <
                                    provider.selectingDigitCheckBox) {
                                  provider.setDigit(provider.digitMap[
                                              snapshot.data![index].digit] ==
                                          true
                                      ? provider.digitValue - 1
                                      : provider.digitValue + 1);
                                  log("alphaValue${provider.digitValue}");
                                  provider.setDigitMap(
                                      key: snapshot.data![index].digit);
                                  provider.setMessage("You select digit check box${provider.digitValue}");
                                  provider.setMessageBgColors(true);
                                } else {
                                  provider.setMessage("You can not select more then digit check box ${provider.selectingDigitCheckBox}");
                                  provider.setMessageBgColors(false);
                                }
                              },
                            );
                          },
                        );
                      });
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(child: Text("Something is Wrong..!"));
                  }),
            ),
          ],
        ),
        bottomSheet: Row(
          children: [
            Expanded(
                flex: 2,
                child: Consumer<HomePageServices>(
                  builder: (context,provider,child) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          eachSideController.clear();
                          totalController.clear();
                          digitController.clear();
                          alphaController.clear();
                          provider.setDigitCheckBox(0);
                          provider.setAlphabetCheckBox(0);
                          provider.getJsonData();
                          provider.setMessageBgColors(true);
                          provider.setMessage("'please select each side Check Box'");
                        });
                      },
                      child: Container(
                        color: Colors.purple,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Clear All \nField",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                )),
            Expanded(
                flex: 8,
                child: Consumer<HomePageServices>(
                    builder: (context, provider, child) {
                  return Container(
                      color: provider.messageBgColor == true
                          ? Colors.green
                          : Colors.red,
                      height: 50,
                      child: Center(
                        child: Text(provider.message),
                      ));
                })),
          ],
        ),
      ),
    );
  }
}
