<b>Description:</b>

Containerised streamlit instances, for easy docker run deployment with port configurations. 

<b>Deploy:</b>


Docker Run - 
<div style="margin-left:50px;">

docker run -d \
   -p 80:80 \
   -e PORT=80 \
   --name streamlit \
   -v /docker/streamlit-container/app:/app \
   streamlit-container
</div<

<b>Note:</b> modify the app.py in the /app directory with your app, but its important to keep the name "app.py"





<br>
<br>
------

<b>Development -</b>

sudo docker build . -t streamlit-container -f ./Dockerfile
