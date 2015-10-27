import Foundation

/*:
# How to Parse JSON with Swift 2
This Playground only contains the code - you can read the full explanation [here](https://roadfiresoftware.com/2015/10/how-to-parse-json-with-swift-2/).
*/

let blogsURL: NSURL = [#FileReference(fileReferenceLiteral: "blogs.json")#]
let data = NSData(contentsOfURL: blogsURL)!

var names = [String]()

do {
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
    
    if let blogs = json["blogs"] as? [[String: AnyObject]] {
        for blog in blogs {
            if let name = blog["name"] as? String {
                names.append(name)
            }
        }
    }
} catch {
    print("error serializing JSON: \(error)")
}

print(names)
