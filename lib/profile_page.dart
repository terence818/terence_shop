import 'package:flutter/material.dart';
import 'package:terence_app/credit-card-display_page.dart';
import 'package:terence_app/profile-setting_page.dart';
import 'package:terence_app/setting_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> _settings = [
    {'icon': Icons.person, 'name': 'Name', 'route': ProfileSettingsPage()},
    {'icon': Icons.account_balance_wallet,'name': 'My Wallet','route': CreditCardDisplayPage()},
    {'icon': Icons.privacy_tip, 'name': 'Privacy', 'route': SettingPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: ListView.builder(
        itemCount: _settings.length,
        itemBuilder: (BuildContext context, int index) {
          final setting = _settings[index];
          return ListTile(
            leading: Icon(setting['icon']),
            title: Text(setting['name']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setting['route']),
              );
            },
          );
        },
      ),
    );
  }
}
