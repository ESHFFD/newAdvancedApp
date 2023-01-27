// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adv_app/presentation/resources/assets_management.dart';
import 'package:adv_app/presentation/resources/string_management.dart';
import 'package:adv_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'package:adv_app/presentation/resources/color_management.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key? key, this.currentIndex = 0}) : super(key: key);
  int currentIndex;
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = getSlider();
  final PageController _pageController = PageController(initialPage: 0);

  List<SliderObject> getSlider() => [
        SliderObject(
            title: AppString.onboardingTitle1,
            subtitle: AppString.onboardingSubtitle1,
            image: AssetsImage.onboardingLogo1),
        SliderObject(
            title: AppString.onboardingTitle2,
            subtitle: AppString.onboardingSubtitle2,
            image: AssetsImage.onboardingLogo2),
        SliderObject(
            title: AppString.onboardingTitle3,
            subtitle: AppString.onboardingSubtitle3,
            image: AssetsImage.onboardingLogo3),
        SliderObject(
            title: AppString.onboardingTitle4,
            subtitle: AppString.onboardingSubtitle4,
            image: AssetsImage.onboardingLogo4)
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManagement.grey,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarDividerColor: Colors.red,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.red,
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      backgroundColor: ColorManagement.white,
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (value) => setState(() {
                widget.currentIndex = value;
              }),
          itemBuilder: (context, index) {
            return OnBoardingPage(
              sliderObject: _list[index],
            );
          }),
      bottomSheet: Container(
        height: AppSize.s100,
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                AppString.skip,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          _getBottomSheet(_list, widget.currentIndex, _pageController)
        ]),
      ),
    );
  }
}

Widget _getBottomSheet(
    List objectList, int selectIndex, PageController pageController) {
  return Container(
    height: 50,
    color: ColorManagement.primary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //left arrow
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s14,
              width: AppSize.s14,
              child: SvgPicture.asset(AssetsImage.leftArrowIc),
            ),
            onTap: () {
              pageController.animateToPage(
                  _getPreviousPage(selectIndex, objectList),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.easeIn);
            },
          ),
        ),
        //Circluar part
        Row(children: [
          for (int i = 0; i < objectList.length; i++)
            Padding(
              padding: const EdgeInsets.all(AppSize.s14),
              child: _getProperCircle(i, selectIndex),
            )
        ]),

        //right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s14,
              width: AppSize.s14,
              child: SvgPicture.asset(AssetsImage.rightArrowIc),
            ),
            onTap: () {
              pageController.animateToPage(
                  _getNextPage(selectIndex, objectList),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.easeIn);
            },
          ),
        ),
      ],
    ),
  );
}

int _getPreviousPage(int index, List liset) {
  int previousIndex = index--;
  if (previousIndex == -1) {
    return index = liset.length - 1;
  }
  return index;
}

int _getNextPage(int index, List liset) {
  int nextIndex = index++;
  if (nextIndex >= liset.length) {
    return index = 0;
  }
  return index;
}

_getProperCircle(int i, int selecteIndex) {
  if (i == selecteIndex) {
    return SvgPicture.asset(AssetsImage.hollowCirlceIc);
  } else {
    return SvgPicture.asset(AssetsImage.solidCircleIc);
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);
  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SvgPicture.asset(sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  final String title;
  final String subtitle;
  final String image;
  SliderObject({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
