import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> category = [
    'Dhosa',
    'VadaPav',
    'Sandwich',
    'Burgers',
    'Burritos',
    'Pasta',
    'Scrambled Eggs',
    'Ham',
    'Quesadilla'
  ];
  List<String> images = [
    'dhosa.jpg',
    'vadapav.jpg',
    'sandwich.jpg',
    'burger.jpg',
    'burrito.jpg',
    'pasta.jpg',
    'egg.jpg',
    'Ham.jpg',
    'quesadilla.jpg'
  ];

  List<int> price = [150, 210, 410, 230, 110, 220, 200, 180, 250];
  List<bool> mycheck = List.filled(9, false);
  List<int> qty = List.filled(9, 0);
  List<int> subtotal = List.filled(9, 0);
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          title: Text('Order App'),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: category.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(0.1),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    category[index],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('₹${price[index]}'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 28,
                    child: CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage('assets/${images[index]}')),
                  ),
                  trailing: Container(
                    height: 70,
                    width: 160,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (mycheck[index] && qty[index] > 1) {
                                    qty[index]--;
                                    total = total - price[index];
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                          Text('${qty[index]}'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (mycheck[index]) {
                                    qty[index]++;
                                    total = total + price[index];
                                  }
                                });
                              },
                              icon: Icon(Icons.add_box_outlined)),
                          Checkbox(
                            value: mycheck[index],
                            onChanged: (value) {
                              setState(() {
                                mycheck[index] = value!;
                                subtotal[index] = qty[index] * price[index];
                                if (mycheck[index]) {
                                  qty[index] = 1;
                                  subtotal[index] = qty[index] * price[index];
                                  total = total + subtotal[index];
                                } else {
                                  qty[index] = 0;
                                  total = total - subtotal[index];
                                }
                              });
                            },
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Total',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '₹ $total',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
