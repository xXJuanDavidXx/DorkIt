import json
from rich.console import Console
from rich.table import Table
from rich.padding import Padding
from rich.rule import Rule



class ResultsParser:
    def __init__(self, resultados):
        self.resultados = resultados

    def exportar_html(self, archivo_salida):
        with open("html_template.html", "r", encoding="utf-8") as f:
            plantilla = f.read()


        elementos_html = ""
        for indice, resultado in enumerate(self.resultados, start=1):
            elementos = f'<div class="resultados">' \
                    f'<div class="indice">{indice}</div>' \
                    f'<h5>{resultado["title"]}</h5>' \
                    f'<p>{resultado["description"]}</p>' \
                    f'<a href="{resultado["link"]} target=_blank">{resultado["link"]}</a>' \
                    f'</div>'

            elementos_html += elementos
        informe_html = plantilla.replace('{{ resultados }}', elementos_html)
        
        with open(archivo_salida, "w", encoding="utf-8") as f:
            f.write(informe_html)
        print(f"Resultados exportados a HTML. Fichero creado: {archivo_salida}")



    def exportar_json(self, archivo_salida):
        with open(archivo_salida, "w", encoding="utf-8") as f:
            json.dump(self.resultados, f, ensure_ascii=False, indent=4)
        print(f"Resultados exportados a JSON. Fichero creado: {archivo_salida}")
        

    def mostrar_pantalla(self):
        #for indice, resultado in enumerate(self.resultados, start=1):
         #   print(f"{indice}. {resultado['title']}")
         #   print(resultado["description"])
         #   print(resultado["link"])
         #   print("")
         
         #instanciamos el objeto consola
        console = Console()        
        #Instanciamos el objeto tabla
        table = Table(show_header=True, header_style="bold magenta")
        #Añadimos las columnas
        table.add_column("#", style="dim")
        table.add_column("Título", width=50)
        table.add_column("Descripción")
        table.add_column("Enlace")
        #Creamos las filas
        for indice, resultado in enumerate(self.resultados, start=1):
            table.add_row(
                str(indice),
                resultado["title"],
                resultado["description"],
                resultado["link"]
            )
            table.add_row("", "", "", "")
        #Mostramos la tabla
        console.print(table)


class OrdenarRgex:
    def __init__(self, ocurrencias):
        self.ocurrencias = ocurrencias

    def mostrar_ocurrencias(self):
        """Muestra las ocurrencias de archivos en una tabla utilizando rich."""
        consola = Console()
        tabla = Table(show_header=True, header_style="bold magenta")
        tabla.add_column("Archivo", style="dim", width=30)
        tabla.add_column("Ocurrencias", justify="left")

        for archivo, resultado in self.ocurrencias.items():
            ocurrencias_formateadas = "\n".join(map(str, resultado))
            tabla.add_row(archivo, Padding(ocurrencias_formateadas, (1, 0, 1, 0)))
            tabla.add_row(Rule(style="grey50"), Rule(style="grey50"))  # Línea delimitadora
        
        consola.print(tabla)
            #print(archivo) # EL archivo,
            #for r in resultado: #Y para cada resultado
             #   print(f"\t{r}") #Imprimimos el resultado



