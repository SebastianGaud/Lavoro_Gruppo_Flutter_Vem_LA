import 'package:flutter/material.dart';
import 'package:zdor_app/widgets/recipe_detail/share_buttons.dart';
import 'package:zdor_app/widgets/style/constant.dart';

class ShareRecipe extends StatelessWidget {
  const ShareRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Condividi"),
          const SizedBox(height: 5),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: kOrangeColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Inserisci email per condivisione', //Placeholder text
                contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              ShareButtons(
                imagePath: 'assets/icon_social/share.png',
                onPressed: () {},
              ),
              ShareButtons(
                imagePath: 'assets/icon_social/instagram.png',
                onPressed: () {},
              ),
              ShareButtons(
                imagePath: 'assets/icon_social/facebook.png',
                onPressed: () {},
              ),
              ShareButtons(
                imagePath: 'assets/icon_social/telegram.png',
                onPressed: () {},
              ),
              ShareButtons(
                imagePath: 'assets/icon_social/whatsapp.png',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
