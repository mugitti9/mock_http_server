import json
import http.server
import socketserver
from urllib.parse import urlparse, parse_qs

class MyHandler(http.server.SimpleHTTPRequestHandler):
  def do_POST(self):
    content_length = int(self.headers['Content-Length'])
    post_data = json.loads(self.rfile.read(content_length))
    self.send_response(200)
    self.send_header("Content-Type", "application/json")
    self.end_headers()
    self.wfile.write(json.dumps(post_data).encode("utf-8"))

  def do_GET(self):
    parsed_url = urlparse(self.path)
    query_params = parse_qs(parsed_url.query)

    self.send_response(200)
    self.send_header("Content-Type", "application/json")
    self.end_headers()
    self.wfile.write(json.dumps(query_params).encode("utf-8"))

port = 8000
with socketserver.TCPServer(("", port), MyHandler) as httpd:
  print(f"Serving at port {port}")
  httpd.serve_forever()
