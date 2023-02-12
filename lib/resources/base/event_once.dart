class EventOnce<T> {
  T? content;
  bool hasBeenHandled = false;

  EventOnce(this.content);

  T? getContentIfNotHandled() {
    if (hasBeenHandled) {
      return null;
    } else {
      hasBeenHandled = true;
      return content;
    }
  }

  T? peekContent() {
    return content;
  }
}
