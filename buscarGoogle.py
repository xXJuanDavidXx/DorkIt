import requests

class BuscarGoogle():
    """
    Clase para realizar búsquedas en Google.
    """
    def __init__(self, api_key, engine):
        """
        Constructor de la clase
        args:
            api_key -- str
            engine --- str
        """
        self.api_key = api_key
        self.engine = engine
        
    def buscar(self, query, pagInicial=1, numPags=1, lenguaje="lang_es"):
        """Realiza una búsqueda usando la API de Google."""
        resultados = []
        resultado_por_pag = 10 # Google por defecto muestra 10 resultados
        for pag in range(numPags): # NumPags es el número de páginas que se quiere mostrar, recordar que cada página muestra 10 resultados.
            # Calculamos el resultado de comienzo de cada página.
            index_inicial = (pagInicial - 1) * resultado_por_pag + 1 + (pag * resultado_por_pag) # Calcula un nuevo índice respecto al número de páginas que se desea obtener y desde la página inicial.
            url = f"https://www.googleapis.com/customsearch/v1?key={self.api_key}&cx={self.engine}&q={query}&start={index_inicial}&lr={lenguaje}" # Personaliza la búsqueda con la api_key, el motor de búsqueda y la query.
        
            response = requests.get(url) # Realiza la petición a la URL.
        
            if response.status_code == 200: # Si la petición fue exitosa.
                data = response.json() # Obtiene los resultados en formato JSON.
                results = data.get("items") # Obtiene la lista de resultados.
                resultado = self.ordenar_resultados(results) # Ordena los resultados.
                resultados.extend(resultado) # Agrega los resultados a la lista de resultados.
            else:
                print(f"Error al realizar la consulta a la página {pag}: HTTP {response.status_code}")
                break # Si hay un error se detiene la búsqueda.
        return resultados # Retorna los resultados.

    def ordenar_resultados(self, results):
        """Ordena los resultados de la búsqueda."""
        resultado_ordenado = []
        
        for r in results:
            orden = {} # Almacena los resultados ordenados.
            orden["title"] = r.get("title")
            orden["description"] = r.get("snippet")
            orden["link"] = r.get("link")
            resultado_ordenado.append(orden)
        return resultado_ordenado
