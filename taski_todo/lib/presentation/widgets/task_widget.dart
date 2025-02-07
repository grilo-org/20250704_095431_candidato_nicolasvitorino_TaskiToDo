import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final bool isDone;
  // final ValueChanged<bool> onToggleCompleted;

  const TaskWidget({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
    // required this.onToggleCompleted,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Container(
        width: 338, // Definição fixa de tamanho
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Checkbox(
                //     value: widget.isDone,
                //     onChanged: (newValue) {
                //       widget.onToggleCompleted(newValue ?? false);
                //     }),
                SizedBox(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF3F3D56),
                    ),
                    softWrap: true, // Permite a quebra
                    maxLines: null, // Permite múltiplas linhas
                    overflow: TextOverflow
                        .visible, // Garante que o texto seja visível
                  ),
                ),
                !_isExpanded
                    ? SizedBox(
                        child: Image.asset('assets/task_dots.jpg'),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            Visibility(
              visible: _isExpanded,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: 380, // Define largura para evitar estouro
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF8D9CB8),
                    ),
                    softWrap: true, // Permite a quebra
                    maxLines: null, // Permite múltiplas linhas
                    overflow: TextOverflow
                        .visible, // Garante que o texto seja visível
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
