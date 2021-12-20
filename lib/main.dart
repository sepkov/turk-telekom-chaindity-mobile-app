import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chaindity Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Chaindity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget bodyFunction() {
    switch (_page) {
      case 0:
        return MainPage();
        break;
      case 1:
        return AddPage();
        break;
      case 2:
        return TwoFARoute();
        break;
      default:
        return ProfilePage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: bodyFunction(),
      bottomNavigationBar: BottomNavigationBar(
        key: _bottomNavigationKey,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Ekle'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: '2FA'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil')
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class TwoFARoute extends StatelessWidget {
  const TwoFARoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "2 FA Keyleriniz",
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
        TwoFACard(twofakey: Random().nextInt(999999).toString()),
      ],
    );
  }
}

class TwoFACard extends StatelessWidget {
  const TwoFACard({Key? key, required this.twofakey}) : super(key: key);

  final String twofakey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                twofakey,
                style: const TextStyle(fontSize: 50),
              ),
              const Spacer(),
              const Icon(
                Icons.delete,
                size: 50,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TTInfoRoute extends StatelessWidget {
  const TTInfoRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Türk Telekom Kimliğim"),
      ),
      body: Column(
        children: [
          const Center(
              child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "TTNET Kimlik Bilgileri",
                style: TextStyle(fontSize: 30),
              ),
            ),
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Hizmet Num.: 1234567",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Türk Telekom Kimlik Bilgileri",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Tel Num.:+90 555 555 55 55",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _AddCreditCardRoute extends StatefulWidget {
  const _AddCreditCardRoute({Key? key}) : super(key: key);

  @override
  State<_AddCreditCardRoute> createState() => AddCreditCardRoute();
}

class AddCreditCardRoute extends State<_AddCreditCardRoute> {
  String creditCardNumber = "";
  String creditCardExpiry = "";
  String creditCardCVV = "";
  String creditCardOwner = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Kredi Kartı Bilgisi"),
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                "Kredi Kartı Sahibi Adı",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    creditCardOwner = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "Ahmet Kodlayan",
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Kredi Kartı Numarası",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (val) {
                    creditCardNumber = val;
                  },
                  decoration: const InputDecoration(
                      hintText: "XXXX-XXXX-XXXX-XXXX",
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Son Kullanma",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (val) {
                    creditCardExpiry = val;
                  },
                  decoration: const InputDecoration(
                      hintText: "XX-XX", hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const Center(
              child: Text(
                "CVV",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (val) {
                    creditCardCVV = val;
                  },
                  decoration: const InputDecoration(
                      hintText: "XXX", hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(creditCardNumber);
                  print(creditCardOwner);
                  print(creditCardExpiry);
                  print(creditCardCVV);
                },
                child: const Text(
                  "Kaydet",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Profil Bilgilerim",
              style: TextStyle(fontSize: 30),
            ),
          ),
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Kullanıcı Adı: ShellWizards",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Pub Key: 0x123456789....",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ))
      ],
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Yeni Kimlik Ekle",
              style: TextStyle(fontSize: 30),
            ),
          ),
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MainScreenNavigateCard(
                  label: "Türk Telekom\nKimliği",
                  imagePath: "assets/main_page/ttlogo.jpeg",
                ),
                MainScreenNavigateCard(
                  label: "Bilişim Vadisi\nKimliği",
                  imagePath: "assets/main_page/bvlogo.jpeg",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainScreenNavigateCard(
                  label: "Felan Bank\nKimliği",
                  imagePath: "assets/main_page/ccard.png",
                  clickFunction: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _AddCreditCardRoute()),
                    ),
                  },
                ),
                const MainScreenNavigateCard(
                  label: "Yeni Kimlik",
                  imagePath: "assets/main_page/qr.png",
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.filter_list),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    'Türk Telekom',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    'Kartlar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    'Sık Kulla.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainScreenNavigateCard(
                    label: "Türk Telekom\nMüşteri Bilgilerim",
                    imagePath: "assets/main_page/ttlogo.jpeg",
                    clickFunction: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TTInfoRoute()),
                      ),
                    },
                  ),
                  const MainScreenNavigateCard(
                    label: "Bilişim Vadisi\nGiriş Kartım",
                    imagePath: "assets/main_page/bvlogo.jpeg",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MainScreenNavigateCard(
                    label: "TR - Açık Kaynak\nOkul Bilgilerim",
                    imagePath: "assets/main_page/books.png",
                  ),
                  MainScreenNavigateCard(
                    label: "Felan Bank\nBilgilerim",
                    imagePath: "assets/main_page/ccard.png",
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

@immutable
class MainScreenNavigateCard extends StatelessWidget {
  const MainScreenNavigateCard({
    Key? key,
    required this.label,
    required this.imagePath,
    this.clickFunction,
  }) : super(key: key);

  final String label;
  final String imagePath;
  final void Function()? clickFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: clickFunction,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                  width: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                    ),
                    const Icon(Icons.navigate_next)
                  ],
                )
              ],
            )),
      ),
    );
  }
}
