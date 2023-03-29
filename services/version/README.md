

Then run:
```shell
go run \
-ldflags "-X main.version=1.0.0 -X main.build=12082019" \
main.go
```

Build:

```shell
go build -o mybinary \
-ldflags "-X main.version=1.0.0 -X 'main.build=$(date)'" \
main.go
```

```shell
./mybinary
```
