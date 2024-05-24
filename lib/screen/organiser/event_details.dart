import 'package:eventhub/model/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventhub/screen/organiser/myevent.dart';
import 'package:eventhub/screen/organiser/create_event.dart';
import 'package:eventhub/screen/profile/profile_screen.dart';
import 'package:eventhub/screen/login_page.dart';
import 'package:eventhub/screen/organiser/organiser_homepage.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black, // Set background color to black
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 100, 8, 222),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            _logoutAndNavigateToLogin(context);
          },
          icon: const Icon(Icons.logout),
          color: Colors.white,
        ),
      ],
      title: Text(
        "Event Details",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Set app bar text color to white
        ),
      ),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            event.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          SizedBox(height: 16.0),
          Text(
            event.event,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 8.0),
          Text(
            'Date & Time: ${DateFormat.yMMMMd().add_jm().format(event.date)}',
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 8.0),
          Text(
            'Location: ${event.location}',
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 8.0),
          Text(
            'Fee: ${event.fee.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 8.0),
          Text(
            'Category: ${event.category}',
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 8.0),
          Text(
            'Details: ${event.details}',
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      color: const Color.fromARGB(255, 100, 8, 222),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FooterIconButton(
            icon: Icons.home,
            label: "Home",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrganiserHomePage(passUser: null,),
                ),
              );
            },
          ),
          FooterIconButton(
            icon: Icons.event,
            label: "My Event",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyEvent(),
                ),
              );
            },
          ),
          FooterIconButton(
            icon: Icons.create,
            label: "Create Event",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateEventPage(),
                ),
              );
            },
          ),
          FooterIconButton(
            icon: Icons.person,
            label: "Profile",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}


  void _logoutAndNavigateToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false,
    );
  }
}

class FooterIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const FooterIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
