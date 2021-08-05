import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

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

                          height: 110,

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

                            height: 100.0,
                            width: double.infinity,
                            color: const Color(0xffEDEEF0),
                            padding:const EdgeInsets.all(20) ,
                            child: Center(
                              child: TextFormField(),
                              /*SvgPicture.network(
                         "https://fenerium.com/images/logo.svg"),
                     NetworkImage(
                       "https://fenerium.com/assets/img/subscribe-bg-img.png"), */
                            ),


                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child:    SizedBox(
                              width: 200,
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
                                          "Ara",
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),



                  ]),
            ),
          ),
        ));
  }
}
