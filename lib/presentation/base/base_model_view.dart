abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {}

abstract class BaseViewModelInput {
  void start(); // called in init state
  void dispose(); // calle when the code died
}

abstract class BaseViewModelOutput {}
