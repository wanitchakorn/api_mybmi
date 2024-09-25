import 'package:flutter/material.dart';
import 'package:api_mybmi/BMImodel.dart';
import 'BMImodel.dart';

class BMIresultPage extends StatefulWidget {
  BMIresultPage({Key? key, required this.bmidata, required this.interpretation});
  final Bmidata  bmidata;
  final String interpretation;

  @override
  State<BMIresultPage> createState() => _BMIresultPageState();
}

class _BMIresultPageState extends State<BMIresultPage> {
  late var _weight, _height, _bmi, _interpretation;

  @override
  void initState() {
    super.initState();
    _weight = widget.bmidata.weight!;
    _height = widget.bmidata.height!;
    _bmi = widget.bmidata.bmi!.toStringAsFixed(4);
    _interpretation = widget.interpretation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result of Your BMR'),
        ),
        body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * .6 + 70, //70 for bottom
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 70, // to shift little up
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.6,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: ListTile(
                            title: Text('$_weight kg.',style: TextStyle(color: Colors.black, fontSize: 35)),
                            subtitle: Text('Weight',style: TextStyle(fontSize: 20)),
                            leading: Icon(Icons.height_rounded, size: 70,)),),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: ListTile(
                            title: Text('$_height cm.',style: TextStyle(color: Colors.black, fontSize: 35)),
                            subtitle: Text('Height',style: TextStyle(fontSize: 20)),
                            leading: Icon(Icons.line_weight_rounded, size: 70,)),),
                    ],),),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .4,
                      height: 300,
                      left: 30,
                      right: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                color: Colors.pinkAccent,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(20),
                                title: Center(child: Text('$_bmi',style: TextStyle(color: Colors.white, fontSize: 30))),
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                color: Colors.amber,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(20),
                                title: Text('$_interpretation',style: TextStyle(color: Colors.black, fontSize: 24)),
                                leading:Icon(Icons.check_circle, size: 30,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),),
      );
  }
}
