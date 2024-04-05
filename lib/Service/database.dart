import 'package:firestore_ref/firestore_ref.dart';

class DatabaseMethos {
  Future addEmployeeDetails(
      Map<String, dynamic> EmployeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(EmployeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  Future updateEmployeeDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .delete();
  }
}
