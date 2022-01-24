import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var battery = Battery();

  @override
  void initState() {
    super.initState();
    getBattery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Plus'),
      ),
      body: StreamBuilder<BatteryState>(
          stream: battery.onBatteryStateChanged, builder: (context,snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              return Center(child: Text(snapshot.data!.name.toString()),);
            }
      }),
    );
  }

  void getBattery() async {
    print(await battery.batteryLevel);
  }
}
