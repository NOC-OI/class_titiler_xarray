FROM python:3.8.12

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code/

# # Install dependencies
# RUN pip install pipenv
# COPY Pipfile Pipfile.lock /code/
# RUN pipenv install --system --dev

COPY . /code/

RUN pip install --upgrade pip
RUN pip install -e . uvicorn
EXPOSE 8083
CMD ["uvicorn", "titiler.xarray.main:app", "--host", "0.0.0.0", "--port", "8083"]
