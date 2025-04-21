FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, Streamlit, cron, and other essentials
RUN apt update && apt install -y python3 python3-pip cron curl
RUN pip3 install streamlit --break-system-packages
RUN mkdir -p /opt/streamlit

# Copy application and boot script
COPY build/boot.sh /opt/boot.sh
COPY build/_main_.py /opt/_main_.py

# Make boot script executable
RUN chmod +x /opt/boot.sh

WORKDIR /opt/streamlit

ENTRYPOINT ["/opt/boot.sh"]
