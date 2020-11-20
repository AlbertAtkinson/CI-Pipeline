FROM python:3.6
COPY . .
RUN pip install -r /files/requirements.txt
RUN pip install Flask flask-sqlalchemy pymysql pytest
EXPOSE 5000
ENTRYPOINT ["python3","app.py"]