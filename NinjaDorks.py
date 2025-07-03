import requests
from dotenv import load_dotenv, set_key
from buscarGoogle import BuscarGoogle
#from buscarDuckDuckGo import BuscarDuckDuckGo
from result_parser import ResultsParser, OrdenarRgex
from descargar_archivo import Descargar
import os
import argparse
import sys
from agenteIa import AgenteIa, IaGenerador, GPT4allGenerador
from filtrarInfo import SmartSearch


# load_dotenv() # Con esta función cargamos las variables de entorno


# page = 1

# query = 'cats filetype:pdf'#Consulta a realizar.
# ADVERTENCIA: Si google detecta una consulta muy compleja como esta, es posible que no permita realizarlas de manera automatizada y el codigo nos devuelva un TypeError object is not iterable.
# Tambien puede darse el caso de que no hay mas resultados en las demas paginas y devuelve el mismo error.

def env_config():
    """Configurar el archivo .env con los valores proporcionados"""
    api_key = input("Introduce la api key de google: ")
    engine_id = input("Introduce el id del buscador personalizado: ")
    # Para comprobar que exista y si no crear el fichero .env vamos a usar set_key importado de python-dotenv
    set_key(".env", "API_KEY_GOOGLE", api_key)
    set_key(".env", "ENGINE", engine_id)


def openia_env_config():
    """Configurar el archivo .env con los valores proporcionados"""
    api_key = input("Introduce la api key de openai: ")
    set_key(".env", "OPENAI_API_KEY", api_key)



def main(query, configurar_env, inicio_pag, pags, lenguaje, output_json, output_html, download, dork_gen, ruta, regex):
    # Comprobar si se ha configurado el archivo .env
    env_exists = os.path.exists(".env")
    if not env_exists or configurar_env:
        env_config()
        print("Archivo .env configurado correctamente")
        sys.exit(1)

    # Cargar las variables de entorno
    load_dotenv()  # Con esta función cargamos las variables de entorno
    # Leemos la clave api y el id del motor de busqueda
    API_KEY_GOOGLE = os.getenv("API_KEY_GOOGLE")  # De esta forma cargamos la variable de entorno.
    ENGINE = os.getenv("ENGINE")
   


    if dork_gen:
        """Preguntamos si el usuario quiere usar un modelo local u una api de algun modelo compatible con openai"""
        respuesta = ""
        while respuesta.lower() not in ("y", "yes", "n", "no"):
            respuesta = input("¿Deseas usar una api openai? (y/n): ")
        
        if respuesta.lower() in ("y", "yes"):
            #Comprobamos si esta definida la api_key
            if not "OPENAI_API_KEY" in os.environ:
                openia_env_config()
                load_dotenv()

            #Geramos el dorck
            modelo = IaGenerador()
            ia = AgenteIa(modelo)
            
        else:
            print("Usando Gpt4all... \nEste proceso necesita muchos recursos computacionales y puede ser muy tardado.")
            modelo = GPT4allGenerador()
            ia = AgenteIa(modelo)

        respuesta = ia.chat(dork_gen)
        print(f"[+]resultado[+]\n{respuesta}")
        sys.exit(1)


    if regex:
        smart = SmartSearch(ruta)
        coincidencias = smart.regex_search(regex)
        mostrar = OrdenarRgex(coincidencias)
        mostrar.mostrar_ocurrencias()
        sys.exit(1)
        


    if not query:
        print("Introduce una consulta con el comando -q utiliza el comando -h para ver la ayuda")
        sys.exit(1)

    # Instanciamos la clase BuscarGoogle
    google = BuscarGoogle(API_KEY_GOOGLE, ENGINE)
    resultados = google.buscar(query, inicio_pag, pags, lenguaje)

    rparser = ResultsParser(resultados)
    #Mostramos los resultados por consola
    rparser.mostrar_pantalla()

    # Exportar los resultados a un archivo json+
    if output_json:
        rparser.exportar_json(output_json)

    # Exportar los resultados a un archivo html
    if output_html:
        rparser.exportar_html(output_html)

    if download:
        #Separar extenciones de archivos en una lista
        files = download.split(",")
        # Nos quedamos unicamente con las urls de los resultados obtenidos.
        url = [link["link"] for link in resultados]
        descargador = Descargar("Descargas")
        descargador.filtrar_descarga_archivo(url, files)



# duckduckgo = BuscarDuckDuckGo()
# resultado = duckduckgo.buscar(query)
# resultado = google.buscar(query, 2)
# for r in resultado:
# print(r["title"])
# print(r["link"])
# print(r["text"])
# print("\n")


if __name__ == "__main__":
    # Creamos el objeto parser
    parser = argparse.ArgumentParser(description="Esta herramienta permite realizar hacking con buscadores de manera automatica")
    # Añadimos los argumentos
    parser.add_argument("-q", "--query", type=str, help="Especifica el dork que desea buscar. \nEjemplo: -q intitle:\"index of\" \"backup\"")
    parser.add_argument("-c", "--configure", action="store_true", help="Inicia el proceso de configuración del archivo .env\nUtiliza esta opción sin otros argumentos para configurar las claves.")
    parser.add_argument("--start-page", type=int, default=1, help="Define la pagina de inicio del buscador para obtener resultados.")
    parser.add_argument("--pages", type=int, default=1, help="Numero de paginas de resultados de busqueda.")
    parser.add_argument("--lang", type=str, default="lang_es", help="Codigo de idioma para los reusltados de busqueda. Por defecto es 'lang_es' que es español")
    parser.add_argument("--json", type=str, help="Exporta los resultados en formato json en el fichero especificado. --json {fichero.json}")
    parser.add_argument("--html", type=str, help="Exporta los resultados en un archivo html. --html {archivo.html}")
    parser.add_argument("--download", type=str, default="all", help="Descarga los resultados en formato pdf, sql, ..etc. --download {pdf, sql, ..etc}") 
    parser.add_argument("--generar-dork", type=str, help="Genera un dork basado en la descripción del usuario. --generar-dork {descripción}")
    parser.add_argument("--ruta", type=str, help="La ruta al directorio donde se encuentran los ficheros a aplicar Regex.")
    parser.add_argument("-r","--regex",type=str, help="Expresion regular para hacer la busqueda.")

    # Aplicamos los argumentos
    args = parser.parse_args()

    # Llamamos a la funcion main
    main(query=args.query,
         configurar_env=args.configure,
         inicio_pag=args.start_page,
         pags=args.pages,
         lenguaje=args.lang,
         output_json=args.json,
         output_html=args.html,
         download=args.download,
         dork_gen=args.generar_dork,
         ruta=args.ruta,
         regex=args.regex
         )





