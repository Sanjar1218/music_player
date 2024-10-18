import 'package:flutter/material.dart';
import 'package:music_player/core/functions/shared_prefs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController chatIdController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SharedPrefs.saveBotToken(tokenController.text);
          SharedPrefs.saveChatId(int.parse(chatIdController.text));
          chatIdController.text = '';
          tokenController.text = '';
        },
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Chat_id'),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: chatIdController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Token'),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: tokenController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
