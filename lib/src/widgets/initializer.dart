part of adaptix;

class SizeInitializer extends StatelessWidget {
  const SizeInitializer({required this.builder}) : super(key: const Key('sizeInit'));

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
   return OrientationBuilder(
    builder: (context, orientation) {
      return LayoutBuilder(
        builder: (context, constraints) {
          _Sizing().init(constraints, orientation);  
          return builder(context);
        },
      );
    },
  );
  }
}