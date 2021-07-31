import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String imagePath = "";
  final _picker = ImagePicker();

  _getImageFromGallery() async {
    //PickedFile? _image = await _picker.getImage(source:ImageSource.gallery ) ;
    //var _picture = (await _picker.pickImage(source:ImageSource.gallery )) ;
    var _image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = _image!.path;
      //_img = _image;
      //_pic = _picture;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Color(0xff153e71),
              child: Wrap(
                children: [
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('From Gallery', style:TextStyle(color: Colors.white,)),
                      onTap: () {
                        _getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(60.0)),
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          color: Color(0xffCC222B),
                          child: Center(
                            child: Image.asset("lib/assets/jcommerceWhite.png"),

                            /*SvgPicture.network(
                         "https://fenerium.com/images/logo.svg"),
                     NetworkImage(
                       "https://fenerium.com/assets/img/subscribe-bg-img.png"), */
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 200,
                              height: 200,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: const Color(0x00e25d64),
                                    child: imagePath != ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.file(
                                              File(imagePath),
                                              width: 400,
                                              height: 400,
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            width: 500,
                                            height: 500,
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        child: Container(
                            margin: const EdgeInsets.only(left: 30, right: 30),
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            color: const Color(0xffCC222B),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _nameController,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xffff9898)),
                                  filled: true,
                                  fillColor: Color(0xffCC222B),
                                  focusColor: Color(0xffCC222B),
                                  hoverColor: Color(0xffe55c63),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Ürün Adı"),
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  color: const Color(0xffCC222B),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _emailController,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xffff9898)),
                                        filled: true,
                                        fillColor: Color(0xffCC222B),
                                        focusColor: Color(0xffCC222B),
                                        hoverColor: Color(0xffe55c63),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "Ürün Fiyatı"),
                                  )),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  color: const Color(0xffCC222B),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _passwordController,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xffff9898)),
                                        filled: true,
                                        fillColor: Color(0xffCC222B),
                                        focusColor: Color(0xffCC222B),
                                        hoverColor: Color(0xffe55c63),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "Stok Adedi"),
                                  )),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  margin: EdgeInsets.only(left: 30, right: 30),
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  color: const Color(0xffCC222B),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _phoneController,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xffff9898)),
                                        filled: true,
                                        fillColor: Color(0xffCC222B),
                                        focusColor: Color(0xffCC222B),
                                        hoverColor: Color(0xffe55c63),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "Kategori"),
                                  )),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
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
                                // registerShortCut();
                              },
                              child: const Text(
                                "Ürünü Güncelle",
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
                ],
              ),
            ),
          ),
        ));
  }
}
