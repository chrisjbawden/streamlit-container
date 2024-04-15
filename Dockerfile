FROM python:3.7.2-slim

EXPOSE $PORT

WORKDIR /app

# check if requirements exist - if yes, install
RUN test -f requirements.txt && pip install --upgrade pip && pip install -r requirements.txt || echo "No requirements.txt found, skipping installation"

# Install Streamlit
RUN pip install streamlit

# Set the entrypoint to run Streamlit
ENTRYPOINT ["streamlit", "run"]

# Use environment variables for the default port and Python file
CMD ["--server.port", "$PORT", "$STREAMLIT_APP"]
