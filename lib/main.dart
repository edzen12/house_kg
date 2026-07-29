import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f7),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              _topSection(),
              _categoriesSection(),
              // _locationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _topSection() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 18, right: 18, top: 54, bottom: 24),
    color: Color(0xffe52f00),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.25),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(Icons.menu, color: Colors.white, size: 31),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.blueGrey, size: 30),
                SizedBox(width: 9),
                Text(
                  'Я ищу...',
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.25),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(Icons.search, color: Colors.white, size: 31),
        ),
      ],
    ),
  );
}

Widget _categoriesSection() {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.house_outlined, 'title': 'Продажа'},
    {'icon': Icons.key_outlined, 'title': 'Аренда'},
    {'icon': Icons.bed_outlined, 'title': 'Посуточно'},
    {'icon': Icons.fact_check_outlined, 'title': 'Проверка недвижимости'},
    {'icon': Icons.business_center_outlined, 'title': 'Компании'},
    {'icon': Icons.apartment_outlined, 'title': 'Новостройки'},
    {'icon': Icons.engineering_outlined, 'title': 'Застройщики'},
    {'icon': Icons.beach_access_outlined, 'title': 'Иссык-Куль'},
    {'icon': Icons.map_outlined, 'title': 'Районы Бишкека'},
    {'icon': Icons.show_chart_outlined, 'title': 'Статистика цен'},
    {'icon': Icons.bolt_outlined, 'title': 'Срочные объявления'},
    {'icon': Icons.post_add_outlined, 'title': 'Подать объявление'},
  ];

  return Container(
    color: Colors.white,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffeeeeee), width: 0.6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category['icon'], color: const Color(0xffa9819b), size: 25),
              const SizedBox(height: 6),
              Text(
                category['title'],
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  height: 1.1,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
