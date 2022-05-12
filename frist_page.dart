import 'package:flutter/material.dart';
import 'package:task_update/models.dart';

import 'modeldata.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<PriceModel> foodList = [];
  List<int> selectitem = [];
  bool isChecked = false;
  int addItem = 0;

  
  @override
  void initState() {
    super.initState();
    foodList = Data.getFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: builder));
                    },
                    child: Text(
                      "$addItem",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: foodList.length,
                  itemBuilder: (context, index) =>
                      foodfeeds(index, foodList[index])),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodfeeds(int index, PriceModel data) {
    return ListTile(
      title: Text("${data.name}"),
      subtitle: Text("${data.price}"),
      trailing: Checkbox(
        onChanged: (value) => item(foodList[index], value),
        value: selectitem.contains(foodList[index].id),
      ),
    );
  }

  item(PriceModel data, bool value) {
    setState(() {
      if (selectitem.contains(data.id)) {
        selectitem.remove(data.id);
      } else {
        selectitem.add(data.id);
      }
      if (value) {
        addItem += data.price;
      } else {
        addItem = addItem - data.price;
      }
    });
  }
}
