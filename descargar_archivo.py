import os
import requests


class Descargar:
    """
    Automatiza la descarga y el guardado de archivos .pdf, .sql, ..etc
    
    args:
        ruta del archivo -- str
    """
    def __init__(self, ruta):
        self.ruta = ruta
        self.crear_directorio()
    
    def crear_directorio(self):
        """Crea el directorio de la ruta"""
        if not os.path.exists(self.ruta):
            os.makedirs(self.ruta)

    def descargar_archivo(self, url):
        """
        Descarga un archivo
        
        args:
            url del archivo --str
        """
        try:
            respuesta = requests.get(url)
            nombre_archivo = url.split("/")[-1]
            ruta_completa = os.path.join(self.ruta, nombre_archivo)
            with open(ruta_completa, "wb") as archivo:  # Corregido `self.ruta_completa`
                archivo.write(respuesta.content)
            print(f"[+]Descargando {nombre_archivo}, en la ruta: {ruta_completa}")
        except Exception as e:
            print(f"No se pudo descargar el archivo {nombre_archivo} : {e}")

    def filtrar_descarga_archivo(self, urls, tipo_archivo=["all"]):
        """
        Maneja las descargas para descargar todos los tipos de archivo
        o descargar algunos en específico.

        args:
            urls: lista de urls -- list
            tipo de archivo -- list
        """
        if tipo_archivo == ["all"]:
            for url in urls:
                self.descargar_archivo(url)
        else:
            for url in urls:
                if any(url.endswith(f".{tipo}") for tipo in tipo_archivo):
                    self.descargar_archivo(url)

