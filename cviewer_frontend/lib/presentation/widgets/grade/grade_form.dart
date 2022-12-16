import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GradeForm extends StatefulWidget {
  const GradeForm({
    super.key,
    required this.showCheckbox,
    required this.onGradeChanged,
  });

  final bool showCheckbox;
  final void Function(int?) onGradeChanged;

  @override
  State<GradeForm> createState() => _GradeFormState();
}

class _GradeFormState extends State<GradeForm> {
  var _grade = 0;
  var _isFormVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showCheckbox) ...[
          Text(
            S.of(context).rate.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 10),
          Checkbox(
            checkColor: AppColors.emerald,
            activeColor: AppColors.white,
            value: _isFormVisible,
            onChanged: (value) {
              setState(() => _isFormVisible = !_isFormVisible);
              if (value == false) {
                widget.onGradeChanged(null);
              }
              if (value == true) {
                widget.onGradeChanged(_grade);
              }
            },
          ),
          const SizedBox(width: 10),
        ],
        if (_isFormVisible)
          for (var i = 1; i <= 5; i++)
            _Star(
              isSelected: _grade >= i,
              onPressed: () {
                setState(() => _grade = i);
                widget.onGradeChanged(i);
              },
            ),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({
    required this.isSelected,
    required this.onPressed,
  });

  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.star_rate,
        color: isSelected ? AppColors.mint : AppColors.white,
      ),
    );
  }
}
