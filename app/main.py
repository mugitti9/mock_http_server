import json
import http.server
import socketserver
from urllib.parse import urlparse, parse_qs

from helpers.slack_helper import *

import os

class MyHandler(http.server.SimpleHTTPRequestHandler):
  def do_POST(self):
    content_length = int(self.headers['Content-Length'])
    post_data = json.loads(self.rfile.read(content_length))

    self.send_response(200)
    self.send_header("Content-Type", "application/json")
    self.end_headers()
    self.wfile.write(json.dumps(post_data).encode("utf-8"))

    send_slack(post_data)

  def do_GET(self):
    parsed_url = urlparse(self.path)
    query_params = parse_qs(parsed_url.query)

    self.send_response(200)
    self.send_header("Content-Type", "application/json")
    self.end_headers()
    self.wfile.write(json.dumps(query_params).encode("utf-8"))

    send_slack(query_params)

PORT = int(os.environ.get('PORT', 4000))
server = http.server.HTTPServer(("", PORT), MyHandler)
server.allow_reuse_address = True

print(f"Serving on port {PORT}")

try:
  server.serve_forever()
except KeyboardInterrupt:
  server.shutdown()
