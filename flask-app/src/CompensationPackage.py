from flask import Blueprint, request, jsonify, make_response, current_app
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

# Delete compensation package by CPID
@compensationpackage.route('/CompensationPackage/<CPID>', methods=['DELETE'])
def delete_CP(CPID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM CompensationPackage WHERE CPID = %s', (CPID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({'error': 'CompensationPackage not found'}), 404)
        return make_response(jsonify({'success': 'CompensationPackage deleted'}), 200)
    except Exception as e:
        db.get_db().rollback()
        return make_response(jsonify({'error': 'Failed to delete CompensationPackage'}), 500)
    finally:
        cursor.close()

# Update compensation package by CPID
@compensationpackage.route('/CompensationPackage/<CPID>', methods=['PUT'])
def update_CP(CPID):
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM CompensationPackage WHERE CPID = %s", (CPID,))
    if cursor.rowcount == 0:
        return jsonify({'error': 'CompensationPackage not found'}), 404
    updates = []
    values = []
    for field in ['Perks', 'Hourly', 'BonusTotal', 'HousingTotal', 'RelocationTotal', 'Position_ID']:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])
    
    if not updates:
        return jsonify({'error': 'There were no valid fields to update'}), 400
    
    update_stmt = "UPDATE CompensationPackage SET " + ", ".join(updates) + " WHERE CPID = %s"
    values.append(CPID)
    
    try:
        cursor.execute(update_stmt, values)
        if cursor.rowcount == 0:
            db.get_db().rollback()
            return jsonify({'error': 'No CompensationPackage updated'}), 400
        else:
            db.get_db().commit()
            return jsonify({'message': 'CompensationPackage updated successfully'}), 200
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

# Get compensation package by bonus total
@compensationpackage.route('/CompensationPackage/<BonusTotal>', methods=['GET'])
def get_CP_by_BT(BonusTotal):
    cursor = db.get_db().cursor()
    cursor.execute('select * from CompensationPackage where BonusTotal = {0}'.format(BonusTotal))
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

# Get compensation package by hourly rate
@compensationpackage.route('/CompensationPackage/<Hourly>', methods=['GET'])
def get_CP_by_hourly(Hourly):
    cursor = db.get_db().cursor()
    cursor.execute('select * from CompensationPackage where Hourly = {0}'.format(Hourly))
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