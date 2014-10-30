import sae
from SDS import wsgi

application = sae.create_wsgi_app(wsgi.application)
