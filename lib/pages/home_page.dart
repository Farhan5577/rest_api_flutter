import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  User? editingUser;

  void clearForm() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    editingUser = null;
  }

  Future<void> submit() async {
    if (editingUser == null) {
      await ApiService.addUser(
        User(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    } else {
      await ApiService.updateUser(
        User(
          id: editingUser!.id,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }

    clearForm();
    setState(() {});
  }

  void edit(User user) {
    usernameController.text = user.username;
    emailController.text = user.email;
    passwordController.text = user.password;
    editingUser = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD User')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(editingUser == null ? 'Tambah' : 'Update'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: ApiService.getUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, i) {
                    final user = users[i];
                    return ListTile(
                      title: Text(user.username),
                      subtitle: Text(user.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => edit(user),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              await ApiService.deleteUser(user.id!);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
