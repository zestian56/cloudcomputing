FROM python:3.9.0-buster

WORKDIR /src
ADD . /src

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "/src/__init__.py"]

