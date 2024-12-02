from flask import Flask, render_template, Blueprint, send_from_directory, jsonify
from database import session
from models import Book, Author, Publisher, Selection
from api import api_bp  # Blueprint pour les routes de l'API
from flask_swagger_ui import get_swaggerui_blueprint


def create_app():
    app = Flask(__name__)
    app.register_blueprint(api_bp)
    return  app

### Swagger Configuration ###
SWAGGER_URL = '/swagger'
API_URL = '/swagger.yml'  # Chemin vers le fichier YAML de Swagger

api = Blueprint('api', __name__)

app = create_app()

swaggerui_blueprint = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': "Prix Goncourt API"
    }
)


app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

def api_root():
    """    Root endpoint for the API.    **Description:**    Returns a welcome message to confirm that the API is accessible.    **Response:**    - 200: Success with a JSON welcome message.    """
    return jsonify({"message": " Prix Goncourt API"}), 200

@api.route('/swagger.yaml', methods=['GET'])
def swagger_spec():
    """    Serves the swagger.yaml file.    """
    return send_from_directory('.', 'swagger.yml')

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