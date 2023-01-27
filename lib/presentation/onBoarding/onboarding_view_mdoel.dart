// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:adv_app/domain/model.dart';
import 'package:adv_app/presentation/base/base_model_view.dart';
import 'package:adv_app/presentation/resources/assets_management.dart';
import 'package:adv_app/presentation/resources/string_management.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = getSlider();
    _postDataToView();
  }

  @override
  void goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  //input
  @override
  Sink get inputSliderViewObject => throw _streamController.sink;

  // output
  @override
  Stream<SliderViewObject> get outputSliderViewOject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);

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

  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnBoardingViewModelInput {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // the way how to add data to stream
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewOject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(
    this.sliderObject,
    this.numOfSlides,
    this.currentIndex,
  );
}
