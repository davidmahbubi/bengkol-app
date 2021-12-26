import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'instant_service.dart';
import 'nearby_repair_shop.dart';
import 'service.dart';
import 'order_list.dart';

class Homepage extends StatelessWidget {

  late GetStorage box;

  List menuList = [
    [Icons.car_repair, 'Servis Kendaraan', ServicePage()],
    [Icons.near_me, 'Layanan Instan', InstantServicePage()],
    [Icons.settings, 'Bengkel Terdekat', NearbyRepairShopPage()],
    [Icons.double_arrow, 'Daftar Order', OrderListPage()],
  ];

  Homepage() {
    box = GetStorage();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Bengkel Online App'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                    child: Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 17
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                    child: Text(
                      box.read('active_user'),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                  ),
                ],
              ),
            ),
            if (box.hasData('active_service'))
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Order Aktif',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      )
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      box.read('active_service'),
                    )),
                    ),
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Scrollbar(
              thickness: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: menuList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    menuList[index][0],
                                    size: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '${menuList[index][1]}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black87
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                if (menuList[index][2] != null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => menuList[index][2]));
                                }
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                        child: ElevatedButton(
                          child: Text("Log Out"),
                          onPressed: (){
                            box.remove('active_user');
                            Navigator.pop(context);
                          },
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}