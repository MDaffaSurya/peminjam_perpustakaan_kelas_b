import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightTopBar = MediaQuery.of(context).padding.top;
    double bodyHeight = height - heightTopBar;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: const Color(0xFF121212),
        titleSpacing: 0,
        title: Text(
          "Update Profile",
          style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        ),
        iconTheme: const IconThemeData(color:Colors.white),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            width: width,
            height: bodyHeight,
            color: const Color(0xFFFFFF),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(child: kontenUpdateProfile(width)),
            ),
          ),
        ),
      ),
    );
  }

  Widget kontenUpdateProfile(double width){
    return Obx((){
      var dataProfile = controller.detailProfile.value;

      if(controller.detailProfile.value == null){
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF0000)),
            ),
          ),
        );
      }else{
        return Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),



              const SizedBox(
                height: 10,
              ),

              Text(
                dataProfile!.username.toString(),
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                dataProfile!.email.toString(),
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  // obsureText: false,
                ),

              ),

              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  // obsureText: false,
                ),

              ),

              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  // obsureText: false,
                ),

              ),
              const SizedBox(
                height: 50,
              ),

              SizedBox(
                width: width,
                height: 50,
                child: ElevatedButton(
                  onPressed: ()=> controller.updateProfilePost(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Obx(() => controller.loading.value?
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ): const Text(
                    "Update Profile",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
