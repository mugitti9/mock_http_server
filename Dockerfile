FROM python:3.8.17-slim

COPY app/ app/
RUN pip install -r app/requirements.txt

CMD ["python", "app/main.py"]
