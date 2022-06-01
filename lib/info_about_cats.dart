import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:novalab_interp/api_model.dart';
import 'package:novalab_interp/history.dart';
import 'package:novalab_interp/prefs_service.dart';

class CatInfoUI extends StatefulWidget {
  const CatInfoUI({Key? key}) : super(key: key);

  @override
  State<CatInfoUI> createState() => _CatInfoUIState();
}

class _CatInfoUIState extends State<CatInfoUI> {
  List list = [];
  List savedFact = [];
  List savedData = [];

  var a = Random();
  int b = 0;
  var image;
  String date1 = '...';

  Future getInfo() async {
    String url = 'https://cat-fact.herokuapp.com/facts';
    var myUrl = Uri.parse(url);

    var response = await http.get(myUrl);
    List data = jsonDecode(response.body);
    list.clear();
    for (var item in data) {
      list.add(CatInfo.fromJson(item));
    }
    var date11 = DateTime.parse(list[a.nextInt(4)].createdAt);
    //DateFormat.yMEd().add_jms().format(DateTime.now());
    date1 = DateFormat.jm().add_jms().format(date11).toString();
  }

  void saveInfo() async {
    String fact = list[b].text;
    await Prefs.saveInfo(fact);
  }

  void saveData() async {
    String date111 = list[b].createdAt;
    await Prefs.saveDate(date111);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
    saveInfo();
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Cat Infos',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
            future: getInfo(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: list.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Mushuk malumotlari',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            date1,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Image.network(
                            'https://cataas.com/cat/${a.nextInt(4)}',
                            height: 200,
                            width: 200,
                            alignment: Alignment.center,
                          ),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text(list[a.nextInt(4)].text)),
                          const SizedBox(height: 20),
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.lightBlue),
                              onPressed: () {
                                setState(() {
                                  getInfo();
                                });
                              },
                              child: const Text(
                                'Another cat',
                              )),
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.lightBlue),
                              onPressed: () {
                                saveInfo();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => MyHistory()));
                              },
                              child: const Text(
                                'Facts History',
                              ))
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            })

        ///--

        );
  }
}
