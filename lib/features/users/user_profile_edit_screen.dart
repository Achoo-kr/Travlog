import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';

class UserProfileEditScreen extends ConsumerStatefulWidget {
  const UserProfileEditScreen({Key? key}) : super(key: key);

  @override
  UserProfileEditScreenState createState() => UserProfileEditScreenState();
}

class UserProfileEditScreenState extends ConsumerState<UserProfileEditScreen> {
  late TextEditingController _bioController;
  late TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    final user = ref.read(usersProvider);
    _bioController = TextEditingController(text: user.value!.bio);
    _linkController = TextEditingController(text: user.value!.link);
  }

  @override
  void dispose() {
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    final updatedBio = _bioController.text;
    final updatedLink = _linkController.text;
    ref.read(usersProvider.notifier).updateProfile(updatedBio, updatedLink);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          IconButton(
            onPressed: _onSavePressed,
            icon: const FaIcon(
              FontAwesomeIcons.floppyDisk,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          children: [
            const Text("Bio"),
            const SizedBox(height: 8),
            TextField(
              controller: _bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Edit your bio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Link"),
            const SizedBox(height: 8),
            TextField(
              controller: _linkController,
              decoration: const InputDecoration(
                hintText: 'Edit your link',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
