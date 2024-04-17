from flask import Blueprint, request, jsonify, make_response
import json
from src import db

review = Blueprint('review', __name__)


@review.route('/review', methods=['GET'])
def get_review():
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




@review.route('/review', methods=['POST'])
def add_review():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    title = data.get('Title')
    date = data.get('Date')
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
        db.get_db().commit()
        return jsonify({'success': 'Review added'}), 201
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': 'Failed to add review'}), 500
    finally:
        cursor.close()

@review.route('/review/<int:review_id>', methods=['GET'])
def get_review(review_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('SELECT * FROM Review WHERE Review_ID = %s', (review_id,))
        row_headers = [x[0] for x in cursor.description]
        review = cursor.fetchone()
        if not review:
            return jsonify({'message': 'Review not found'}), 404
        json_data = dict(zip(row_headers, review))
        return jsonify(json_data), 200
    except Exception as e:
        return jsonify({'error': 'Failed to fetch review'}), 500
    finally:
        cursor.close()

@review.route('/review/<int:review_id>', methods=['DELETE'])
def delete_review(review_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM Review WHERE Review_ID = %s', (review_id,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return jsonify({'error': 'Review not found'}), 404
        return jsonify({'success': 'Review deleted'}), 200
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': 'Failed to delete review'}), 500
    finally:
        cursor.close()

@review.route('/review/<int:position_id>/<int:cycle_id>/<int:company_id>', methods=['GET'])
def get_review_by_keys(position_id, cycle_id, company_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'SELECT * FROM Review WHERE Position_ID = %s AND CycleID = %s AND Company_ID = %s',
            (position_id, cycle_id, company_id)
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
