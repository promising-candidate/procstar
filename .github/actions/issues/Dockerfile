FROM python:3.14-alpine3.23

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY create_issue.py /create_issue.py

CMD ["python", "/create_issue.py"]
