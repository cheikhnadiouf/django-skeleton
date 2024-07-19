# Pull base image
FROM python:3.12.4-slim-bullseye

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
# show the stdout and stderr streams right in the command line instead of getting buffered.
ENV PYTHONUNBUFFERED 1

# Set work directory
RUN mkdir /django-postgres-kube
WORKDIR /django-postgres-kube

# Install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy project
COPY . .

# Command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Port
EXPOSE 8000