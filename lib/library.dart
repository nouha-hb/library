import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'dart:ui' as ui;

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  double s = 0;
  int nb = 0;
  List<String> chart = [];

  List<String> supplies = [
    'Schoolbag',
    'Book',
    'pen',
    'pencil',
    'crayon',
    'pencilcase',
    'notebook',
    'eraser',
    'sharpener'
  ];
  List<Image> images = [
    Image.asset('schoolbag.png'),
    Image.asset('book.png'),
    Image.asset('pen.png'),
    Image.asset('pencil.png'),
    Image.asset('crayon.png'),
    Image.asset('pencilcase.png'),
    Image.asset('notebook.png'),
    Image.asset('eraser.png'),
    Image.asset('sharpener.png'),
  ];

  List<double> price = [65.75, 21.3, 5.45, 3.25, 5.2, 15.6, 13.5, 0.5, 1.2];
  TextEditingController suppliesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController chartController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[50],
          onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Add product'),
                  content: SizedBox(
                    height: 200.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('product name'),
                            ),
                            controller: suppliesController,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('price in dinars'),
                            ),
                            controller: priceController,
                          ),
                        ]),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        print(suppliesController.text +
                            '             ' +
                            priceController.text);
                        setState(() {
                          images.add(Image.asset("assets/logo.png"));
                          supplies.add(suppliesController.text);
                          price.add(double.parse(priceController.text));
                        });
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
          child: Icon(
            Icons.add,
            color: Colors.purple,
          )),
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              nb.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.purple[300],
              ),
              padding: EdgeInsets.only(right: 30.0),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.indigo[100],
                  title: Text(
                    'Selected Products',
                    style: TextStyle(
                        fontSize: 30,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 70),
                            const Offset(150, 20),
                            <Color>[
                              Colors.purpleAccent,
                              Colors.yellow,
                            ],
                          )),
                  ),
                  content: SizedBox(
                    height: 200,
                    width: 150,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: ListView.builder(
                            itemCount: chart.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      chart[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Raleway',
                                      ),
                                    ),
                                    const Icon(
                                      Icons.check,
                                      color: Colors.purple,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                s=0.0;
                                chart.clear();
                                nb=0;
                                Navigator.pop(context, );
                                

                              });
                            },
                            icon: Icon(
                              Icons.restart_alt_outlined,
                            )),
                        Text(
                          'Totalprice :' + s.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Buy'),
                      child: const Text('Buy'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.amber[50],
        title: Text(
          'Knowlege requires tools',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[200]),
        ),
        centerTitle: true,
        flexibleSpace: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/logo.png')),
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        childAspectRatio: 01.0,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(supplies.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //image container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.amber[100],
                    ),
                    child:
                        SizedBox(width: 200, height: 150, child: images[index]),
                  ),
                  //price container
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.purple[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            supplies[index] + ' :  ',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            (price[index].toString()),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  //button
                  InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.yellow[200],
                        title: Center(
                          child: Text(
                            'Add to chart ?',
                            style: TextStyle(
                                fontSize: 30,
                                foreground: Paint()
                                  ..shader = ui.Gradient.linear(
                                    const Offset(0, 70),
                                    const Offset(150, 20),
                                    <Color>[
                                      Colors.yellow,
                                      Colors.purpleAccent,
                                    ],
                                  )),
                          ),
                        ),
                        content: SizedBox(
                          height: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  supplies[index],
                                  style: TextStyle(
                                      color: Colors.purple[500], fontSize: 20),
                                ),
                                Text(
                                  price[index].toString() + " dinars",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                nb = nb + 1;
                                s = s + price[index];
                                chart.add(supplies[index]);
                              });
                              print(chart);
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Purchase',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
