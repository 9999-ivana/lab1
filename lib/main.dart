//Ivana Savikj - 181028 - Laboratoriska 1

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораториска 1 - 181028 - Продавница за облека',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> proizvodi = const [
    {
      'name': 'Комплет пижами',
      'image': 'https://image.hm.com/assets/hm/94/68/946841b5f10a43b748ee820d600f9322b60120b7.jpg?imwidth=657',
      'description': 'Пижами со кошула со долги ракави и долен дел од мека вискоза '
          '\n Бр. артикал: 0998802014',
      'price': '\1390 денари',
    },
    {
      'name': 'Џемпер',
      'image': 'https://image.hm.com/assets/hm/d8/a5/d8a55dd7097c7c9415af62d3408c8794314b76b0.jpg?imwidth=1260',
      'description': 'Лабав џемпер, фино плетен на пруги со спуштени раменици.'
          '\n Бр. артикал: 1232306006',
      'price': '\2300 денари',
    },
    {
      'name': 'Јакна',
      'image': 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fc6%2Fcb%2Fc6cb7a7358da1fcff11f683b8ff1a2d807c62e2d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      'description': 'Лесно обложена јакна со меко кадифе со памучни облоги. '
          'Двонасочен патент, спуштени раменици и џепови. '
          '\n Бр. артикал: 1202520005 ',
      'price': '\ 3400 денари',
    },
    {
      'name': 'Фустан',
      'image': 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F08%2Fc2%2F08c238e2b9fa524f1509166ebf511eab94b4a952.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      'description': 'Кратко фустанче со тркалезно деколте и скриен патент.'
          'Ракави со должина 3/4.'
          '\n Бр. артикал: 1202520005 ',
      'price': '\ 1900 денари',
    },

    {
      'name': 'Бунда',
      'image': 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fcd%2F3b%2Fcd3ba0b9d5cc194cf246bfc21bf7b67802978602.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      'description': 'Топла бунда со мека ткаенина со јака, патент и дискретни странични џебови.'
          '\n Бр. артикал: 1252029006 ',
      'price': '\ 4500 денари',
    },

    {
      'name': 'Макси фустан',
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F4b%2Fa9%2F4ba9c975924b33977852907f573591f713b34d67.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'description': 'Фустан долг до глужд, без ракави со меки реси. Дискретно исечен раб со шлиц на задната страна.'
          '\n Бр. артикал: 1260299001 ',
      'price': '\ 3200  денари',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('181028'),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.blueGrey, fontSize: 30),
          toolbarHeight: 75
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: proizvodi.length,
          itemBuilder: (context, index) {
            final item = proizvodi[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: item['name']!,
                      image: item['image']!,
                      description: item['description']!,
                      price: item['price']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 500,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20)
                        ),
                        child: Image.network(
                            item['image']!
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String price;

  const DetailPage({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                height: 600,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 35,
                fontFamily: 'Arial',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Arial',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              price,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}