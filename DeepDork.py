from openai import OpenAI

client = OpenAI(api_key="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", base_url="https://openrouter.ai/api/v1")



chat = client.chat.completions.create(
	model="meta-llama/llama-3.3-70b-instruct:free",
	messages=[{
		"role":"user",
        "content":"""
        Genera un Google Dork específico basado en la descripción del usuario. Un Google Dork utiliza operadores avanzados en motores de búsqueda para encontrar información específica que es difícil de encontrar mediante una búsqueda normal. Tu tarea es convertir la descripción del usuario en un Google Dork preciso. A continuación, se presentan algunos ejemplos de cómo deberías formular los Google Dorks basándote en diferentes descripciones:

Descripción: Documentos PDF relacionados con la seguridad informática publicados en el último año.
Google Dork: filetype:pdf "seguridad informática" after:2023-01-01

Descripción: Presentaciones de Powerpoint sobre cambio climático disponibles en sitios .edu.
Google Dork: site:.edu filetype:ppt "cambio climático"

Descripción: Listas de correos electrónicos en archivos de texto dentro de dominios gubernamentales.
Google Dork: site:.gov filetype:txt "email" | "correo electrónico"

Ahora, basado en la siguiente descripción proporcionada por el usuario, genera el Google Dork correspondiente:

Descripción: Listas de correos electrónicos en archivos de texto dentro de dominios gubernamentales.

        """
	}]
)

print(chat.choices[0].message.content)


