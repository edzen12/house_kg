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
              _locationSection(),
              Expanded(child: _propertiesSection()),
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

Widget _locationSection() {
  return Container(
    width: double.infinity,
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.blue, size: 28),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Чуйская область / Бишкек',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.black54),
      ],
    ),
  );
}

Widget _propertiesSection() {
  final properties = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStDTBaTMGdWCc-7atyWfaoafY5BOxM8aDm8N93v__taJ1Tw5AMXSYHgTg&s=10',
      'priceDollar': '\$275000',
      'priceSom': '24 084 500 сом',
      'monthly': 'от 167 514 сом / мес',
      'description': 'Продажа • комм. недв. \n131 м2',
      'time': '2 часа назад',
      'views': '194',
      'premium': true,
      'urgent': true,
      'vip': false,
      'owner': true,
    },
    {
      'image': 'https://picsum.photos/200/300',
      'priceDollar': '\$175000',
      'priceSom': '14 084 500 сом',
      'monthly': 'от 887 514 сом / мес',
      'description': 'Продажа • комм. недв. \n131 м2',
      'time': '23 часа назад',
      'views': '6594',
      'premium': true,
      'urgent': false,
      'vip': true,
      'owner': false,
    },
    {
      'image': 'https://picsum.photos/200/300',
      'priceDollar': '\$175000',
      'priceSom': '14 084 500 сом',
      'monthly': 'от 887 514 сом / мес',
      'description': 'Продажа • комм. недв. \n131 м2',
      'time': '23 часа назад',
      'views': '6594',
      'premium': true,
      'urgent': false,
      'vip': true,
      'owner': false,
    },
    {
      'image': 'https://picsum.photos/200/300',
      'priceDollar': '\$175000',
      'priceSom': '14 084 500 сом',
      'monthly': 'от 887 514 сом / мес',
      'description': 'Продажа • комм. недв. \n131 м2',
      'time': '23 часа назад',
      'views': '6594',
      'premium': true,
      'urgent': false,
      'vip': true,
      'owner': false,
    },
  ];
  return GridView.builder(
    padding: EdgeInsets.all(10),
    itemCount: properties.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.68,
    ),
    itemBuilder: (context, index) {
      final property = properties[index];
      return PropertyCard(
        image: property['image'] as String,
        priceDollar: property['priceDollar'] as String,
        priceSom: property['priceSom'] as String,
        monthly: property['monthly'] as String,
        description: property['description'] as String,
        time: property['time'] as String,
        views: property['views'] as String,
        premium: property['premium'] as bool,
        urgent: property['urgent'] as bool,
        vip: property['vip'] as bool,
        owner: property['owner'] as bool,
      );
    },
  );
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String priceDollar;
  final String priceSom;
  final String monthly;
  final String description;
  final String time;
  final String views;
  final bool premium;
  final bool urgent;
  final bool vip;
  final bool owner;

  const PropertyCard({
    super.key,
    required this.image,
    required this.priceDollar,
    required this.priceSom,
    required this.monthly,
    required this.description,
    required this.time,
    required this.views,
    required this.premium,
    required this.urgent,
    required this.vip,
    required this.owner,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.yellow),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    priceDollar,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(priceSom, style: TextStyle(fontSize: 14)),
                  Text(
                    monthly,
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  Text(description, style: TextStyle(fontSize: 14)),
                  Row(children: [Icon(Icons.timelapse_outlined), Text(time)]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
