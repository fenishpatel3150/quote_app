import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/view/LikeScreen/LikeScreen.dart';

import '../../controller/Quotes/QuotesController.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    QuotesController quotesController = Get.put(QuotesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply),
        ),
        title: Text(
          'Favorite',
          style: GoogleFonts.lato(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.purple.shade50,
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: quotesController.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (width / 2 - 20) / 100,
        ),
        itemBuilder: (context, index) {
          List<String> category = quotesController.categories.toList();
          return GestureDetector(
            onTap: () {
              // Pass the selected category to LikeScreen
              Get.to(() => LikeScreen(category: category[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  category[index],
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}