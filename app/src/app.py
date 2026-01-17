from flask import Flask, jsonify, render_template
import socket
import redis
import os

app = Flask(__name__)

# Connect to Redis using host from env variable
redis_host = os.getenv("REDIS_HOST", "localhost")
r = redis.Redis(host=redis_host, port=6379, decode_responses=True)

def fetchhostdetails():
    hostname = socket.gethostname()
    ip = socket.gethostbyname(hostname)
    return hostname, ip

@app.route("/")
def home():
    return "<p>Hello, World!</p>"

@app.route("/health")
def health():
    return jsonify(status="UP")

@app.route("/details")
def details():
    hostname, ip = fetchhostdetails()

    # increment a counter in redis
    visit_count = "unavailable"
    try:
        r.incr("visit_count")
        visit_count = r.get("visit_count")
    except Exception as e:
        print("Redis error:", e)

    return render_template(
        "index.html",
        HOSTNAME=hostname,
        IP=ip,
        VISITS=visit_count
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
