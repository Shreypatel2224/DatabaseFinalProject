from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


compensationpackage = Blueprint('CompensationPackage', __name__)


# Get all users from the DB
@compensationpackage.route('/CompensationPackage', methods=['GET'])
def get_all_compensation_packages():
    cursor = db.get_db().cursor()
    # cursor.execute('select User_ID, Username, User_Type, Password, Email FROM User')
    cursor.execute('select * FROM CompensationPackage')

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


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
            'INSERT INTO CompensationPackage (Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID) VALUES (%s, %s, %s, %s, %s, %s)',
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


@compensationpackage.route('/CompensationPackage/<CPID>', methods=['PUT'])
def update_question(CPID):
    data = request.get_json()
    cursor = db.get_db().cursor()

    Perks = data.get('Perks')
    Hourly = data.get('Hourly')
    BonusTotal = data.get('BonusTotal')
    HousingTotal = data.get('HousingTotal')
    RelocationTotal = data.get('RelocationTotal')
    HousingID = data.get('HousingID')

    query = '''
        UPDATE CompensationPackage
        SET Perks = %s,
            Hourly = %s,
            BonusTotal = %s,
            HousingTotal = %s,
            RelocationTotal = %s,
            HousingID = %s

        WHERE CPID = %s
    '''
    cursor.execute(query, (Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, HousingID, CPID))
    db.get_db().commit()
    return jsonify({'success': True, 'message': 'User updated successfully'}), 200







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

# Get compensation package by the hourly rate
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