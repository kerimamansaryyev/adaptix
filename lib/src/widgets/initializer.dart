part of adaptix;

class SizeInitializer extends SingleChildStatelessWidget {
  const SizeInitializer({required this.builder}) : super(key: const Key('sizeInit'));

  final Widget Function(BuildContext context) builder;

  @override
  Widget buildWithChild(BuildContext context, _) {
   return OrientationBuilder(
    builder: (context, orientation) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return ChangeNotifierProvider.value(
            value: _adapter..setSizing(constraints, orientation),
            builder: (_, __) => builder(context),
          );
        },
      );
    },
  );
  }
}