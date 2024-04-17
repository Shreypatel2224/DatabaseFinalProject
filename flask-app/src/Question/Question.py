from flask import Blueprint, request, jsonify, make_response
import json
from src import db


question = Blueprint('Question', __name__)

# Get all question from the DB
@question.route('/Question', methods=['GET'])
def get_question():
    cursor = db.get_db().cursor()
    cursor.execute('select * From Question')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@question.route('/Question', methods=['POST'])
def create_question():
    data = request.get_json()
    if not data:
        return make_response(jsonify({'error': 'No data provided'}), 400)
    
    title = data.get('Title')
    date = data.get('Date')
    status = data.get('Status')
    content = data.get('Content')
    user_id = data.get('User_ID')
    
    if not all([title, date, status, content, user_id]):
        return make_response(jsonify({'error': 'Missing data'}), 400)
    
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO Question (Title, Date, Status, Content, User_ID) VALUES (%s, %s, %s, %s, %s)',
            (title, date, status, content, user_id)
        )
        db.get_db().commit()  # Commit the changes to the database
        return make_response(jsonify({'success': 'Question created'}), 201)
    except Exception as e:
        db.get_db().rollback()  # Rollback in case of any error
        return make_response(jsonify({'error': 'Failed to create Question'}), 500)
    finally:
        cursor.close()

