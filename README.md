<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>

   
docker run -d \ \
  &nbsp;&nbsp;&nbsp; -p 8501:8501 \ \
  &nbsp;&nbsp;&nbsp; --name [app name] \ \
  &nbsp;&nbsp;&nbsp; -v [directory where you app files are]:/opt/streamlit \ \
  &nbsp;&nbsp;&nbsp; chrisjbawden/streamlit-container

<br>

Deployment:

<br>

<b>Note:</b> The boot script will look for an "app.py" as the streamlit application in the directory you set.



