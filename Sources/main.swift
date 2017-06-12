import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()

var routes = Routes();
routes.add(method: .get, uri: "/", handler: {
    HTTPRequest, HTTPResponse in 
    HTTPResponse.setHeader(.contentType, value: "text/html")
    HTTPResponse.appendBody(string: "<html><title>hello</title><body>hello</body></html>")
    HTTPResponse.completed()
})

server.add(route: routes)

server.serverPort = 8181

do {
    try server.start()
 } catch PerfectError.networkError(let err, let msg) {
     print("网络错误 \(err) \(msg)")
 }

// print("Hello")