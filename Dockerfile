FROM python:3.12-alpine

# Set the working directory
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install "fastapi[standard]"

COPY src/ ./src/
EXPOSE 8000

RUN adduser -DH appuser
USER nobody

CMD ["fastapi", "run", "src/main.py"]
