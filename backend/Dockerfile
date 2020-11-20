FROM python:3.6
COPY . .
RUN pip install -r requirements.txt
RUN pip install Flask flask-sqlalchemy pymysql
EXPOSE 5001
ENTRYPOINT ["python3","app.py"]