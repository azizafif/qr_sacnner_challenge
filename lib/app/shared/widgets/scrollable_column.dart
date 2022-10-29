import '../../design/index.dart';
import '../modules/exports.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({
    super.key,
    this.formKey,
    this.margin,
    this.padding,
    required this.children,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ??
            const EdgeInsets.all(AppValues.bodyMinSymetricHorizontalPadding),
        child: Form(key: formKey, child: Column(children: children)),
      ),
    );
  }
}
