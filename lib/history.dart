import 'package:flutter/material.dart';
import 'package:novalab_interp/prefs_service.dart';

class MyHistory extends StatefulWidget {
  MyHistory({Key? key}) : super(key: key);

  @override
  State<MyHistory> createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  String? fact;
  getCats() async {
    String? fact1 = await Prefs.loadInfo();
    setState(() {
      fact = fact1;
    });
    print('fact1- $fact1');
  }

  String? date;
  getDate() async {
    String? date1 = await Prefs.loadDate();
    setState(() {
      date = date1;
    });
    print('fact1- $date1');
  }

  Future getInfos() async {
    await getCats();
    await getDate();
  }

  @override
  void initState() {
    super.initState();
    getInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('my history')),
        body: FutureBuilder(
            future: getInfos(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(fact!),
                    Text(date!),
                  ],
                ),
              );
            }));
  }
}
