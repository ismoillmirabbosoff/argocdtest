FROM python
WORKDIR /app
RUN pip install -r req.txt
CMD python3 manage.py runserver