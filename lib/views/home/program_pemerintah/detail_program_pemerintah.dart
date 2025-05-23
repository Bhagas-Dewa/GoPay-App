import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProgramPemerintah extends StatelessWidget {
  const DetailProgramPemerintah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Image.asset(
            'assets/banner_pemerintah1.png',
            height: 120,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/banner_pemerintah2.png',
            height: 120,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/banner_pemerintah3.png',
            height: 120,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/banner_pemerintah4.png',
            height: 120,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/banner_pemerintah5.png',
            height: 120,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/banner_pemerintah6.png',
            height: 120,
          ),
        ],
      ),
    );
  }
}