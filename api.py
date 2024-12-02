from flask import Flask, jsonify, request, Blueprint, render_template
from models import Book, Selection
from database import session

# Définir un Blueprint
api_bp = Blueprint('api', __name__, url_prefix='/api')

app = Flask(__name__)

@api_bp.route('/books', methods=['GET'])
def get_books():
    books = session.query(Book).all()
    return jsonify([{'id': b.id, 'title': b.title} for b in books])

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/books/<selection_type>')
def display_books_by_selection(selection_type):
    try:
        # Requête pour récupérer les livres par type de sélection
        books = session.query(Book).join(Selection, Book.id == Selection.id).filter(Selection.type == selection_type).all()

        # Récupération des auteurs et éditeurs pour chaque livre
        books_details = []
        for book in books:
            author = session.query(Author).filter(Author.id == book.author_id).first()
            publisher = session.query(Publisher).filter(Publisher.id == book.publisher_id).first()
            books_details.append({
                'title': book.title,
                'summary': book.summary,
                'author': author.name if author else 'Author not found',
                'publisher': publisher.name if publisher else 'Publisher not found',
                'publication_date': book.publication_date,
                'pages': book.pages,
                'isbn': book.isbn,
                'publisher_price': book.publisher_price
            })

        # Rendre la page HTML en passant les données des livres
        return render_template('livres/livres.html', selection_type=selection_type, books=books_details)

    except Exception as e:
        return f"Error displaying books: {e}"

if __name__ == '__main__':
    app.run(debug=True)

app.register_blueprint(api_bp)
