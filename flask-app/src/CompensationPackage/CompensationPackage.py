from flask import Blueprint, request, jsonify, make_response
import json
from src import db


compensationpackage = Blueprint('CompensationPackage', __name__)


# Get customer detail for customer with particular userID
@compensationpackage.route('/CompensationPackage/<Position_ID>', methods=['GET'])
def get_CP(Position_ID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from CompensationPackage where CPID = {0}'.format(Position_ID))
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


# Post route to update compensation packages in the DB
@compensationpackage.route('/CompensationPackage', methods=['POST'])
def create_CP():
    data = request.get_json()
    if not data:
        return make_response(jsonify({'error': 'No data provided'}), 400)
    
    Perks = data.get('Perks')
    Hourly = data.get('Hourly')
    BonusTotal = data.get('BonusTotal')
    HousingTotal = data.get('HousingTotal')
    RelocationTotal = data.get('RelocationTotal')
    Position_ID = data.get('Position_ID')
    
    if not all([Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID]):
        return make_response(jsonify({'error': 'Missing data'}), 400)
    
    try:
        cursor = db.get_db().cursor()
        cursor.execute(
            'INSERT INTO CompensationPackage (Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_I) VALUES (%s, %s, %s, %s, %s, %s)',
            (Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID)
        )
        db.get_db().commit()  # Commit the changes to the database
        return make_response(jsonify({'success': 'Compensation Package created'}), 201)
    except Exception as e:
        db.get_db().rollback()  # Rollback in case of any error
        return make_response(jsonify({'error': 'Failed to create Compensation Package'}), 500)
    finally:
        cursor.close()