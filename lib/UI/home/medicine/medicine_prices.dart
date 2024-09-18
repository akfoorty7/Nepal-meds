import 'package:flutter/material.dart';



class MedicineListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'Cetamol Tablet',
      'price': 10,
      'description': 'Cetamol is used to treat mild to moderate pain such as headaches, toothaches, and muscle pain. It also helps to reduce fever.'
    },
    {
      'name': 'Nims Tablet',
      'price': 42,
      'description': 'Nims is commonly used for pain relief and fever reduction. It is an NSAID that reduces inflammation.'
    },
    {
      'name': 'Pantop Tablet',
      'price': 80,
      'description': 'Pantop is a proton pump inhibitor used to treat stomach acid issues, such as acid reflux and ulcers.'
    },
    {
      'name': 'Protogyl Tablet',
      'price': 84,
      'description': 'Protogyl is used in the treatment of bacterial infections of the gums, teeth, and throat. It belongs to the class of antimicrobials.'
    },
    {
      'name': 'Levocetrizine Tablet',
      'price': 60,
      'description': 'Levocetrizine is an antihistamine used to treat allergies such as hay fever and hives.'
    },
    {
      'name': 'CTZ Tablet',
      'price': 56,
      'description': 'CTZ is used for managing allergic reactions and cold symptoms like sneezing, runny nose, and itching.'
    },
    {
      'name': 'Fexofenadine Tablet',
      'price': 150,
      'description': 'Fexofenadine is an antihistamine used to treat allergic symptoms such as hay fever, runny nose, and sneezing.'
    },
    {
      'name': 'TusQm Syrup',
      'price': 160,
      'description': 'TusQm Syrup is used for the relief of cough, chest congestion, and cold symptoms.'
    },
    {
      'name': 'Cefexim 200mg Tablet',
      'price': 200,
      'description': 'Cefexim is an antibiotic used to treat bacterial infections, including ear, throat, and urinary tract infections.'
    },
    {
      'name': 'Azimin 500 mg Tablet',
      'price': 150,
      'description': 'Azimin is an antibiotic used to treat a variety of bacterial infections including respiratory infections, skin infections, and sexually transmitted diseases.'
    },
    {
      'name': 'Paracetamol Tablet',
      'price': 15,
      'description': 'Paracetamol is commonly used for pain relief and reducing fever. It is one of the most widely used over-the-counter medications.'
    },
    {
      'name': 'Amoxicillin Capsule',
      'price': 90,
      'description': 'Amoxicillin is an antibiotic used to treat a variety of bacterial infections such as respiratory tract infections, skin infections, and urinary tract infections.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(medicine['name']),
              subtitle: Text(
                medicine['description'].split(' ').take(20).join(' ') + '...',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text('Rs. ${medicine['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineDetailScreen(
                      medicine: medicine,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MedicineDetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicine;

  MedicineDetailScreen({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: Rs. ${medicine['price']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              medicine['description'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
