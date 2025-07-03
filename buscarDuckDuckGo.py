from duckduckgo_search import DDGS

#results = DDGS().text("python programming", max_results=5)
#print(results)


class BuscarDuckDuckGo():
    """
    Busca en DuckDuckgo usando la libreria duckduckgo_search
    """
    ddgs = DDGS() # Atributo de clase, instancia de DDGS

    def buscar(self, query, max_results=5, region="wt-wt"):
        """
        Busca en DuckDuckGo y retorna los resultados

            args:
                query: str -- La consulta a buscar es obligatoria
                max_results: int -- La cantidad de resultados a mostrar, por defecto 5[opcional]
                region: str -- La region de busqueda, por defecto "wt-wt" [opcional]
        """
        resultado = self.ddgs.text(query, max_results, region)
        resultado_ordenado = self.ordenar_resultados(resultado)
        return resultado_ordenado


    def ordenar_resultados(self,resultados):
        """
        Ordena los resultados de la busqueda

            args:
                resultados: list -- La lista de resultados a ordenar
        """

        ordenados = []

        for r in resultados:
            dicc = {
                "title": r["title"],
                "link": r["href"],
                "text": r["body"]
            }
            ordenados.append(dicc)
        return ordenados



# Buscar en DuckDuckGo






#query = "https://serpapi.com/search?engine=duckduckgo"
#https://serpapi.com/search.json?engine=duckduckgo&q=Apple&kl=us-en
