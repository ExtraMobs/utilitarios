import 'package:extramobs_utilitarios/ui/backup/widgets/backup_screen.dart';
import 'package:extramobs_utilitarios/domain/enum.dart';
import 'package:extramobs_utilitarios/ui/home/view_model/view_model_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabDisplayHandler extends StatelessWidget {
  const TabDisplayHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [TabRow(), TabContent()],
    );
  }
}

class TabRow extends StatelessWidget {
  const TabRow({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ViewModelHome>();
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      // Lembrar de refatorar para usar somente ListView normal.
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: viewModel.tabCount,
        itemBuilder: (context, index) {
          final bool isActive = index == viewModel.currentIndex;

          return DefaultTabTool(
            type: viewModel.getTabType(index),
            isActive: isActive,
            onPressed: () => viewModel.setCurrentTabIndex(index),
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 3),
          child: VerticalDivider(
            width: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  const TabContent({super.key});

  Widget getContent(ETool tabType) {
    switch (tabType) {
      case ETool.backup:
        return BackupScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ViewModelHome>();
    return (viewModel.activeTab != null)
        ? getContent(viewModel.activeTab!.type)
        : const SizedBox();
  }
}

class DefaultTabTool extends StatelessWidget {
  const DefaultTabTool({
    super.key,
    required this.type,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final ETool type;

  final void Function() onPressed;

  IconData get icon {
    switch (type) {
      case ETool.backup:
        return Icons.settings_backup_restore_rounded;
    }
  }

  String get tip {
    switch (type) {
      case ETool.backup:
        return "Backup";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: SizedBox(
        width: 100,
        child: Tooltip(
          message: tip,
          child: Center(child: Icon(icon, size: 24, color: Colors.black)),
        ),
      ),
    );
  }
}
