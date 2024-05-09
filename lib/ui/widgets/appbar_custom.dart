import 'package:challenge_meli/ui/widgets/search_appbar_custom.dart';
import 'package:challenge_meli/utils/constans.dart';
import 'package:challenge_meli/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final TextEditingController? searchController;
  final bool? enabled;
  final void Function(String)? onChangedText;
  final FocusNode? focusNode;

  const CustomAppBar({
    this.searchController,
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.enabled = false,
    this.onChangedText,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Utils.showFunctionalityInDevelopmentMessage(context);
        },
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.searchList);
            },
            child: CustomSearchBox(
              enabled: enabled!,
              controller: searchController ?? TextEditingController(),
              hintText: 'Buscar producto',
              onChanged: onChangedText,
              focusNode: focusNode,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Utils.showFunctionalityInDevelopmentMessage(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
