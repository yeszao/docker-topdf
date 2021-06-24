
## Build
```shell
docker build -t md2pdf .
```
This command will create a docker image name `md2pdf`.

## Run on Linux
```shell
cvout () {
    docker run -i --rm --volume $(pwd):/work --workdir /work md2pdf md2pdf "$@"
}
```
Here, 
the first `md2pdf` is the docker image name, witch was created with build command.
the second `md2pdf` is the python md2pdf plugin install in the docker image, we use it directly.

## CSS Style
Default, the system integrate following font:
- `Arial` (Bold, Italic, Bold Italic)
- `Calibri` (Bold, Italic, Bold Italic)
- `Times New Roman` (Bold, Italic, Bold Italic)
- `Microsoft YaHei` (微软雅黑)
- `Hiragino Sans GB` (冬青黑体)
- `FZHei-B01S` (方正黑体简体)