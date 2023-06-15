import 'package:flutter/material.dart';
import 'package:fluttersigninusingfb/utils/authentication.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final String profileImageLink;
  const Profile(
      {Key? key,
      required this.name,
      required this.email,
      required this.profileImageLink})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: Image.network('${widget.profileImageLink}').image,
            radius: 80,
          ),
          Text('Name: ${widget.name}'),
          Text('Email: ${widget.email}'),
          ActionChip(
            avatar: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () {
              // Authentication.signOut(context: context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    ));
  }
}
