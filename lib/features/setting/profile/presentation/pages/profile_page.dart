import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/setting/profile/domain/repo/profile_repo.dart';
import 'package:food_delivery/features/setting/profile/presentation/cubits/profile_cubits.dart';
import 'package:food_delivery/features/setting/profile/presentation/cubits/profile_state.dart';
import 'package:food_delivery/features/setting/profile/presentation/pages/info_edit_page.dart';
import 'package:food_delivery/features/setting/profile/presentation/widgets/info_field.dart';
import 'package:food_delivery/features/setting/profile/presentation/widgets/info_label.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void takePic() async {
    final source = ImageSource.camera;
    await context.read<ProfileCubits>().uploadAvatar(source);
  }

  void pickPic() async {
    final source = ImageSource.gallery;
    await context.read<ProfileCubits>().uploadAvatar(source);
  }

  @override
  Widget build(BuildContext context) {
    final profileCubits = context.read<ProfileCubits>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocConsumer<ProfileCubits, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            print(state.msg);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final user = state.user;
            final avatarUrl = user.imgUrl;
            final name = user.name;
            final email = user.email;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFC6AE),
                            shape: BoxShape.circle,
                          ),
                          child:
                              avatarUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: avatarUrl,
                                    placeholder:
                                        (context, url) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                  )
                                  : const Icon(Icons.person, size: 70),
                        ),
                        // ? CircleAvatar(
                        //   radius: 65,
                        //   backgroundColor: const Color(0xffFFC6AE),
                        //   backgroundImage: Cach,
                        // )
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 25,
                                    ),
                                    width: double.infinity,
                                    height: 230,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'Pick Profile Picture',
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.headlineLarge,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                takePic();
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 10,
                                                backgroundColor:
                                                    Colors.grey[100],
                                                fixedSize: Size(
                                                  size.width * .3,
                                                  size.height * .15,
                                                ),
                                                shape: const CircleBorder(),
                                              ),
                                              child: Image.asset(
                                                'assets/icons/camera.png',
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                pickPic();
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 10,
                                                backgroundColor:
                                                    Colors.grey[100],
                                                fixedSize: Size(
                                                  size.width * .3,
                                                  size.height * .15,
                                                ),
                                                shape: const CircleBorder(),
                                              ),
                                              child: Image.asset(
                                                'assets/icons/collection.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const CircleAvatar(
                              radius: 20.5,
                              backgroundColor: MyColor.primary,
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const InfoLabel(text: 'FULL NAME'),
                  const SizedBox(height: 10),
                  InfoField(
                    text: name,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => InfoEditPage(
                                field: name,
                                appbarTitle: 'Edit Name',
                                onTap: (newValue) {
                                  profileCubits.editInfo('name', newValue);
                                },
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const InfoLabel(text: 'EMAIL'),
                  const SizedBox(height: 10),
                  InfoField(
                    text: email,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => InfoEditPage(
                                field: email,
                                appbarTitle: 'Edit Email',
                                onTap: (newValue) {},
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(),
                ],
              ),
            );
          }
          return const Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
