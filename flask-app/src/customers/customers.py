########################################################
# Sample customers blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint, request, jsonify, make_response
import json
from src import db


customers = Blueprint('customers', __name__)
User = Blueprint('User', __name__)

# Get all customers from the DB
@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select company, last_name,\
        first_name, job_title, business_phone from customers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customers where id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response



# from flask import Blueprint, request, jsonify

# user_blueprint = Blueprint('User', __name__)

# @user_blueprint.route('/User', methods=['GET'])
# def get_users():
#     users = get_all_users()  # You need to define this function
#     return jsonify(users), 200

# @user_blueprint.route('/User', methods=['POST'])
# def add_user():
#     data = request.json
#     if not data:
#         return jsonify({'error': 'No input data provided'}), 400
#     new_user = create_user(data)  # You need to define this function
#     return jsonify(new_user), 201

# @user_blueprint.route('/User/<int:user_id>', methods=['DELETE'])
# def delete_user(user_id):
#     result = delete_user_by_id(user_id)  # You need to define this function
#     if result:
#         return jsonify({'success': 'User deleted'}), 200
#     else:
#         return jsonify({'error': 'User not found'}), 404


