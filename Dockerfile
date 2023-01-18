FROM python:3.8

# setup environment variable
ENV WebsiteHOME=/home/apps/website_app

# set work directory
RUN mkdir -p WebsiteHOME

# where your code lives
WORKDIR $WebsiteHOME


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copy the application code to the container
COPY . $WebsiteHOME

# Install any necessary dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port that the app will run on
EXPOSE 8000

# Run the command to start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]