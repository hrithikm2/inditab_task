import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, required this.title, this.isBackButton = false, this.actions})
      : super(key: key);
  final String title;
  final bool isBackButton;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.maxFinite, kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        title: title.text.black.make(),
        leading: isBackButton
            ? const BackButton(
                color: Colors.black,
              )
            : Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
