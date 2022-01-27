import 'package:flutter/material.dart';
import 'package:flutter_drawer_example/privacy_policy.dart';
import 'package:flutter_drawer_example/send_feedback.dart';
import 'package:flutter_drawer_example/settings.dart';

import 'package:anim_search_bar/anim_search_bar.dart';

import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'my_drawer_header.dart';
import 'notes.dart';
import 'notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;


  bool a = true;
  var b = TextEditingController();






  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Material(

      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              AnimSearchBar(
                  color: Colors.red,
                  closeSearchOnSuffixTap: true,
                  autoFocus: true,



                  width: MediaQuery.of(context).size.width*0.75, textController: b, onSuffixTap:(){


              })

            ],
          ),
        ),
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(

              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Profile", Icons.person,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Patients", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Services", Icons.health_and_safety,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Medicines", Icons.medication,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Reception Control", Icons.remove_red_eye,
              currentPage == DrawerSections.settings ? true : false),

          menuItem(6, "Document Gallery", Icons.image,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Setting", Icons.settings,
              currentPage == DrawerSections.privacy_policy ? true : false),
          Divider(),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
