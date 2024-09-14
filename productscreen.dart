import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final TextEditingController item = TextEditingController();
  List<String> items = ['Laptop', 'Smartwatch', 'Sunglasses', 'Scarf'];

  void additem() {
    final newitem = item.text;
    if (newitem.isNotEmpty) {
      setState(() {
        items.add(newitem);
      });
      item.clear();
    }
  }

  void deleteitem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Chronicles",
          style: TextStyle(fontSize: 29, color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Your cart is waiting. Fill it with joy!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: item,
                decoration: InputDecoration(
                    hintText: "Enter an item",
                    prefixIcon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black45,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black45, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.pink.shade700, width: 2))),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: additem,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text('Add Item',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        deleteitem(index);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Item removed"),
                          duration: Duration(seconds: 2),
                        ));
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(items[index]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
