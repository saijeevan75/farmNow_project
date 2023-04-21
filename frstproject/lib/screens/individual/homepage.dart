import 'package:flutter/material.dart';

class IndividualUI extends StatefulWidget {
  const IndividualUI({super.key});

  @override
  State<IndividualUI> createState() => _IndividualUIState();
}

class _IndividualUIState extends State<IndividualUI> {
  int _selectedIndex = 0;
  int currentIndex = 0;

  final List<Widget> _widgetOptions = [
    // Replace these with your own views/screens
    Text('Home'),
    Text('Search'),
    Text('Favorites'),
    Text('Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Anvith!"),
        backgroundColor: Colors.green[800],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/farmnow.png",
                        color: Colors.white,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "FarmNow",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              "Explore the endless possibilities of agriculture!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Text(
                                  "Browse Farms",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available Farms",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green[800]),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                // color: Colors.white,
                color: Colors.grey[300],
                height: 280,
                width: MediaQuery.of(context).size.width/1.2,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 6),
                                  color: Colors.black.withOpacity(1),
                                  blurRadius: 20,
                                  spreadRadius: 9,
                                ),
                              ]),
                          // margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width/1.23,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                          width: MediaQuery.of(context).size.width/1.23,

                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/farm2.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Farm - 1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text("City"),
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Price - 100/-"),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add_circle)),
                                        const SizedBox(
                                          width: 46,
                                        ),
                                       
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.green[800],
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.black,
      //   iconSize: 27,
      //   currentIndex: currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "Profile",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: "My Activity",
      //     ),
      //   ],
      // ),
    );
  }
}
