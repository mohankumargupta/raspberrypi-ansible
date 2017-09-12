c = get_config()

c.NotebookApp.ip = '*'

from notebook.auth import passwd
c.NotebookApp.password = passwd('password')
