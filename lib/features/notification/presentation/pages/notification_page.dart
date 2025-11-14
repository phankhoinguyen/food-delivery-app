import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_event.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_state.dart';
import 'package:food_delivery/features/notification/presentation/components/notification_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationBloc>().add(const GetNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final listItem = state.listNoti;
          if (listItem?.isEmpty == true && state.isLoading == false) {
            return const Center(child: Text('No notifications yet'));
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: listItem!.length,
            itemBuilder:
                (context, index) => NotificationItem(item: listItem[index]),
          );
        },
      ),
    );
  }
}
