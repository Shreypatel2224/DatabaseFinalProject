# Some set up for the application 

from flask import Flask
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()

def create_app():
    app = Flask(__name__)
    
    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL. 
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_root_password.txt').readline().strip()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'CoopConnect'  # Change this to your DB name

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Add the default route
    # Can be accessed from a web browser
    # http://ip_address:port/
    # Example: localhost:8001
    @app.route("/")
    def welcome():
        return "<h1>Welcome to the 3200 boilerplate app</h1>"

    # Import the various Beluprint Objects
    from src.User import user
    from src.CompensationPackage import compensationpackage
    from src.Question import question
    from src.Review import review
    from src.Answer import answer
    from src.CoopCycle import coopcycle



    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.register_blueprint(compensationpackage,   url_prefix='/cp')
    app.register_blueprint(question,   url_prefix='/q')
    app.register_blueprint(user,   url_prefix='/u')
    app.register_blueprint(review,   url_prefix='/r')
    app.register_blueprint(answer,   url_prefix='/a')
    app.register_blueprint(coopcycle,   url_prefix='/cc')



    # Don't forget to return the app object
    return app