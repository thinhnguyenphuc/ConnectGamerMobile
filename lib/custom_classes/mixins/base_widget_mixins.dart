import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../resources/nums.dart';

mixin StatelessVariablesMixin on StatelessWidget {

  late ThemeData theme;
  late Insets insets;
  late AppLocalizations l10n;

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    insets = Insets.of(context);
    l10n = AppLocalizations.of(context)!;

    return const _NullWidget();
  }
}

@optionalTypeArgs
mixin StateVariablesMixin<T extends StatefulWidget> on State<T> {

  late ThemeData theme;
  late Insets insets;
  late AppLocalizations l10n;

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    initVariables(context);

    return const _NullWidget();
  }

  void initVariables(BuildContext context) {
    theme = Theme.of(context);
    insets = Insets.of(context);
    l10n = AppLocalizations.of(context)!;
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Widgets that mix Base widgets for common variables must '
          'call super.build() but must ignore the return value of the superclass.',
    );
  }
}

mixin WidgetBuilderVariableMixin {
  late ThemeData theme;
  late Insets insets;
  late AppLocalizations l10n;

  void initVariables(BuildContext context) {
    theme = Theme.of(context);
    insets = Insets.of(context);
    l10n = AppLocalizations.of(context)!;
  }
}

mixin InitViewModelMixin<T extends ChangeNotifier> {
  late T viewModel;

  ///Call in build
  void initViewModel(BuildContext context) {
    viewModel = Provider.of<T>(context);
  }
}
