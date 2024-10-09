# Use the official Python image
FROM python

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only the requirements.txt file to the container first
COPY requirements.txt .

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Now copy all the application files into the container
COPY . .

# Expose port 5000 for Flask
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "Main.py"]

