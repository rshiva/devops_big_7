import os
import boto3
from flask import Flask, jsonify, request

app = Flask(__name__)
AWS_REGION = os.getenv("AWS_REGION", "us-east-1")
DYNAMODB_TABLE = os.getenv("DYNAMODB_TABLE", "users")

# Initialize DynamoDB client
dynamodb = boto3.resource(
    "dynamodb",
    region_name=AWS_REGION,
)

table = dynamodb.Table(DYNAMODB_TABLE)


@app.route("/api/user", methods=["GET"])
def get_users():
    response = table.scan()
    return jsonify(response.get("Items", []))


@app.route("/api/user", methods=["POST"])
def create_user():
    data = request.get_json()
    if not data.get("username") or not data.get("email"):
        return jsonify({"error": "Missing username or email"}), 400

    user_item = {
        "username": data["username"],
        "email": data["email"],
    }
    table.put_item(Item=user_item)

    return jsonify({"message": "User created"}), 201


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=6000)
