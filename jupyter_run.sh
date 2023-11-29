### Running jupyter lab without password or token
#!/bin/bash
jupyter lab --allow-root --ServerApp.token='' --ServerApp.password=''
