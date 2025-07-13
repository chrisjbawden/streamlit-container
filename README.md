Containerised streamlit instances that uses a boot.sh for easy management.

<br>
<br>

Example deployment command -

<br>
<br>

docker run -d
&nbsp;&nbsp;&nbsp; -p 8501:8501 <br>
&nbsp;&nbsp;&nbsp; --name [app name] <br>
&nbsp;&nbsp;&nbsp; -v [directory where you app files are]:/opt/streamlit <br>
&nbsp;&nbsp;&nbsp; chrisjbawden/streamlit-container <br>

<br>
<br>

Note: modify the app.py in the /app directory with your own app - its important to keep the name "app.py" unless you modify the boot.sh




