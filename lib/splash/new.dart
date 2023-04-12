import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  int x = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: x,
                onChanged: (value) {
                  setState(() {
                    x = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text("Radio 1"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: x,
                onChanged: (value) {
                  setState(() {
                    x = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text("Radio 2"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: x,
                onChanged: (value) {
                  setState(() {
                    x = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text("Radio 3"),
            ],
          ),
        ],
      ),
    );
  }
}
