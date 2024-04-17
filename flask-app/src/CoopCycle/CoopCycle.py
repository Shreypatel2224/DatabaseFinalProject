from flask import Blueprint, request, jsonify, make_response
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