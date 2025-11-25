import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _jobsCollection = 'jobs';

  // Get all active jobs
  Stream<List<Job>> getJobs() {
    print('🔥 FirebaseService: Starting to fetch jobs...');
    print('📦 Collection name: $_jobsCollection');

    try {
      return _firestore
          .collection(_jobsCollection)
          .where('isActive', isEqualTo: true)
      // .orderBy('postedDate', descending: true)  // ← REMOVE THIS LINE
          .snapshots()
          .map((snapshot) {
        print('📨 Received snapshot with ${snapshot.docs.length} documents');

        return snapshot.docs.map((doc) {
          print('📄 Processing document: ${doc.id}');
          return Job.fromFirestore(doc.data(), doc.id);
        }).toList();
      });
    } catch (e, stackTrace) {
      print('❌ ERROR in getJobs():');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  // Get a single job by ID
  Future<Job?> getJob(String jobId) async {
    try {
      print('🔍 Fetching job with ID: $jobId');
      DocumentSnapshot doc =
      await _firestore.collection(_jobsCollection).doc(jobId).get();
      if (doc.exists) {
        print('✅ Job found: ${doc.id}');
        return Job.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }
      print('⚠️ Job not found: $jobId');
      return null;
    } catch (e) {
      print('❌ Error getting job: $e');
      return null;
    }
  }

  // Add a new job (for admin/posting through Firebase console)
  Future<String?> addJob(Job job) async {
    try {
      DocumentReference docRef =
      await _firestore.collection(_jobsCollection).add(job.toFirestore());
      return docRef.id;
    } catch (e) {
      print('Error adding job: $e');
      return null;
    }
  }

  // Update job
  Future<bool> updateJob(String jobId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(_jobsCollection).doc(jobId).update(data);
      return true;
    } catch (e) {
      print('Error updating job: $e');
      return false;
    }
  }

  // Delete job (soft delete by setting isActive to false)
  Future<bool> deleteJob(String jobId) async {
    try {
      await _firestore
          .collection(_jobsCollection)
          .doc(jobId)
          .update({'isActive': false});
      return true;
    } catch (e) {
      print('Error deleting job: $e');
      return false;
    }
  }
}