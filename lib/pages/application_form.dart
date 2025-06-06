import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'application2_form.dart';


class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({Key? key}) : super(key: key);

  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  bool isNewApplication = false;
  bool isRenewal = false;
  
  bool isAnnually = false;
  bool isSemiAnnually = false;
  bool isQuarterly = false;

  bool isSingle = false;
  bool isPartnership = false;
  bool isCorporation = false;
  bool isCooperative = false;
  
  bool isFromSingle = false;
  bool isFromPartnership = false;
  bool isFromCorporation = false;
  
  bool isToSingle = false;
  bool isToPartnership = false;
  bool isToCorporation = false;
  
  bool? hasTaxIncentive = false;
  
  DateTime? selectedDate;

  final TextEditingController _tinController = TextEditingController();
  final TextEditingController _entityController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _tradeNameController = TextEditingController();

  @override
  void dispose() { 
    _tinController.dispose();
    _entityController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _businessNameController.dispose();
    _accountNumberController.dispose();
    _tradeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A2B47),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Form Title
            const Text(
              "APPLICANT FORM", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16),
            
            // Section: Application Type
            const Text(
              "Basic Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildCheckboxRow(
              label: 'New Application',
              value: isNewApplication,
              onChanged: (value) {
                setState(() {
                  isNewApplication = value ?? false;
                  if (isNewApplication) isRenewal = false;
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Renewal',
              value: isRenewal,
              onChanged: (value) {
                setState(() {
                  isRenewal = value ?? false;
                  if (isRenewal) isNewApplication = false;
                });
              },
            ),
            const SizedBox(height: 16),
          
            const Text(
              "Mode of Payment", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            
            _buildCheckboxRow(
              label: 'Annually',
              value: isAnnually,
              onChanged: (value) {
                setState(() {
                  isAnnually = value ?? false;
                  if (isAnnually) {
                    isSemiAnnually = false;
                    isQuarterly = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Semi-Annually',
              value: isSemiAnnually,
              onChanged: (value) {
                setState(() {
                  isSemiAnnually = value ?? false;
                  if (isSemiAnnually) {
                    isAnnually = false;
                    isQuarterly = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Quarterly',
              value: isQuarterly,
              onChanged: (value) {
                setState(() {
                  isQuarterly = value ?? false;
                  if (isQuarterly) {
                    isAnnually = false;
                    isSemiAnnually = false;
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            
            const Text(
              "Date of Application:", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
  
            InkWell(
              onTap: () async {
                final now = DateTime.now();
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? now,
                  firstDate: DateTime(now.year - 1, now.month, now.day),
                  lastDate: DateTime(now.year + 1, now.month, now.day),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: Text(
                  selectedDate != null 
                      ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                      : 'Select a date',
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _tinController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'TIN No.:',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
          
            const Text(
              "Type of Business", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildCheckboxRow(
              label: 'Single',
              value: isSingle,
              onChanged: (value) {
                setState(() {
                  isSingle = value ?? false;
                  if (isSingle) {
                    isPartnership = false;
                    isCorporation = false;
                    isCooperative = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Partnership',
              value: isPartnership,
              onChanged: (value) {
                setState(() {
                  isPartnership = value ?? false;
                  if (isPartnership) {
                    isSingle = false;
                    isCorporation = false;
                    isCooperative = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Corporation',
              value: isCorporation,
              onChanged: (value) {
                setState(() {
                  isCorporation = value ?? false;
                  if (isCorporation) {
                    isSingle = false;
                    isPartnership = false;
                    isCooperative = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Cooperative',
              value: isCooperative,
              onChanged: (value) {
                setState(() {
                  isCooperative = value ?? false;
                  if (isCooperative) {
                    isSingle = false;
                    isPartnership = false;
                    isCorporation = false;
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Section: Amendment From
            const Text(
              "Amendment: From", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            // Amendment From options
            _buildCheckboxRow(
              label: 'Single',
              value: isFromSingle,
              onChanged: (value) {
                setState(() {
                  isFromSingle = value ?? false;
                  if (isFromSingle) {
                    isFromPartnership = false;
                    isFromCorporation = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Partnership',
              value: isFromPartnership,
              onChanged: (value) {
                setState(() {
                  isFromPartnership = value ?? false;
                  if (isFromPartnership) {
                    isFromSingle = false;
                    isFromCorporation = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Corporation',
              value: isFromCorporation,
              onChanged: (value) {
                setState(() {
                  isFromCorporation = value ?? false;
                  if (isFromCorporation) {
                    isFromSingle = false;
                    isFromPartnership = false;
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            
            const Text(
              "To", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            _buildCheckboxRow(
              label: 'Single',
              value: isToSingle,
              onChanged: (value) {
                setState(() {
                  isToSingle = value ?? false;
                  if (isToSingle) {
                    isToPartnership = false;
                    isToCorporation = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Partnership',
              value: isToPartnership,
              onChanged: (value) {
                setState(() {
                  isToPartnership = value ?? false;
                  if (isToPartnership) {
                    isToSingle = false;
                    isToCorporation = false;
                  }
                });
              },
            ),
            _buildCheckboxRow(
              label: 'Corporation',
              value: isToCorporation,
              onChanged: (value) {
                setState(() {
                  isToCorporation = value ?? false;
                  if (isToCorporation) {
                    isToSingle = false;
                    isToPartnership = false;
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            
            const Text(
              "Are you enjoying tax incentive from any Government entity?", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            
            Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: hasTaxIncentive,
                    onChanged: (bool? value) {
                      setState(() {
                        hasTaxIncentive = value;
                      });
                    },
                  ),
                  const Text('Yes'),
                  const SizedBox(width: 24),
                  Radio<bool>(
                    value: false,
                    groupValue: hasTaxIncentive,
                    onChanged: (bool? value) {
                      setState(() {
                        hasTaxIncentive = value;
                      });
                    },
                  ),
                  const Text('No'),
                ],
              ),

            const SizedBox(height: 8),
            
            if (hasTaxIncentive == true)
              TextField(
                controller: _entityController,
                decoration: const InputDecoration(
                  labelText: 'Please Specify the Entity',
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 16),
            
            const Text(
              "Name of the Taxpayer/Registrant", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _middleNameController,
              decoration: const InputDecoration(
                labelText: 'Middle Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _businessNameController,
              decoration: const InputDecoration(
                labelText: 'Business Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _accountNumberController,
              decoration: const InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tradeNameController,
              decoration: const InputDecoration(
                labelText: 'Trade Name/Franchise',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            
            
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B47),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text('Next', style: TextStyle(fontSize: 16, color:(Colors.white))),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow({
    required String label,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          Text(label),
        ],
      ),
    );
  }

  void _submitForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Application2FormScreen()),
    );
  }
}

class Application2FormScreen extends StatefulWidget {
  const Application2FormScreen({Key? key}) : super(key: key);

  @override
  State<Application2FormScreen> createState() => _Application2FormScreenState();
}

class _Application2FormScreenState extends State<Application2FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessAddress = TextEditingController(text: "");
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _ownerAddress = TextEditingController(text: "");
  final TextEditingController _ownerEmail = TextEditingController(text: "");
  final TextEditingController _ownerMobile = TextEditingController(text: "");
  final TextEditingController _emergencyContact = TextEditingController();
  final TextEditingController _emergencyEmail = TextEditingController();
  final TextEditingController _emergencyMobile = TextEditingController();
  final TextEditingController _businessArea = TextEditingController();
  final TextEditingController _employeesTotal = TextEditingController(text: "");
  final TextEditingController _employeesWithLGU = TextEditingController(text: "");

  bool isRented = false;
  final TextEditingController _lessorName = TextEditingController();
  final TextEditingController _lessorAddress = TextEditingController();
  final TextEditingController _lessorContact = TextEditingController();
  final TextEditingController _lessorEmail = TextEditingController();
  final TextEditingController _monthlyRental = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("2. OTHER INFORMATION", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text("Note: For RENEWAL APPLICATIONS, do not fill up this section unless information have changed ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              const SizedBox(height: 10),
              _buildTextField("Business Address", _businessAddress),
              _buildTextField("Postal Code", _postalCode),
              _buildTextField("Owner's Address", _ownerAddress),
              _buildTextField("Email Address", _ownerEmail),
              _buildTextField("Mobile No.", _ownerMobile),
              _buildTextField("Emergency Contact Person", _emergencyContact),
              _buildTextField("Emergency Email", _emergencyEmail),
              _buildTextField("Emergency Mobile No.", _emergencyMobile),
              _buildTextField("Business Area (in sq. m.)", _businessArea),
              _buildTextField("Total No. of Employees", _employeesTotal),
              _buildTextField("No. of Employees Residing with LGU", _employeesWithLGU),

              const SizedBox(height: 12),
              CheckboxListTile(
                title: const Text("Business Place is Rented"),
                value: isRented,
                onChanged: (value) {
                  setState(() => isRented = value!);
                },
              ),
              if (isRented) ...[
                _buildTextField("Lessor's Full Name", _lessorName),
                _buildTextField("Lessor's Address", _lessorAddress),
                _buildTextField("Lessor's Tel/Mobile No.", _lessorContact),
                _buildTextField("Lessor's Email", _lessorEmail),
                _buildTextField("Monthly Rental", _monthlyRental),
              ],

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Application3FormScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A2B47),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text('Next', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) => null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Application3FormScreen extends StatefulWidget {
  const Application3FormScreen({Key? key}) : super(key: key);

  @override
  State<Application3FormScreen> createState() => _Application3FormScreenState();
}

class _Application3FormScreenState extends State<Application3FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _lineOfBusiness = TextEditingController(text: "");
  final TextEditingController _numOfUnits = TextEditingController();
  final TextEditingController _capitalization = TextEditingController(text: "");
  final TextEditingController _grossSalesEssential = TextEditingController();
  final TextEditingController _grossSalesNonEssential = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business Activity')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("3. BUSINESS ACTIVITY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              _buildTextField("Line of Business", _lineOfBusiness),
              _buildTextField("No. of Units", _numOfUnits),
              _buildTextField("Capitalization (₱)", _capitalization, isNumber: true),
              _buildTextField("Gross/Sales Receipts (Essential)", _grossSalesEssential, isNumber: true),
              _buildTextField("Gross/Sales Receipts (Non-Essential)", _grossSalesNonEssential, isNumber: true),

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Business activity submitted.')),
                      );
                      
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A2B47),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text('Submit', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckmarkTable(),
                      )
                    );

                  },
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric (horizontal: 40, vertical: 12)
                    ),
                    child: const Text("View Checklist", style: TextStyle(fontSize: 16))
                ),
              )
            ],
          ),
        ),
      ),    
    );
  }

  



  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) => null,
        //validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

