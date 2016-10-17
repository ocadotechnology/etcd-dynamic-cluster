FROM python:3-alpine

COPY requirements.txt /
COPY manage-cluster-state /

RUN pip install -r /requirements.txt

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

# Expose directory to write output to, and to potentially read certs from
VOLUME ["/etc/sysconfig/", "/etc/certs"]

CMD ["python3", "/manage-cluster-state"]
