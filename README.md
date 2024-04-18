<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>

   
&nbsp; docker run -d \
  &nbsp;&nbsp;&nbsp; -p 80:80 \
  &nbsp;&nbsp;&nbsp; -e PORT=80 \
  &nbsp;&nbsp;&nbsp; --name streamlit \
  &nbsp;&nbsp;&nbsp; -v /docker/streamlit-container/app:/app \
  &nbsp;&nbsp;&nbsp; streamlit-container

<br>

<b>Note:</b> modify the app.py in the /app directory with your app, but its important to keep the name "app.py"




<br>
<br>
------

<b>Development -</b>

sudo docker build . -t streamlit-container -f ./Dockerfile
