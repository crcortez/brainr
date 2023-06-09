from flask import Blueprint, jsonify, abort, request
from ..models import User, db, Blogposts, likes
import hashlib
import secrets

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()


bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response


@bp.route('', methods=['POST'])
def create():
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)

    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)

    u = User(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )
    db.session.add(u) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(u.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id)
    try:
        db.session.delete(u) #prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())


@bp.route('/<int:id>', methods=['PATCH','PUT'])
def update(id):
    u = User.query.get_or_404(id)
    if 'username' not in request.json and 'password' not in request.json:
        return abort(400)
    elif 'username' in request.json and len(request.json['username']) < 3:
        return abort(400)
    elif 'password' in request.json and len(request.json['password']) < 8:
        return abort(400)
    elif 'username' in request.json and 'password' not in request.json:
        u.username = request.json['username']
    elif 'password' in request.json and 'username' not in request.json:
        u.password = scramble(request.json['password'])
    else:
        u.username = request.json['username']
        u.password = scramble(request.json['password'])

    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)

    
