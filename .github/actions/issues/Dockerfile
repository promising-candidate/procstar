FROM python:3.14-alpine3.23

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY issues.py /issues.py

CMD ["python", "/issues.py"]
