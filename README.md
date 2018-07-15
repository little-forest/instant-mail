# How to run
```
docker run -rm -d -e TZ=Asia/Tokyo -p 25:25 -p 110:110 -p 143:143 -v XXXX:/etc/mail littleforest.jp/instant-mail:instant-mail
```

# How to build
```
docker build -t littleforest.jp/instant-mail:instant-mail .
```

