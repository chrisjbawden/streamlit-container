<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>

   
&nbsp; docker run -d \\ \n
  &nbsp;&nbsp;&nbsp; -p 8501:8501 \\ \n
  &nbsp;&nbsp;&nbsp; --name [app name] \\ \n
  &nbsp;&nbsp;&nbsp; -v [directory where you app files are]:/opt/streamlit \\ \n
  &nbsp;&nbsp;&nbsp; streamlit-container

<br>

<b>Note:</b> its important to keep the primary app file name '\_main\_'.py" < --- this is what it look for when launching streamlit



