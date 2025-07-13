import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_color.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.onTap,
    this.onSelectAddress,
    required this.type,
    required this.title,
    required this.address,
    required this.isDefault,
  });
  final VoidCallback onTap;
  final VoidCallback? onSelectAddress;
  final String type;
  final String title;
  final String address;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> typeMap = {
      'home': Image.asset(
        'assets/icons/home.png',
        fit: BoxFit.cover,
        width: 35,
        height: 35,
        color: MyColor.primary,
      ),
      'office': Image.asset(
        'assets/icons/office.png',
        fit: BoxFit.cover,
        width: 35,
        height: 35,
        color: MyColor.myBlue,
      ),
      'others': Image.asset(
        'assets/icons/other.png',
        fit: BoxFit.cover,
        width: 35,
        height: 35,
        color: const Color.fromARGB(255, 241, 14, 147),
      ),
    };
    return GestureDetector(
      onTap: onSelectAddress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 231, 239),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: typeMap[type],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  ),
                  Text(
                    address,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xff6B6E82),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (isDefault)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColor.primary),
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Default',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(
                            color: MyColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0xff6B6E82),
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
