import 'package:flutter/material.dart';
import 'package:slicing2/core.dart';
import 'package:slicing2/state_util.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Theme(
      data: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        key: controller.scaffoldeKey,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                controller.scaffoldeKey.currentState?.openDrawer();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.menu,
                  size: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          title: Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Andrew Garfield"),
                accountEmail: const Text("capek@ngoding.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                otherAccountsPictures: const [
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/women/74.jpg"),
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/men/47.jpg"),
                  // ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text("About"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.rule),
                title: const Text("TOS"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text("Privacy Policy"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text("Logout"),
                onTap: () {},
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160.0,
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1595535373192-fc8935bacd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Limited Perfume\nFor you",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "View More",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Perfume Collection",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 24.0,
                      color: Color.fromARGB(255, 248, 141, 0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  child: Row(
                    children: List.generate(
                      controller.categories.length,
                      (index) {
                        var item = controller.categories[index];
                        bool selected =
                            index == controller.selectedCategoryIndex;
                        return InkWell(
                          onTap: () => controller.updateIndex(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    item["category_name"],
                                    style: TextStyle(
                                      color:
                                          selected ? Colors.black : Colors.grey,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  if (selected)
                                    Container(
                                      height: 2.0,
                                      width: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            26.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                LayoutBuilder(
                  builder: (context, constraint) {
                    double spacing = 10;
                    double size = (constraint.biggest.width - spacing) / 2;
                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: List.generate(
                        controller.products.length,
                        (index) {
                          var item = controller.products[index];
                          bool selected = index == 0;
                          return InkWell(
                            onTap: () => Get.to(ProductDetailView(
                              item: item,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size,
                                  width: size,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item["photo"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.black26,
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: CircleAvatar(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.3),
                                            child: const Icon(
                                              Icons.add,
                                              size: 14.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "${item["product_name"]}",
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "${item["price"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
