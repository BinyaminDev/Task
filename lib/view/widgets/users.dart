import 'package:flutter/material.dart';
import 'package:foxy_app/model/model.dart';

class UserGrid extends StatelessWidget {
  final User user;
  const UserGrid({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        
        title: Text(
          user.name,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          user.address.street,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
