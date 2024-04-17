from flask import Blueprint, request, jsonify, make_response, current_app
import json
from datetime import datetime
from src import db

review = Blueprint('review', __name__)


@review.route('/Review', methods=['GET'])
def get_review1():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Review')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@review.route('/Review', methods=['POST'])
def add_review():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    title = data.get('Title')
    date = data.get('Date')
    if date:
        date = datetime.strptime(date, '%Y-%m-%d %H:%M').strftime('%Y-%m-%d')
    rating = data.get('Rating')
    content = data.get('Content')
    user_id = data.get('User_ID')
    position_id = data.get('Position_ID')
    skills_used = data.get('SkillsUsed')

    if not all([title, date, rating, content, user_id, position_id]):
        return jsonify({'error': 'Missing required data'}), 400

    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO Review (Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed) VALUES (%s, %s, %s, %s, %s, %s, %s)',
            (title, date, rating, content, user_id, position_id, skills_used)
        )
        db.get_db().commit()  # commit
        rev_id = cursor.lastrowid # ge the auto incremented id 
        return jsonify({'success': 'Review added', 'Review_ID': rev_id}), 201  
    except Exception as e:
        db.get_db().rollback()  # Roll back if error
        return jsonify({'error': 'Failed to add review: {}'.format(str(e))}), 500
    finally:
        cursor.close() 

#----------------------------------------------------------------------------------------------------------------------------------------

@review.route('/Review/<Review_ID>', methods=['GET'])
def get_review2(Review_ID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Review where Review_ID = {0}'.format(Review_ID))
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


@review.route('/Review/<Review_ID>', methods=['DELETE'])
def delete_review(Review_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM Review WHERE Review_ID = %s', (Review_ID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return jsonify({'error': 'Review not found'}), 404
        return jsonify({'success': 'Review deleted'}), 200
    except Exception as e:
        db.get_db().rollback() 
        return jsonify({'error': 'Failed to delete Review: {}'.format(str(e))}), 500
    finally:
        cursor.close()



@review.route('/Review/<Review_ID>', methods=['PUT'])
def update_user2(Review_ID):
    data = request.get_json()
    cursor = db.get_db().cursor()

    Title = data.get('Title')
    Date = data.get('Date')
    if Date:
        Date = datetime.strptime(Date, '%a, %d %b %Y %H:%M:%S GMT').strftime('%Y-%m-%d')
    Rating = data.get('Rating')
    Content = data.get('Content')
    User_ID = data.get('User_ID')
    Position_ID = data.get('Position_ID')
    SkillsUsed = data.get('SkillsUsed')

    query = '''
        UPDATE Review
        SET Title = %s,
            Date = %s,
            Rating = %s,
            Content = %s,
            User_ID = %s,
            Position_ID = %s,
            SkillsUsed = %s
        WHERE Review_ID = %s
    '''
    cursor.execute(query, (Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed, Review_ID))
    db.get_db().commit()
    return jsonify({'success': True, 'message': 'User updated successfully'}), 200

#--------------------------------------------------------------------------------------------------------------------------
@review.route('/Review/<Position_ID>/<Cycle_ID>/<Company_ID>', methods=['GET'])
def get_review_by_keys(Position_ID, Cycle_ID, Company_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'SELECT * FROM Review WHERE Position_ID = %s AND CycleID = %s AND Company_ID = %s',
            (Position_ID, Cycle_ID, Company_ID)
        )
        row_headers = [x[0] for x in cursor.description]
        reviews = cursor.fetchall()
        if not reviews:
            return jsonify({'message': 'No reviews found'}), 404
        json_data = [dict(zip(row_headers, row)) for row in reviews]
        return jsonify(json_data), 200
    except Exception as e:
        return jsonify({'error': 'Failed to fetch Reviews'}), 500
    finally:
        cursor.close()


@review.route('/Review/<Position_ID>', methods=['GET'])
def get_review_by_keys2(Position_ID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'SELECT * FROM Review WHERE Position_ID = %s',
            (Position_ID)
        )
        row_headers = [x[0] for x in cursor.description]
        reviews = cursor.fetchall()
        if not reviews:
            return jsonify({'message': 'No reviews found'}), 404
        json_data = [dict(zip(row_headers, row)) for row in reviews]
        return jsonify(json_data), 200
    except Exception as e:
        return jsonify({'error': 'Failed to fetch reviews'}), 500
    finally:
        cursor.close()
