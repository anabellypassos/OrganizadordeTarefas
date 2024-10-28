import 'package:flutter/material.dart';
import 'package:organizadortarefas/dados/atrefasdatabase.dart';

class CheckboxExample extends StatefulWidget {
  final Atrefasdatabase tarefa;
  final ValueChanged<bool> onChanged;

  const CheckboxExample({
    super.key,
    required this.tarefa,
    required this.onChanged,
  });

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.tarefa.concluida;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.all(Colors.blue),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        widget.onChanged(isChecked);
      },
    );
  }
}
