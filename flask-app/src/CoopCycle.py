from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


coopcycle = Blueprint('CoopCycle', __name__)

# Get all coop cycles from the db
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


#updates a CoopCycle
@coopcycle.route('/CoopCycle/<CycleID>', methods=['PUT'])
def update_CoopCycle(CycleID):
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM CoopCycle WHERE CycleID = %s", (CycleID,))
    if cursor.rowcount == 0:
        return jsonify({'error': 'CC not found'}), 404
    updates = []
    values = []
    for field in ['Year', 'PlacementRate', 'Type']:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])
    
    if not updates:
        return jsonify({'error': 'There were no valid fields to update'}), 400
    
    update_stmt = "UPDATE CoopCycle SET " + ", ".join(updates) + " WHERE CycleID = %s"
    values.append(CycleID)
    
    try:
        cursor.execute(update_stmt, values)
        if cursor.rowcount == 0:
            db.get_db().rollback()
            return jsonify({'error': 'No CC updated'}), 400
        else:
            db.get_db().commit()
            return jsonify({'message': 'CC updated successfully'}), 200
    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500


#deletes a coop cycle based on its given ID
@coopcycle.route('/CoopCycle/<CycleID>', methods=['DELETE'])
def delete_CC(CycleID):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM CoopCycle WHERE CycleID = %s', (CycleID,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({'error': 'CC not found'}), 404)
        return make_response(jsonify({'success': 'CC deleted'}), 200)
    except Exception as e:
        db.get_db().rollback()
        return make_response(jsonify({'error': 'Failed to delete CC'}), 500)
    finally:
        cursor.close()


@coopcycle.route('/CoopCycle/<CycleID>', methods=['GET'])
def get_CoopCycleByID(CycleID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from CoopCycle where CycleID = {0}'.format(CycleID))
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


@coopcycle.route('/CoopCycle/<Type>', methods=['GET'])
def get_CoopCycleByID(Type):
    cursor = db.get_db().cursor()
    cursor.execute('select * from CoopCycle where CycleID = {0}'.format(Type))
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

