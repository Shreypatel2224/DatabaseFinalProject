from flask import Blueprint, request, jsonify, make_response, current_app
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

# Post route to add a question
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

# Delete route to delete an question based on its question_id
@question.route('/Question/<Question_ID>', methods=['DELETE'])
def delete_question(Question_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM Question WHERE Question_ID = %s', (Question_ID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({'error': 'Question not found'}), 404)
        return make_response(jsonify({'success': 'Question deleted'}), 200)
    except Exception as e:
        db.get_db().rollback()
        return make_response(jsonify({'error': 'Failed to delete Question'}), 500)
    finally:
        cursor.close()

# Update question by question id
@question.route('/Question/<Question_ID>', methods=['PUT'])
def update_question(Question_ID):
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Question WHERE Question_ID = %s", (Question_ID,))
    if cursor.rowcount == 0:
        return jsonify({'error': 'Question not found'}), 404
    updates = []
    values = []
    for field in ['Title', 'Date', 'Status', 'Content', 'User_ID']:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])
    
    if not updates:
        return jsonify({'error': 'There were no valid fields to update'}), 400
    
    update_stmt = "UPDATE Question SET " + ", ".join(updates) + " WHERE Question_ID = %s"
    values.append(Question_ID)

    try:
        cursor.execute(update_stmt, values)
        if cursor.rowcount == 0:
            db.get_db().rollback()
            return jsonify({'error': 'No Question updated'}), 400
        else:
            db.get_db().commit()
            return jsonify({'message': 'Question updated successfully'}), 200
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

# Get question by question id
@question.route('/Question/<Question_ID>', methods=['GET'])
def get_question_by_ID(Question_ID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Question where Question_ID = {0}'.format(Question_ID))
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

# Get question with certain status
@question.route('/Question/<Status>', methods=['GET'])
def get_question_by_status(Status):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Question where Question_ID = {0}'.format(Status))
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