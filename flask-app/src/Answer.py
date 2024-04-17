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
    
    question_id = data.get('Question_ID')
    date = data.get('Date')
    content = data.get('Content')
    user_id = data.get('User_ID')
    
    if not all([content, date, user_id, question_id]):
        return make_response(jsonify({'error': 'Missing data'}), 400)
    
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO Answer (Content, Date, User_ID, Question_ID) VALUES (%s, %s, %s, %s)',
            (content, date, user_id, question_id)
        )
        db.get_db().commit()  # Commit the changes to the database
        return make_response(jsonify({'success': 'Answer created'}), 201)
    except Exception as e:
        db.get_db().rollback()  # Rollback in case of any error
        return make_response(jsonify({'error': 'Failed to create Answer'}), 500)
    finally:
        cursor.close()

# Delete route to delete an answer based on its answer_id
@answer.route('/Answer/<Answer_ID>', methods=['DELETE'])
def delete_answer(Answer_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM Answer WHERE Answer_ID = %s', (Answer_ID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({'error': 'Answer not found'}), 404)
        return make_response(jsonify({'success': 'Answer deleted'}), 200)
    except Exception as e:
        db.get_db().rollback()
        return make_response(jsonify({'error': 'Failed to delete Answer'}), 500)
    finally:
        cursor.close()

# update answer by answer id
@answer.route('/Answer/<Answer_ID>', methods=['PUT'])
def update_answer(Answer_ID):
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Answer WHERE Answer_ID = %s", (Answer_ID,))
    if cursor.rowcount == 0:
        return jsonify({'error': 'Answer not found'}), 404
    updates = []
    values = []
    for field in ['Question_ID', 'Date', 'Content', 'User_ID']:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])
    
    if not updates:
        return jsonify({'error': 'There were no valid fields to update'}), 400
    
    update_stmt = "UPDATE Answer SET " + ", ".join(updates) + " WHERE Answer_ID = %s"
    values.append(Answer_ID)

    try:
        cursor.execute(update_stmt, values)
        if cursor.rowcount == 0:
            db.get_db().rollback()
            return jsonify({'error': 'No Answer updated'}), 400
        else:
            db.get_db().commit()
            return jsonify({'message': 'Answer updated successfully'}), 200
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

# Get answer by answer id
@answer.route('/Answer/<Answer_ID>', methods=['GET'])
def get_answer_by_ID(Answer_ID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Answer where Answer_ID = {0}'.format(Answer_ID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        row = (dict(zip(row_headers, row)))
        for key, value in row.items():
            if isinstance(value, bytes): 
                row[key] = value.decode('utf-8')
        json_data.append(row)

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get answer by user id
@answer.route('/Answer/<User_ID>', methods=['GET'])
def get_answer_by_UID(Answer_ID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Answer where Answer_ID = {0}'.format(Answer_ID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        row = (dict(zip(row_headers, row)))
        for key, value in row.items():
            if isinstance(value, bytes): 
                row[key] = value.decode('utf-8')
        json_data.append(row)

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

