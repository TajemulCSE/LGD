import 'package:flutter/material.dart';
import 'package:lgd/providers/user_provider.dart';
import 'package:provider/provider.dart';


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  void initState() {
    super.initState();
    // Fetch user data when screen loads
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).fetchUserData());
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: userProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Email: "),
                      Text(userProvider.email),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Squad Name: "),
                      Text(userProvider.squad),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Whatsapp Number: "),
                      Text(userProvider.whatsapp),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Squad Leader Name: "),
                      Text(userProvider.squadLeaderName),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Role: ${userProvider.role}"),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
