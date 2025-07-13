import 'package:flutter/material.dart';

class InfoEditPage extends StatefulWidget {
  const InfoEditPage({
    super.key,
    required this.appbarTitle,
    required this.onTap,
    required this.field,
  });
  final String field;
  final String appbarTitle;
  final void Function(String newValue) onTap;

  @override
  State<InfoEditPage> createState() => _InfoEditPageState();
}

class _InfoEditPageState extends State<InfoEditPage> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.field);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appbarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                widget.onTap(_controller.text);
                Navigator.of(context).pop();
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Try again!'),
                      content: const Text('Please fill your name'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              width: size.width,
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 231, 239),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20, top: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
