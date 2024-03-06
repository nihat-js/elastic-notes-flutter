import 'package:flutter/material.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCity = 'New York'; // Initial selected city

  List<String> _cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCity,
              items: _cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCity = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'City',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press (e.g., save post to Firestore)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button color
                foregroundColor: Colors.white, // Text color
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Create Post', style: TextStyle(fontSize: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    _descriptionController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
