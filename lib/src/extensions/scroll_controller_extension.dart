// coverage:ignore-file
part of commons_tools_sdk;

extension ScrollControllerExtensions on ScrollController {
  scrollDown({
    int delay = 0,
    Duration animateDuration = const Duration(milliseconds: 300),
  }) async {
    await Future.delayed(Duration(milliseconds: delay));
    animateTo(
      position.maxScrollExtent,
      duration: animateDuration,
      curve: Curves.easeInOut,
    );
  }
}
