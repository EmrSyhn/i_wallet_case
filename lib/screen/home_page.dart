import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_api_controller.dart';
import 'package:i_wallet_case/model/user_model.dart';
import 'package:i_wallet_case/model/user_photo.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserApiController _ = Get.put(UserApiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('I Wallet Case App'),
      ),
      body: body(_),
    );
  }

  SafeArea body(UserApiController _) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: FutureBuilder(
            future: _.apiConnections(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return content(_);
              }
            },
          ),
        ),
      );

  Widget content(UserApiController _) {
    return SingleChildScrollView(
      child: Column(
        children: [
          userSearch(_),
          userList(_),
        ],
      ),
    );
  }

  Card userSearch(UserApiController _) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _.searchController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    _.search('');
                    _.searchController.clear();
                  },
                  icon: const Icon(Icons.clear_rounded)),
              hintText: 'Kullanıcı Arama',
              border: InputBorder.none),
          onChanged: (value) {
            _.search(value);
          },
        ),
      ),
    );
  }

  Widget userList(UserApiController _) {
    return Obx(() {
      final users = _.filteredUsers;
      final userPhoto = _.userPhoto;

      if (users.isEmpty) {
        return const Center(child: Text('Kullanıcı Bulunamadı'));
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final e = users[index];
            final p = userPhoto[e.id! - 1];

            return Card(
              child: ListTile(
                title: Text(e.name.toString()),
                subtitle: Text(e.username.toString()),
                leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const NetworkImage('https://l24.im/31Vfs'),
                    foregroundImage: NetworkImage(p.downloadUrl.toString())),
                trailing: IconButton(
                    onPressed: () => userDialog(context, p, e),
                    icon: const Icon(Icons.arrow_forward_ios)),
              ),
            );
          },
        );
      }
    });
  }

  Future<dynamic> userDialog(BuildContext context, UserPhoto p, UserModel e) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const NetworkImage('https://l24.im/31Vfs'),
                    foregroundImage: NetworkImage(p.downloadUrl.toString())),
                Text(e.name.toString(), style: style()),
                Text(e.username.toString(), style: themeTextStyle(context)),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leadingAndTrailingTextStyle: leadingStyle(context),
                    leading: const Text('Email:'),
                    title: Text(e.email.toString())),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leadingAndTrailingTextStyle: leadingStyle(context),
                    leading: const Text('Telefon:'),
                    title: Text(e.phone.toString())),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leadingAndTrailingTextStyle: leadingStyle(context),
                    leading: const Text('Adres:'),
                    title: Text(e.address!.street.toString())),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leadingAndTrailingTextStyle: leadingStyle(context),
                    leading: const Text('Şehir:'),
                    title: Text(e.address!.city.toString())),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    leadingAndTrailingTextStyle: leadingStyle(context),
                    visualDensity: VisualDensity.compact,
                    leading: const Text('Konum:'),
                    title:
                        Text('${e.address!.geo!.lat}/${e.address!.geo!.lng}')),
              ],
            ),
          );
        });
  }

  TextStyle? themeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  TextStyle? leadingStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;

  TextStyle style() =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
