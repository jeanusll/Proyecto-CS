from backend.models.mysql_connection_pool import MySQLPool

class UsuarioModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()

    def get_usuario(self, id_usuario):    
        params = {'id_usuario' : id_usuario}      
        rv = self.mysql_pool.execute("""SELECT * from usuarios where id_usuario = %(id_usuario)s""", params)                
        data = []
        content = {}
        for result in rv:
            content = {'id_usuario': result[0], 'email': result[1],'contraseña': result[2]}
            data.append(content)
            content = {}
        return data

    def get_usuarios(self):  
        rv = self.mysql_pool.execute("""SELECT * from usuarios""")  
        data = []
        content = {}
        for result in rv:
            content = {'id_usuario': result[0], 'email': result[1],'contraseña': result[2]}
            data.append(content)
            content = {}
        return data

    def create_usuario(self, email, contra):    
        data = {
            'email' : email,
            'contra' : contra
        }  
        query = """insert into usuarios (email, contra) 
            values (%(email)s, %(contra)s)"""    
        cursor = self.mysql_pool.execute(query, data, commit=True)   

        data['id_usuario'] = cursor.lastrowid
        return data

    def update_usuario(self, id_usuario, contra, email):    
        data = {
            'id_usuario' : dni_alumno,            
            'contra' : dni_alumno,            
            'email' : id_usuario            
        }  
        query = """update usuarios set contra = %(contra)s, email = %(email)s where id_usuario = %(id_usuario)s"""    
        cursor = self.mysql_pool.execute(query, data, commit=True)   

        result = {'result':1} 
        return result

    def delete_usuario(self, id_usuario):    
        params = {'id_usuario' : id_usuario}      
        query = """delete from usuarios where id_usuario = %(id_usuario)s"""    
        self.mysql_pool.execute(query, params, commit=True)   

        data = {'result': 1}
        return data

