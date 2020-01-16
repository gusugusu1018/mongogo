# check current direcotry

```
$ basename $(pwd)
mongogo
```

# build image

```
$ docker-compose build
```

# run cluster

```
$ docker-compose up -d
```

# run cluster

```
$ docker-compose stop
```

# push to gitlab container registory
```
$ docker-compose push
```

# build for development

```
$ docker-compose -f docker-compose-dev.yml build
```

# run cluster

```
$ docker-compose -f docker-compose-dev.yml up -d
```

# run cluster

```
$ docker-compose -f docker-compose-dev.yml stop
```
