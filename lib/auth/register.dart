import 'package:flutter/material.dart';
import 'package:move/auth/login.dart';
import 'package:move/l10n/app_localizations.dart';
import 'package:move/utils/app_assets.dart';
import 'package:move/utils/app_color.dart';
import 'package:move/utils/app_fonts.dart';
import 'package:move/widget/custom_bottom.dart';
import 'package:move/widget/custom_text_faild.dart';

import '../widget/switch.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<String> images = [
    AppAssets.A1,
    AppAssets.A2,
    AppAssets.A3,
    AppAssets.A4,
    AppAssets.A5,
    AppAssets.A6,
    AppAssets.A7,
    AppAssets.A8,
    AppAssets.A9,
  ];

  int currentIndex = 0;
  int? selectedIndex;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.33);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController repassController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        toolbarHeight: 30,
        title: Text(AppLocalizations.of(context)!.register, style: AppFonts.regular20yellow),
        centerTitle: true,
        backgroundColor: AppColor.black,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColor.yellow),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
        
            children: [
              SizedBox(
                height: 190,
                child: PageView.builder(
                  controller: _pageController,
                  physics: selectedIndex != null
                      ? NeverScrollableScrollPhysics()
                      : BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    double scale = currentIndex == index ? 1.8 : 0.9;
        
                    if (selectedIndex != null && selectedIndex != index) {
                      return const SizedBox.shrink();
                    }
        
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: scale, end: scale),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedIndex == index) {
                                  selectedIndex = null;
                                } else {
                                  selectedIndex = index;
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              child: Image.asset(images[index]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
        
              SizedBox(height: 20),
              CustomTextField(
                hint: AppLocalizations.of(context)!.name,
                isPassword: false,
                controller: nameController,
                icon: ImageIcon(AssetImage(AppAssets.name), color: AppColor.whait),
              ),
              SizedBox(height: 25),
              CustomTextField(
                hint: AppLocalizations.of(context)!.email,
                isPassword: false,
                controller: emailController,
                icon: ImageIcon(AssetImage(AppAssets.email), color: AppColor.whait),
              ),
              SizedBox(height: 25),
              CustomTextField(
                hint: AppLocalizations.of(context)!.password,
                isPassword: true,
                controller: passController,
                icon: ImageIcon(AssetImage(AppAssets.pas), color: AppColor.whait),
              ),
              SizedBox(height: 25),
              CustomTextField(
                hint: AppLocalizations.of(context)!.confirmPassword,
                isPassword: true,
                controller: repassController,
                icon: ImageIcon(AssetImage(AppAssets.pas), color: AppColor.whait),
              ),
              SizedBox(height: 25),
              CustomTextField(
                hint: AppLocalizations.of(context)!.phoneNumber,
                isPassword: false,
                controller: phoneController,
                icon: ImageIcon(AssetImage(AppAssets.phone), color: AppColor.whait),
              ),
              SizedBox(height: 25),
              CustomButton(
                text:AppLocalizations.of(context)!.createAccount,
                color: AppColor.yellow,
                borderColor: AppColor.yellow,
                width: width * 0.93,
                height: height * 0.06,
                textFont: AppFonts.inter20black,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.alreadyHaveAccount, style: AppFonts.regular14white),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => Login()),
                      );
                    },
        
                    child: Text(AppLocalizations.of(context)!.login, style: AppFonts.regular14yellow),

                  ),


                ],
              ),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSwitch(),
            ],
          ),
        ]),
      ),
    ));
  }
}
