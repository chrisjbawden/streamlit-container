FROM python

EXPOSE $PORT

WORKDIR /app

# Copy the script for installing requirements
COPY installrequirements.sh /usr/local/bin/installrequirements.sh
COPY app.py /app

# Make the script executable
RUN chmod +x /usr/local/bin/installrequirements.sh

# Install Streamlit
RUN pip install streamlit

# Set the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/installrequirements.sh"]

# Use environment variables for the default port and Python file
CMD streamlit run --server.port $PORT /app/app.py
