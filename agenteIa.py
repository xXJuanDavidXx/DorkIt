from gpt4all import GPT4All
from openai import OpenAI
from dotenv import load_dotenv
import os

class GPT4allGenerador:
    """Se Encarga de generar texto usando la libreria gpt4all"""
    def __init__(self, modelo="orca-mini-3b-gguf2-q4_0.gguf"):
        self.model = GPT4All(modelo)
        
    def generar(self, prompt):
        return self.model.generate(prompt, max_tokens=1024)

class IaGenerador:
    """Se encarga de generar texto usando la libreria openai"""
    def __init__(self, modelo="qwen/qwen2.5-vl-72b-instruct:free"):
        self.modelo = modelo
        self.api = os.getenv("OPENAI_API_KEY")
        self.cliente = OpenAI(api_key=self.api, base_url="https://openrouter.ai/api/v1")

    def generar(self, prompt):
        self.chat = self.cliente.chat.completions.create(
            model=self.modelo,
            messages=[{
                "role": "user",
                "content": prompt
            }]
        )
        return self.chat.choices[0].message.content

class AgenteIa:
    def __init__(self, generador):
        self.generador = generador

    def chat(self, descripcion):
        prompt = self.__crear_promt__(descripcion)
        try:
            output = self.generador.generar(prompt)
        except Exception as e:
            print(e)
            output = None
        return output

    def __crear_promt__(self, prompt):
        return f"""
Genera un Google Dork específico basado en la descripción del usuario. Un Google Dork utiliza operadores avanzados en motores de búsqueda para encontrar información específica que es difícil de encontrar mediante una búsqueda normal. Tu tarea es convertir la descripción del usuario en un Google Dork preciso. A continuación, se presentan algunos ejemplos de cómo deberías formular los Google Dorks basándote en diferentes descripciones:

Descripción: Documentos PDF relacionados con la seguridad informática publicados en el último año.
Google Dork: filetype:pdf "seguridad informática" after:2023-01-01

Descripción: Presentaciones de Powerpoint sobre cambio climático disponibles en sitios .edu.
Google Dork: site:.edu filetype:ppt "cambio climático"

Descripción: Listas de correos electrónicos en archivos de texto dentro de dominios gubernamentales.
Google Dork: site:.gov filetype:txt "email" | "correo electrónico"

Ahora, basado en la siguiente descripción proporcionada por el usuario, genera el Google Dork correspondiente:

Descripción: {prompt}
       """ 
