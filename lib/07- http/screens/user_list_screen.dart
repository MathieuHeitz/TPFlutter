import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatefulWidget {

  const UserListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UserListScreen();

}

class _UserListScreen extends State<UserListScreen>{

  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureUsers = fetchUsers();
  }


  Future<List<User>> fetchUsers() async {

    try {

      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if(response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw new Exception('Erreur serveur code ${response.statusCode}');
      }

    } catch(e) {
      throw new Exception('Erreur serveur : code $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(title: const Text('Liste de users')),
      body: FutureBuilder(
        future: _futureUsers,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError) {
            return Center(child : Text('Erreur ${snapshot.error}'));
          } else {
            final users = snapshot.data!;

            return ListView.builder(
                itemCount:  users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title : Text(user.name),
                    subtitle: Text(user.email, style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),),
                    leading: CircleAvatar(
                        child: Text(user.name[0])
                    ),
                    trailing: IconButton(onPressed: () => print("click"), icon: Icon(Icons.edit)),
                  );
                }
            );
          }
        },
      ),

    );
  }

}