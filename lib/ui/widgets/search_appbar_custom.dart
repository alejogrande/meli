import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final bool enabled;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const CustomSearchBox({
    super.key,
    this.enabled = false,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.search, color: Colors.grey),
            ),
            Expanded(
                child: TextField(
              controller: controller,
              onChanged: onChanged,
              focusNode: focusNode,
              decoration: InputDecoration(
                enabled: enabled,
                border: InputBorder.none,
                hintText: hintText,
                alignLabelWithHint: true, // Esto alinea el texto con el hint
                contentPadding: const EdgeInsets.symmetric(
                    vertical:
                        10), // Ajusta el padding vertical según sea necesario
              ),
            )),
          ],
        ),
      ),
    );
  }
}
