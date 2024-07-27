# decode_base64_secret.py

import base64

# Cadena base64 a decodificar
secret_base64 = "roITo2yN5V8W6RbcVJ0GvjKjFbfNgs2DRirmwdpbBTQ48mSudfltuMGxmUCIjYZOIUeBSZqMUcdNRXhYgY8w=="

# Decodificación de la cadena base64
secret_decoded = base64.b64decode(secret_base64).decode('utf-8')

# Imprimir el resultado decodificado
print(secret_decoded)
