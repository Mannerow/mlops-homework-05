FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ensure Jupyter and nbconvert are installed
RUN pip install jupyter nbconvert

# Copy the workflow script into the container
COPY run_workflow.sh /app/run_workflow.sh

# Make the workflow script executable
RUN chmod +x /app/run_workflow.sh

# Create the data directory
RUN mkdir -p /app/data

# Copy the config directory
COPY config /app/config

# Copy the dashboards directory
COPY dashboards /app/dashboards

# Run the workflow script when the container launches
CMD ["/app/run_workflow.sh"]