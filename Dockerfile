FROM docker.io/library/python:3

RUN apt-get update && apt-get install -y libpcsclite-dev net-tools iproute2 && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt .

RUN pip3 install -r requirements.txt

COPY ./swu_emulator.py ./

ENTRYPOINT ["python3", "swu_emulator.py"]
