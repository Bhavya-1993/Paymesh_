from flask import Flask, jsonify, Response
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

REQUEST_COUNT = Counter(
    "payment_api_requests_total",
    "Total number of API requests",
    ["endpoint"]
)

@app.before_request
def before_request():
    REQUEST_COUNT.labels(endpoint="/").inc()

@app.route("/")
def index():
    return jsonify({"message": "Payment API running"})

@app.route("/health")
def health():
    return jsonify({"status": "ok"})

@app.route("/metrics")
def metrics():
    return Response(generate_latest(), mimetype="text/plain")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
