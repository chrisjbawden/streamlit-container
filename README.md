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

<b>Note:</b> its important to keep the primary app file name '\_main\_'.py" < --- this is what it look for when launching streamlit



