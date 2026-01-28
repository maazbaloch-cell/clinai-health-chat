import 'package:flutter/material.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  List<Map<String, String>> patients = [
    {
      'name': 'Ali Khan',
      'id': 'P-001',
      'fileName': 'report1.pdf',
    },
    {
      'name': 'Sara Ahmed',
      'id': 'P-002',
      'fileName': 'xray_result.png',
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  String? _selectedFileName;
  String searchQuery = '';

  // SAME ICON FOR ALL PATIENTS (BLUE COLOR)
  Widget _patientIcon() {
    return const Icon(Icons.insert_drive_file, color: Colors.blue);
  }

  List<Map<String, String>> get filteredPatients {
    final q = searchQuery.toLowerCase();
    if (q.isEmpty) return patients;
    return patients.where((p) {
      final name = (p['name'] ?? '').toLowerCase();
      final id = (p['id'] ?? '').toLowerCase();
      return name.contains(q) || id.contains(q);
    }).toList();
  }

  void _addPatient() {
    _nameController.clear();
    _idController.clear();
    _selectedFileName = null;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Patient'),
        content: StatefulBuilder(
          builder: (context, setInnerState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Patient Name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(
                      labelText: 'Patient ID',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Attach File:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () {
                      // TODO: real file picker
                      setInnerState(() {
                        _selectedFileName = 'example_report.pdf';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_file,
                              size: 20, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _selectedFileName ?? 'Attach file',
                              style: TextStyle(
                                color: _selectedFileName == null
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
              if (_nameController.text.isNotEmpty &&
                  _idController.text.isNotEmpty) {
                setState(() {
                  patients.add({
                    'name': _nameController.text,
                    'id': _idController.text,
                    'fileName': _selectedFileName ?? 'no_file_attached',
                  });
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('ADD'),
          ),
        ],
      ),
    );
  }

  void _editPatient(int index) {
    final p = patients[index];
    _nameController.text = p['name'] ?? '';
    _idController.text = p['id'] ?? '';
    _selectedFileName = p['fileName'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Patient'),
        content: StatefulBuilder(
          builder: (context, setInnerState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Patient Name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(
                      labelText: 'Patient ID',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Attach File:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () {
                      setInnerState(() {
                        _selectedFileName = 'updated_file.pdf';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_file,
                              size: 20, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _selectedFileName ?? 'Attach file',
                              style: TextStyle(
                                color: _selectedFileName == null
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
              if (_nameController.text.isNotEmpty &&
                  _idController.text.isNotEmpty) {
                setState(() {
                  patients[index] = {
                    'name': _nameController.text,
                    'id': _idController.text,
                    'fileName': _selectedFileName ?? 'no_file_attached',
                  };
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }

  void _deletePatient(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Patient'),
        content: Text('Delete "${patients[index]['name']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                patients.removeAt(index);
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = filteredPatients;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        centerTitle: true,
        leading: IconButton(             // back button
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
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
                hintText: 'Search patients by name or ID',
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

          Expanded(
            child: list.isEmpty
                ? const Center(child: Text('No patients found'))
                : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final p = list[index];
                final realIndex = patients.indexOf(p);

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
                    leading: _patientIcon(),
                    title: Text(
                      p['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'ID: ${p['id'] ?? ''}\nFile: ${p['fileName'] ?? ''}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'edit') _editPatient(realIndex);
                        if (value == 'delete') _deletePatient(realIndex);
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
                  ),
                );
              },
            ),
          ),

          // BOTTOM "ADD NEW PATIENT" BUTTON (BLUE)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addPatient,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Patient'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }
}
