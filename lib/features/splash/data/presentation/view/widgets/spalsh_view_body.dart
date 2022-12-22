import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/features/home/data/presentation/view/home_view.dart';
import 'package:booklyapp/features/splash/data/presentation/view/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin
{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  // late Animation<Offset> slidingAnimation1;
  // late Animation<Offset> slidingAnimation2;
  // late Animation<Offset> slidingAnimation3;

  @override
  void initState() {
    super.initState();
    // عند عمل الانميشن راح يريد قيمة لل vsync حتى يعطي قيمة بنتسابيه منضمة فراح اخلي with SingleTickerProviderStateMixin حتى تقوم بهذا الامر فطية قيمه لل vsync f ب this
    // ولاني عامل AnimationController واحد استخمت SingleTickerProviderStateMixin ولو مستخدم اكثر من AnimationController جا استخدمة غير هذا single
    // slidingAnimation هنا بهاي العملية راح يطيني قيمة هاي الثانية من صفر الى الواحد حت اخليه ياخذ القيم لي اني اريده راح اخليه جوه ال
    initSlidingAnimation();
    navigateToHome();
    // slidingAnimation1 =
    //     Tween<Offset>(begin: const Offset(-5, 10), end: Offset.zero)
    //         .animate(animationController);
    // slidingAnimation2 =
    //     Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero)
    //         .animate(animationController);
    // slidingAnimation3 =
    //     Tween<Offset>(begin: const Offset(5, 10), end: Offset.zero)
    //         .animate(animationController);

    // منا اقوم بعمل الامنيشن
    ////////////////////////////////////////////////////////////////////
    // animationController.animateTo(5,
    //     duration: Duration(seconds: 10), curve: Curves.fastOutSlowIn);
    ///////////////////////////////////////////////////////////////////

    // سويتلهن تعليق لان استخدمة ال AnimatedBuilder
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }



  // هذا ِِAnimationController هو عبارة عن مصدر يبقه مشتغل حتى لو هذا الصفحة راحت هذا الشي يبقه يشتغل
  //  لذالك حتى من يخلص هذا ال ِAnimationController اطفيه او الغية من خلال ال dispose
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  // اذا اريد اشيل اليست ستيت وال addlistener فراح استخدم ال AnimatedBuilder
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        // في ال builder يريد widget اذا ما اريد اطية widget احط شارحه _
        builder: (context, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsDate.logo),
              const SizedBox(
                height: 6,
              ),
              SlidingText(slidingAnimation: slidingAnimation)
            ],
          );
        });
  }
  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    // هنا سويت موقت للصفحة لي راح تضهر عنده تشغيل البرنامج
    Future.delayed(const Duration(seconds: 5) , () {
      // وهنا نتقلت للصفحه الاخ من خلال استخدام get وليس navigation حتى يسهل علي عملية عمل transition اي عمل انيميشن عند النتقال من صفحة الى اخرى
      // ملاحضة استطيع عمل ال انميشن مع ال navigation لكن تكون اكثر كود وتعقيد فا قمنا بالعمل ب get
      Get.to(() => const HomeView() , transition: Transition.fade , duration: ktransitionDuration);
    });
  }
}
