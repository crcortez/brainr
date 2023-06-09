from flask import Blueprint, jsonify, abort, request
from ..models import Blogposts, User, db

bp = Blueprint('blogposts', __name__, url_prefix='/blogposts')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    blogposts = blogposts.query.all() # ORM performs SELECT query
    result = []
    for b in blogposts:
        result.append(b.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    b = Blogposts.query.get_or_404(id)
    return jsonify(b.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain user_id and content
    if 'user_id' not in request.json or 'content' not in request.json:
        return abort(400)
    # user with id of user_id must exist
    User.query.get_or_404(request.json['user_id'])
    # construct Tweet
    b = Blogposts(
        user_id=request.json['user_id'],
        content=request.json['content']
    )
    db.session.add(b) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(b.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    b = Blogposts.query.get_or_404(id)
    try:
        db.session.delete(b) #prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>/likes', methods=['GET'])
def liking_users(id: int):
    u = Blogposts.query.get_or_404(id)
    result = []
    for u in u.likes:
        result.append(u.serialize())
    return jsonify(result)
