# How to run
```
docker run -rm -d -e TZ=Asia/Tokyo -p 25:25 -p 110:110 -p 143:143 -v XXXX:/etc/mail littlef/instant-mail:latest
```

# How to build
```
docker build -t littlef/instant-mail:latest .
```

