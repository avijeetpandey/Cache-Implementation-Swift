import UIKit

/**
 Cache
    - Cache should be able to store
       - Cache should be able to update
             - cache should be able to delete the a particular key
 - cache should be able to retrieve a particular data from cache
 - clears the entire cache
 */


protocol Cacheable {
    var cache: [String: Any] { get set }
    
    
    func store(_ key: String, data: Any)
    func delete(for key: String)
    func getData(for key: String) -> Any
    func updateData(for key: String, data: Any)
    mutating func flush()
}


extension Cacheable {
    mutating func flush() {
        self.cache = [:]
    }
}


class CustomCache: Cacheable {
    var cache: [String : Any] = [:]
    
    // MARK: - Store into cache
    func store(_ key: String, data: Any) {
        // stores the data into the key
        cache["\(key)"] = data
    }
    
    func delete(for key: String) {
        cache["\(key)"] = nil
    }
    
    func getData(for key: String) -> Any {
        return cache["\(key)"]
    }
    
    func updateData(for key: String, data: Any) {
        if cache["\(key)"] != nil {
            cache["\(key)"] = data
        }
    }
}
