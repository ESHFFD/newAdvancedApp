// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adv_app/domain/model.dart';
import 'package:adv_app/presentation/onBoarding/onboarding_view_mdoel.dart';
import 'package:adv_app/presentation/resources/assets_management.dart';
import 'package:adv_app/presentation/resources/string_management.dart';
import 'package:adv_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'package:adv_app/presentation/resources/color_management.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel viewModel = OnBoardingViewModel();
  _bind() {
    viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return contentWidget();
  }
}

Widget contentWidget() {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: ColorManagement.grey,
      elevation: AppSize.s0,
      systemOverlayStyle: const SystemUiOverlayStyle(
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
    bottomSheet: SizedBox(
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
