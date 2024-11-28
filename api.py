rom flask import Flask, jsonify, request, Blueprint
from models import Book, Selection
from database import session

api_bp = Blueprint('api', __name__, url_prefix='/api')

@api_bp.route('/books', methods=['GET'])
def get_books():
    books = session.query(Book).all()
    return jsonify([{'id': b.id, 'title': b.title, 'slug': b.slug} for b in books])

