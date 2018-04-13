
FROM jfloff/alpine-python


RUN pip3 install --upgrade pip && \
    apk update && \
    apk -v add git openssh openssl-dev libffi-dev automake autoconf \
    	gmp-dev	mpfr-dev mpc1-dev && \
    cd /tmp/ && git clone https://github.com/dlitz/pycrypto && \
    cd pycrypto && python setup.py install && \
    cd /usr/local/ && git clone https://github.com/Ganapati/RsaCtfTool.git && \
    cd /usr/local/RsaCtfTool && \
    pip3 install -r requirements.txt && pip3 install -r optional-requirements.txt && \
    pip3 install git+https://github.com/arthaud/python3-pwntools.git && \
    pip3 install flask && \
    pip3 install fire && \
    pip3 install gmpy && \
#    pip3 install primefac && \
    echo "**** generate configs/etc... ****" && \
    echo "from pwn import *" >  /etc/python_startup.rc && \
    echo "from Crypto.Util.number import bytes_to_long, long_to_bytes, size" >> /etc/python_startup.rc && \
    echo "### more stuff here ..." >> /etc/python_startup.rc && \
    echo "export PYTHONSTARTUP=/etc/python_startup.rc" >> /root/.bashrc && \
    echo "**** clean up ****" && \
    rm -rf /root/.cache /tmp/*

# for a flask server
#EXPOSE 5000
#CMD python manage.py runserver

CMD ["python"]

