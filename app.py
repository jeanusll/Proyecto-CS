from flask import Flask
from flask import request
from flask import jsonify
from flask import render_template
from flask_cors import CORS, cross_origin 

from backend.blueprints.alumno_blueprint import alumno_blueprint
from backend.blueprints.curso_blueprint import curso_blueprint
from backend.blueprints.usuario_blueprint import usuario_blueprint
from backend.blueprints.profesor_blueprint import profesor_blueprint
from backend.blueprints.seccion_blueprint import seccion_blueprint

app = Flask(__name__)

app.register_blueprint(alumno_blueprint)
app.register_blueprint(curso_blueprint)
app.register_blueprint(usuario_blueprint)
app.register_blueprint(profesor_blueprint)
app.register_blueprint(seccion_blueprint)

cors = CORS(app)

if __name__ == "__main__":
    app.run(debug=True)