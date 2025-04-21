<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>

   
&nbsp; docker run -d \
  &nbsp;&nbsp;&nbsp; -p 8501:8501 \
  &nbsp;&nbsp;&nbsp; --name streamlit \
  &nbsp;&nbsp;&nbsp; -v [directory]:/opt/streamlit \
  &nbsp;&nbsp;&nbsp; streamlit-container

<br>

<b>Note:</b> modify the app.py in the /app directory with your app, but its important to keep the name "app.py"




<br>
<br>
------

<b>Development -</b>

sudo docker build . -t streamlit-container -f ./Dockerfile
