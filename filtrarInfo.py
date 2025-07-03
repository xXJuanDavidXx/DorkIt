import os
import re
import argparse

class SmartSearch:
    def __init__(self, dir_path):
        """Recibe la ruta a un directorio con archivos a nalizar."""
        self.dir_path = dir_path
        self.files = self._read_files()


    def _read_files(self): 
        """Lee el contenido de los ficheros que se encuentran en un directorio."""
        files = {} #diccionario con los archivos.
        # Listar ficheros
        for archivo in os.listdir(self.dir_path): #Para cada archivo en el directorio
            file_path = os.path.join(self.dir_path, archivo)#Crea la ruta del archivo con la ruta proporcionada y el archivo.
            try:
                with open(file_path, 'r', encoding='utf-8') as f: #Leemos el directorio
                    files[archivo] = f.read() #Agregamos el archivo al diccionario

            except Exception as e:
                print(f"Error al leer el archivo {file_path}: {e}") # en caso de no poder leer el archivo

        return files # Devuelve el diccionario con el nombre del archivo y el texto.


    def regex_search(self, regex):
        """Busca información utilizando expresiones regulares."""
        coincidencias = {}#Inicializamos un diccionario vacio 

        for archivo, texto in self.files.items(): #Para cada clave valor del diccionario retornado a files 
            respuesta = "" # Inicializamos una cadena vacia
            while respuesta not in ("y","n","yes","no"): #Mientras la respuesta no sea y n o yes no, 
                respuesta = input(f"El archivo {archivo} tiene una longitud de {len(texto)} caracteres ¿continuar? (y/n)") #Preguntamos al usuario si quiere analizar el archivo.
                if respuesta in ("n", "no"):# Si la respuesta es no
                    continue #Pasamos al siguiente archivo
                ocurrencias = re.findall(regex, texto, re.IGNORECASE) #findall busca todas las ocurrencias en una cadena y devuelve una lista, recibe (expresion_regular, texto)
                if not ocurrencias == []: #Si el resultado no es una lista vacia.
                    coincidencias[archivo] = ocurrencias #agregamos los resultados aplicar la expresión regular a el dicionario coincidencias.
        return coincidencias #retornamos el diccionario


if __name__=="__main__":
    #configuramos argumentos en el programa.
    parser = argparse.ArgumentParser(description="Filtra con expresiones regulares en ficheros")
    parser.add_argument("ruta", type=str, help="La ruta al directorio donde se encuentran los ficheros.")
    parser.add_argument("-r","--regex",type=str, help="Expresion regular para hacer la busqueda.")

    #parseamos los argumentos
    args = parser.parse_args()
    
    if args.regex: # Si se proporciona una expresion regular
        buscar = SmartSearch(args.ruta) #instanciamos la clase con la ruta que nos dio el usuario
        resultados = buscar.regex_search(args.regex) # diccionario con los resultados
        print()
        for archivo, resultado in resultados.items(): #Para cada clave valor del diccionario
            print(archivo) # EL archivo,
            for r in resultado: #Y para cada resultado
                print(f"\t{r}") #Imprimimos el resultado






