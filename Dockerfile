FROM python
WORKDIR /app
RUN pip install -r req.txt
CMD python3 manage.py runserver 0.0.0.0:8000