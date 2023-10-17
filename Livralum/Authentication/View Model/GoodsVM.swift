//
//  AuthVM.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class GoodsVM: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    static func fetchAllGoods(for collection: String) async -> [[String : Any]] {
        do {
            var goodsDictionary = [String: Any]()
            var allGoods = [[String : Any]]()
            let db = Firestore.firestore()
            let querySnapshot = try await db.collection(collection).getDocuments()
            
            for document in querySnapshot.documents {
                let documentData = document.data()
                
                
                for (key, value) in documentData {
                    goodsDictionary[key] = value
                }
                
                allGoods.append(goodsDictionary)
            }
            return allGoods
        } catch {
            print("Error fetching lamps: \(error.localizedDescription)")
            return [[String : Any]]()
        }
    }
    
    

        
//    static func downloadImages(for childRef: String, completion: @escaping ([UIImage]?) -> Void) {
//            let storage = Storage.storage()
//            let storageRef = storage.reference().child(childRef)
//
//            var downloadedImages = [UIImage]()
//            
//            storageRef.listAll { (result, error) in
//                if let error = error {
//                    print("Error while listing all files: ", error)
//                    completion(nil)
//                    return
//                }
//
//                if let result = result?.items {
//                    let group = DispatchGroup()
//                    
//                    for item in result {
//                        group.enter()
//                        item.getData(maxSize: 5 * 1024 * 1024) { data, error in
//                            if let error = error {
//                                print("Error while downloading image: ", error)
//                            } else if let data = data, let image = UIImage(data: data) {
//                                downloadedImages.append(image)
//                            }
//                            group.leave()
//                        }
//                    }
//
//                    group.notify(queue: .main) {
//                        completion(downloadedImages)
//                    }
//                } else {
//                    completion(nil)
//                }
//            }
//        }
    
}
