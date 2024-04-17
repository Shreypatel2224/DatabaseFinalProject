from flask import Blueprint, request, jsonify, make_response
import json
from src import db


answer = Blueprint('Answer', __name__)

# Get all answers from the DB
@answer.route('/Answer', methods=['GET'])
def get_answer():
    cursor = db.get_db().cursor()
    cursor.execute('select * From Answer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Post route to make new answer
@answer.route('/Answer', methods=['POST'])
def create_answer():
    data = request.get_json()
    if not data:
        return make_response(jsonify({'error': 'No data provided'}), 400)
    
    answer_id = data.get('Answer_ID')
    question_id = data.get('Question_ID')
    date = data.get('Date')
    content = data.get('Content')
    user_id = data.get('User_ID')
    
    if not all([answer_id, question_id, date, content, user_id]):
        return make_response(jsonify({'error': 'Missing data'}), 400)
    
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO Answer (Answer_ID, Content, Date, User_ID, Question_ID) VALUES (%s, %s, %s, %s, %s)',
            (answer_id, content, date, user_id, question_id)
        )
        db.get_db().commit()  # Commit the changes to the database
        return make_response(jsonify({'success': 'Answer created'}), 201)
    except Exception as e:
        db.get_db().rollback()  # Rollback in case of any error
        return make_response(jsonify({'error': 'Failed to create Answer'}), 500)
    finally:
        cursor.close()

