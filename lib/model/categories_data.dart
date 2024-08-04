import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createDocuments() async {
  try {
    // Reference to the Firestore instance
    final firestore = FirebaseFirestore.instance;

    // Specify the collection path
    const collectionPath = 'categories';

    // Define a list of documents with specific IDs and data
    final documents = [
      {
        'id': 'cid1',
        'name': 'Vegetables',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid101.jpg?alt=media&token=72318e78-a96e-44bd-a56f-69871ff0443a'
      },
      {
        'id': 'cid2',
        'name': 'Fruits',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid102.jpg?alt=media&token=ee0b69e8-805c-4c3d-9adc-22e9f95cedb1'
      },
      {
        'id': 'cid3',
        'name': 'Milk & Eggs',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid103.jpg?alt=media&token=36985b15-540f-4146-94d6-781f3f17854c',
      },
      {
        'id': 'cid4',
        'name': 'Meat',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid104.jpg?alt=media&token=160a5a7f-d3ac-4a19-9b43-781a0b10ed08'
      },
      {
        'id': 'cid5',
        'name': 'Drinks',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid105.jpg?alt=media&token=4f81a3a2-38ed-45e5-9fdf-05ce68291da8'
      },
      {
        'id': 'cid6',
        'name': 'Snacks & Breads',
        'isActive': 'true',
        'categoryImage':
            'https://firebasestorage.googleapis.com/v0/b/quickshopnew-d1381.appspot.com/o/categoryImage%2Fcid106.jpg?alt=media&token=3040e234-9424-4690-98e5-5fd865f31c1d'
      },

      // Add more documents as needed
    ];

    // Create documents with the specified IDs
    for (final doc in documents) {
      final documentId = doc['id'];
      final documentData = Map<String, dynamic>.from(doc);

      // Remove the 'id' field from the data as it's only used for document ID
      documentData.remove('id');

      // Reference to the specific document
      final documentRef = firestore.collection(collectionPath).doc(documentId);

      // Create or update the document
      await documentRef.set(documentData);
    }

    print('Documents created successfully');
  } catch (e) {
    // Handle errors (e.g., show an error message to the user)
    print('Error creating documents: $e');
  }
}
