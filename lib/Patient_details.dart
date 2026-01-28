import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails  ({super.key});

  @override
  State<PatientDetails> createState() => _TasksState();
}
class _TasksState extends State<PatientDetails> {
  int selectedIndex = 0;
  String searchQuery = '';
  final List<Map<String, dynamic>> filters = [
    {'label': 'ALL',    'icon': Icons.short_text},
    {'label': 'PPT',    'icon': Icons.text_snippet_outlined},
    {'label': 'PDF',    'icon': Icons.picture_as_pdf},
    {'label': 'Slides', 'icon': Icons.slideshow},
  ];
  List<Map<String, String>> documents = [
    {
      'type': 'note',
      'category': 'ALL',
      'title': 'Flutter CRUD',
      'subtitle': 'Practice add/edit/delete',
    },
    {
      'type': 'ppt',
      'category': 'PPT',
      'title': 'Networking PPT',
      'subtitle': 'Chapter 1–3 slides',
    },
    {
      'type': 'pdf',
      'category': 'PDF',
      'title': 'OS Notes PDF',
      'subtitle': 'Process scheduling',
    },
    {
      'type': 'slide',
      'category': 'Slides',
      'title': 'DSA Slides',
      'subtitle': 'Sorting & Searching',
    },
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  String _selectedType = 'note';
  String _selectedCategory = 'ALL';

  // ICON BY TYPE (user-selected)
  Widget _getIconByType(String? type) {
    switch (type) {
      case 'ppt':
        return const Icon(Icons.text_snippet_outlined, color: Colors.orange);
      case 'pdf':
        return const Icon(Icons.picture_as_pdf, color: Colors.red);
      case 'slide':
        return const Icon(Icons.slideshow, color: Colors.green);
      default:
        return const Icon(Icons.note, color: Colors.blueGrey);
    }
  }

  // FILTERED + SEARCHED LIST
  List<Map<String, String>> get currentDocuments {
    final selectedFilterLabel = filters[selectedIndex]['label'] as String;

    return documents.where((doc) {
      final matchesFilter = selectedFilterLabel == 'ALL'
          ? true
          : doc['category'] == selectedFilterLabel;

      final q = searchQuery.toLowerCase();
      final matchesSearch =
          (doc['title'] ?? '').toLowerCase().contains(q) ||
              (doc['subtitle'] ?? '').toLowerCase().contains(q);

      return matchesFilter && matchesSearch;
    }).toList();
  }

  // ADD DOCUMENT
  void _addDocument() {
    _titleController.clear();
    _subtitleController.clear();
    _selectedType = 'note';
    _selectedCategory = 'ALL';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ADD DOCUMENT'),
        content: StatefulBuilder(
          builder: (context, setInnerState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'TITLE'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _subtitleController,
                    decoration: const InputDecoration(hintText: 'SUBTITLE'),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Icon Type:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _IconOption(
                        icon: Icons.note,
                        label: 'Note',
                        value: 'note',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.text_snippet_outlined,
                        label: 'PPT',
                        value: 'ppt',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.picture_as_pdf,
                        label: 'PDF',
                        value: 'pdf',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.slideshow,
                        label: 'Slides',
                        value: 'slide',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Category (Filter):',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children: filters.map((f) {
                      final label = f['label'] as String;
                      final bool isSelected = _selectedCategory == label;
                      return ChoiceChip(
                        label: Text(label),
                        selected: isSelected,
                        onSelected: (_) {
                          setInnerState(() {
                            _selectedCategory = label;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty) {
                setState(() {
                  documents.add({
                    'type': _selectedType,
                    'category': _selectedCategory,
                    'title': _titleController.text,
                    'subtitle': _subtitleController.text,
                  });
                });
              }
              Navigator.pop(context);
            },
            child: const Text('ADD'),
          ),
        ],
      ),
    );
  }

  // EDIT DOCUMENT
  void _editDocument(int index) {
    final doc = documents[index];
    _titleController.text = doc['title'] ?? '';
    _subtitleController.text = doc['subtitle'] ?? '';
    _selectedType = doc['type'] ?? 'note';
    _selectedCategory = doc['category'] ?? 'ALL';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('EDIT DOCUMENT'),
        content: StatefulBuilder(
          builder: (context, setInnerState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'TITLE'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _subtitleController,
                    decoration: const InputDecoration(hintText: 'SUBTITLE'),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Icon Type:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _IconOption(
                        icon: Icons.note,
                        label: 'Note',
                        value: 'note',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.text_snippet_outlined,
                        label: 'PPT',
                        value: 'ppt',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.picture_as_pdf,
                        label: 'PDF',
                        value: 'pdf',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                      _IconOption(
                        icon: Icons.slideshow,
                        label: 'Slides',
                        value: 'slide',
                        groupValue: _selectedType,
                        onTap: (v) {
                          setInnerState(() {
                            _selectedType = v;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Category (Filter):',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children: filters.map((f) {
                      final label = f['label'] as String;
                      final bool isSelected = _selectedCategory == label;
                      return ChoiceChip(
                        label: Text(label),
                        selected: isSelected,
                        onSelected: (_) {
                          setInnerState(() {
                            _selectedCategory = label;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty) {
                setState(() {
                  documents[index] = {
                    'type': _selectedType,
                    'category': _selectedCategory,
                    'title': _titleController.text,
                    'subtitle': _subtitleController.text,
                  };
                });
              }
              Navigator.pop(context);
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }

  // DELETE DOCUMENT
  void _deleteDocument(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('DELETE DOCUMENT'),
        content: Text('Delete "${documents[index]['title']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                documents.removeAt(index);
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = currentDocuments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Document Library',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search documentary library',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
              ),
            ),
          ),

          // FULL-WIDTH FILTER BUTTONS
          SizedBox(
            height: 52,
            child: Row(
              children: List.generate(filters.length, (index) {
                final filter = filters[index];
                final bool isSelected = selectedIndex == index;

                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 4,
                      right: index == filters.length - 1 ? 16 : 4,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              filter['icon'],
                              size: 18,
                              color: isSelected ? Colors.white : Colors.black54,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              filter['label'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 8),

          // DOCUMENT LIST
          Expanded(
            child: list.isEmpty
                ? const Center(child: Text('No documents found'))
                : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final doc = list[index];
                final realIndex = documents.indexOf(doc);

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: _getIconByType(doc['type']),
                    title: Text(
                      doc['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(doc['subtitle'] ?? ''),
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'edit') _editDocument(realIndex);
                        if (value == 'delete') _deleteDocument(realIndex);
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: open document action
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addDocument,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }
}

// ICON OPTION WIDGET (for dialog)
class _IconOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String> onTap;

  const _IconOption({
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onTap(value),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black54,
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
