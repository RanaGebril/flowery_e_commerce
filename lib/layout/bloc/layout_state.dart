class MainLayoutState {
  final int currentIndex;
  final String? selectedCategoryId;

  const MainLayoutState({
    this.currentIndex = 0,
    this.selectedCategoryId,
  });

  MainLayoutState copyWith({
    int? currentIndex,
    String? selectedCategoryId,
    bool clearCategory = false,
  }) {
    return MainLayoutState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedCategoryId: clearCategory
          ? null
          : selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}