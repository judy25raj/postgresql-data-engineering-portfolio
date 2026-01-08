# Rename this file to 'hidden.py' and fill in your credentials.
# It is intentionally excluded from version control in a real project.

def elastic():
    """Return Elasticsearch connection settings.

    host:    hostname of the Elasticsearch reverse proxy
    prefix:  URL prefix (often 'elasticsearch')
    port:    port (443 for https)
    scheme:  'https' or 'http'
    user:    account / index owner (also used as index name)
    pass:    account password
    """
    return {
        "host": "www.pg4e.com",
        "prefix": "elasticsearch",
        "port": 443,
        "scheme": "https",
        "user": "pg4e_6b74d49971",
        "pass": "YOUR_ELASTIC_PASSWORD_HERE",
    }
