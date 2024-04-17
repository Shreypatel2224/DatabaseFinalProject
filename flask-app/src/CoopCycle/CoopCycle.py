from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


coopcycle = Blueprint('CoopCycle', __name__)

# Get all coop cycles from the DB
@coopcycle.route('/CoopCycle', methods=['GET'])
def get_coopcycle():
    cursor = db.get_db().cursor()
    cursor.execute('select * From CoopCycle')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@coopcycle.route('/CoopCycle', methods=['POST'])
def add_CoopCycle():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    Year = data.get('Year')
    PlacementRate = data.get('PlacementRate')
    Type = data.get('Type')

    if not all([Year, PlacementRate, Type]):
        return jsonify({'error': 'Missing required data'}), 400

    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO CoopCycle (Year, PlacementRate, Type) VALUES (%s, %s, %s)',
            (Year, PlacementRate, Type)
        )
        db.get_db().commit()  # commit
        cc_id = cursor.lastrowid # ge the auto incremented id 
        return jsonify({'success': 'CoopCycle added', 'CoopCycle_ID': cc_id}), 201  
    except Exception as e:
        db.get_db().rollback()  # Roll back if error
        return jsonify({'error': 'Failed to add CoopCycle: {}'.format(str(e))}), 500
    finally:
        cursor.close() 
