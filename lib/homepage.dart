import 'package:flutter/material.dart';
import 'dummydata.dart';
import 'loginpage.dart'; 

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $username'),
        backgroundColor: Colors.greenAccent, 
      ),
      body: ListView.builder(
        itemCount: vehicleList.length,
        itemBuilder: (context, index) {
          final vehicle = vehicleList[index];
          return Card(
            child: ListTile(
              leading: Image.network(vehicle.imageUrls[0], width: 100),
              title: Text(vehicle.name),
              subtitle: Text('${vehicle.type} - ${vehicle.price}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(vehicle.name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(vehicle.imageUrls[0]),
                          SizedBox(height: 10),
                          Text(vehicle.description),
                          Text('Engine: ${vehicle.engine}'),
                          Text('Fuel Type: ${vehicle.fuelType}'),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.logout),
        backgroundColor: Colors.greenAccent, 
      ),
    );
  }
}
