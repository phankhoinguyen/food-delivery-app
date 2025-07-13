import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/setting_tile.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';
import 'package:food_delivery/features/setting/profile/presentation/cubits/profile_cubits.dart';
import 'package:food_delivery/features/setting/profile/presentation/pages/profile_page.dart';
import 'package:food_delivery/core/theme/my_color.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubits = context.read<ProfileCubits>();
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'General',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 15),
            SettingTile(
              text: 'Personal Info',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => BlocProvider.value(
                          value: profileCubits,
                          child: const ProfilePage(),
                        ),
                  ),
                );
              },
              imgUrl: 'assets/icons/profile_setting.png',
              color: MyColor.primary,
            ),
            const SizedBox(height: 20),
            SettingTile(
              text: 'Address',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressPage()),
                );
              },
              imgUrl: 'assets/icons/location_setting.png',
              color: MyColor.myBlue,
            ),
          ],
        ),
      ),
    );
  }
}
