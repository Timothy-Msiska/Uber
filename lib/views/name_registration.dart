import 'package:flutter/material.dart';
import 'package:uber/views/home.dart';

class EnterNamePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.yellow),
        centerTitle: true,
        title: Text(
          'YENDA RIDE',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'ENTER YOUR NAME',
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Use your real name so drivers can identify you faster and easier.',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 20),
            _buildInputField(firstNameController, 'First Name'),
            SizedBox(height: 12),
            _buildInputField(lastNameController, 'Last Name'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (firstNameController.text.trim().isEmpty || lastNameController.text.trim().isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Text(
                        'Incomplete Information',
                        style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Please fill all blank spaces.',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK', style: TextStyle(color: Colors.yellow)),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white12,
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () => controller.clear(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
