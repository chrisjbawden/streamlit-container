<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>


<span style="padding-left: 10%;" width="90%">
Docker Run - 
<span style="margin-left: 30pt; width: 80%">
   
docker run -d \
   -p 80:80 \
   -e PORT=80 \
   --name streamlit \
   -v /docker/streamlit-container/app:/app \
   streamlit-container
</span>
<br>

<b>Note:</b> modify the app.py in the /app directory with your app, but its important to keep the name "app.py"
</span>




<br>
<br>
------

<b>Development -</b>

sudo docker build . -t streamlit-container -f ./Dockerfile
