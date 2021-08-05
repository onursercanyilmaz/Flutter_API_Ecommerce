import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                    "https://fenerium.com/assets/img/subscribe-bg-img.png"),
              ),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(

                          height: 410,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(60.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),

                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(60.0)),

                          child: Container(

                            height: 400.0,
                            width: double.infinity,
                            color: const Color(0xffEDEEF0),
                            child: Center(
                              child: Image.network("https://odtukaltev.com.tr/wp-content/uploads/2018/04/person-placeholder.jpg", alignment: Alignment.topCenter,scale: 2,),

                              /*SvgPicture.network(
                         "https://fenerium.com/images/logo.svg"),
                     NetworkImage(
                       "https://fenerium.com/assets/img/subscribe-bg-img.png"), */
                            ),


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 375),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1D2F75),
                                    borderRadius: BorderRadius.circular(40)),
                                width: 200,
                                height: 50,
                                child: Center(child: Text("Empty", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 33),))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [Center(child: Text("Name Surname Connection", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,))],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 100,
                    ),

                    SizedBox(
                      width: 300,
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.elliptical(50, 50)),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue,

                          child: Center(
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                color: const Color(0xff1D2F75),
                                onPressed: () {

                                },
                                child: const Text(
                                  "Sepete Ekle",
                                  style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ]),
            ),
          ),
        ));
  }
}
