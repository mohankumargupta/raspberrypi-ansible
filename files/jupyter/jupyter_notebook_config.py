c = get_config()
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '*'
c.NotebookApp.base_url = '/jupyter'
c.NotebookApp.trust_xheaders = True
c.NotebookApp.tornado_settings = {'static_url_prefix': '/jupyter/static/'}

from notebook.auth import passwd
c.NotebookApp.password = passwd('')
