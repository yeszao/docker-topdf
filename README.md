## Usage
1. Install Docker and start it.
2. Transfer `mycv.md` to `mycv.pdf` with one of the following command:
```shell
# without any stylesheet
docker run -i --rm --volume $(pwd):/work --workdir /work yeszao/topdf md2pdf mycv.md

# with topdf comes with stylesheet
docker run -i --rm --volume $(pwd):/work --workdir /work yeszao/topdf md2pdf mycv.md --theme=/css/cv.css

# with completely custom stylesheet
docker run -i --rm --volume $(pwd):/work --workdir /work yeszao/topdf md2pdf mycv.md --theme=style.css
```
Where,
- `yeszao/topdf` is the docker image name.
- `md2pdf` is the python plugin `md2pdf` installed in the docker image, we can use it directly.
- `--theme` use custom style sheet. You can:
    - let it blank,
    - using `topdf` comes with style `/css/cv.css`,
    - or any other stylesheet placed in a current directory, here is `style.css`.
- For convenience, we recommend [naming alias for this command](#set-command-alias).


## Set command alias

After naming alias, you can use it like this:
```shell
topdf mycv.md
topdf mycv.md --theme=/css/cv.css
```

### Mac OS X or Linux
open `~/.bashrc` or `~/.zshrc`, add following line:
```shell
alias topdf='docker run -i --rm --volume $(pwd):/work --workdir /work yeszao/topdf md2pdf'
```

### Windows
1. Create a file name `alias.bat` under `%USERPROFILE%` folder, content:
```shell
@doskey topdf=docker run -i --rm --volume $(pwd):/work --workdir /work yeszao/topdf $*
```

2. Create another file name `alias.reg`, content:
```shell
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Microsoft\Command Processor]
"AutoRun"="%USERPROFILE%\\alias.bat"
```

3. Double click `alias.reg` file, you can now use the `topdf` command on the CMD:


## Fonts
Default, `topdf` image had included following fonts, you can just use it at your css file:
- `Arial` (Bold, Italic, Bold Italic)
- `Calibri` (Bold, Italic, Bold Italic)
- `Times New Roman` (Bold, Italic, Bold Italic)
- `Microsoft YaHei` (微软雅黑)
- `Hiragino Sans GB` (冬青黑体)
- `FZHei-B01S` (方正黑体简体)


## Build and Push (Just for maintainers)
First, get an access token from [hub.docker.com](https://hub.docker.com/settings/security), then login with this access token:
```shell
docker login --username <username>
```
Build the image and push it to hub.docker.com:
```shell
docker build -t yeszao/topdf -t yeszao/topdf:0.2 .
docker push yeszao/topdf --all-tags
```
