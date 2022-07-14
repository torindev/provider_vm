abstract class BaseState {
  final int? id;

  const BaseState({this.id});

  @override
  int get hashCode => id?.hashCode ?? super.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! BaseState) return false;
    if (runtimeType != other.runtimeType) return false;
    return id == other.id;
  }

  @override
  String toString() {
    return '${runtimeType}(id: $id)';
  }
}
