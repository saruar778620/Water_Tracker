import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_traker/water_consume.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _GlassCountTEControler = TextEditingController(text: "1",);
  List<WaterConsume> _WaterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home", style: TextStyle(fontSize: 20))),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildWaterConsumeBotton(),
              SizedBox(height: 20),
              _buldNoOfClassesTextFild(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History", style: TextStyle(fontSize: 22)),
                    Text(
                      "Total: ${_getTotalWaterConsume()}",
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),
              ),
              Divider(height: 10),
              SizedBox(height: 10),
              _buildWaterTrackListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buldNoOfClassesTextFild() {
    return SizedBox(
      height: 45,
      width: 110,
      child: TextField(
        controller: _GlassCountTEControler,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,

        decoration: InputDecoration(
          label: Text("No of Glass"),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildWaterConsumeBotton() {
    return GestureDetector(
      onTap: _addWaterConsume,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 7),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water_drop_rounded, size: 25),
              Text(
                "Tap here",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWaterTrackListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _WaterConsumeList.length,
        itemBuilder: (context, index) {
          return _buildSingleListItem(_WaterConsumeList[index], index + 1);
        },
      ),
    );
  }

  Widget _buildSingleListItem(WaterConsume waterConsume, int sirialNo) {
    return ListTile(
      leading: CircleAvatar(child: Text("${sirialNo}")),

      title: Text(DateFormat.yMEd().add_jms().format(waterConsume.time)),
      trailing: Text(
        waterConsume.glassCount.toString(),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _addWaterConsume() {
    int glassCount = int.tryParse(_GlassCountTEControler.text) ?? 1;
    WaterConsume waterConsume = WaterConsume(
      time: DateTime.now(),
      glassCount: glassCount,
    );
    _WaterConsumeList.insert(0,waterConsume);
    setState(() {});
  }

  int _getTotalWaterConsume() {
    int totalCount = 0;
    for (WaterConsume waterConsume in _WaterConsumeList) {
      totalCount += waterConsume.glassCount;
    }
    return totalCount;
  }
}


