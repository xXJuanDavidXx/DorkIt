# DorKit

DorKit es una herramienta de automatización para realizar búsquedas avanzadas (Google Dorks) de manera eficiente y organizada. Permite realizar búsquedas personalizadas, exportar resultados y descargar archivos específicos encontrados durante la búsqueda.

## Características

- Búsqueda automatizada usando Google Custom Search API
- Generación de dorks usando IA (OpenAI API o modelo local GPT4all)
- Exportación de resultados en formato JSON y HTML
- Descarga automática de archivos específicos
- Búsqueda con expresiones regulares en archivos locales
- Soporte para múltiples páginas de resultados
- Filtrado por idioma


## Configuración

1. Crear una API Key de Google y un ID de motor de búsqueda personalizado
2. Ejecutar la herramienta con la opción de configuración:
```bash
python DORKIT.py -c
```

## Uso

### Sintaxis básica
```bash
python DORKIT.py -q "tu_consulta" [opciones]
```

### Opciones disponibles

| Opción | Descripción |
|--------|-------------|
| `-q, --query` | Especifica el dork a buscar |
| `-c, --configure` | Inicia el proceso de configuración |
| `--start-page` | Define la página inicial de resultados (default: 1) |
| `--pages` | Número de páginas a buscar (default: 1) |
| `--lang` | Código de idioma para los resultados (default: lang_es) |
| `--json` | Exporta resultados a un archivo JSON |
| `--html` | Exporta resultados a un archivo HTML |
| `--download` | Descarga archivos específicos (ej: pdf,sql) |
| `--generar-dork` | Genera un dork usando IA basado en una descripción |
| `--ruta` | Ruta para búsqueda con regex |
| `-r, --regex` | Expresión regular para búsqueda |

### Ejemplos

1. Búsqueda básica:
```bash
python DORKIT.py -q "intitle:\"index of\" \"backup\""
```

2. Exportar resultados a JSON:
```bash
python DORKIT.py -q "filetype:pdf confidential" --json resultados.json
```

3. Búsqueda con múltiples páginas:
```bash
python DORKIT.py -q "site:ejemplo.com intext:password" --pages 3
```

4. Generar dork con IA:
```bash
python DORKIT.py --generar-dork "encontrar archivos de configuración expuestos"
```

5. Descargar archivos específicos:
```bash
python DORKIT.py -q "filetype:pdf secret" --download pdf
```

## Notas de Seguridad

- Usar esta herramienta de manera ética y legal
- Respetar los términos de servicio de los motores de búsqueda
- No realizar consultas que puedan comprometer sistemas o datos sensibles

## Variables de Entorno

La herramienta utiliza un archivo `.env` para almacenar configuraciones sensibles:
- `API_KEY_GOOGLE`: Tu API key de Google
- `ENGINE`: ID del motor de búsqueda personalizado
- `OPENAI_API_KEY`: API key de OpenAI (opcional, para generación de dorks)
