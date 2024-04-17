from flask import Blueprint, request, jsonify, make_response
import json
from src import db

user = Blueprint('User', __name__)


# Get all users from the DB
@user.route('/User', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('select User_ID, Username, User_Type, Password, Email FROM User')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@user.route('/User', methods=['POST'])
def create_user():
    data = request.get_json()
    if not data:
        return make_response(jsonify({'error': 'No data provided'}), 400)
    
    username = data.get('Username')
    user_type = data.get('User_Type')
    password = data.get('Password')
    email = data.get('Email')
    
    if not all([username, user_type, password, email]):
        return make_response(jsonify({'error': 'Missing data'}), 400)
    
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO User (Username, User_Type, Password, Email) VALUES (%s, %s, %s, %s)',
            (username, user_type, password, email)
        )
        db.get_db().commit()  # Commit the changes to the database
        return make_response(jsonify({'success': 'User created'}), 201)
    except Exception as e:
        db.get_db().rollback()  # Rollback in case of any error
        return make_response(jsonify({'error': 'Failed to create user'}), 500)
    finally:
        cursor.close()


@user.route('/User/<User_ID>', methods=['DELETE'])
def delete_user(User_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM User WHERE User_ID = %s', (User_ID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({'error': 'User not found'}), 404)
        return make_response(jsonify({'success': 'User deleted'}), 200)
    except Exception as e:
        db.get_db().rollback()
        return make_response(jsonify({'error': 'Failed to delete User'}), 500)
    finally:
        cursor.close()
