# Git ignorer
Generate .gitignore files for projects that use multiple langages. Git Ignore files are pulled from the [GitHub gitignore repo](https://github.com/github/gitignore) and appended to a .gitignore file in the directory the command is run from. If you add more languages to your repo, run ignorer with the new gitignore file you wish to add and it will be appended to the current ignore file.

Linux is supported out of the box whilst Windows requires Windows Subsystem for Linux(WSL) and git installed within WSL. 

## Setting up WSL
Follow [this](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide) handy tutorial to set up WSL. Once everything is up and running, install git.

``` $ sudo apt-get install git ```

## Setting Up Ignorer
### Installation guide
Install ignorer wherever you want

``` $ git clone https://github.com/Delphboy/ignorer.git```

Run the setup script

``` $ cd ignorer/```

``` $ bash setup.sh```

setup.sh creates a bashrc alias so you can run '$ ignorer' wherever you like

## Examples

```$ ignorer Go Ada```

Will produce the following .gitignore file:

```
# Binaries for programs and plugins
*.exe
*.dll
*.so
*.dylib

# Test binary, build with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Project-local glide cache, RE: https://github.com/Masterminds/glide/issues/736
.glide/
# Object file
*.o

# Ada Library Information
*.ali
```

if you were to then run:

```$ ignorer Composer```

You would get the following file .gitignore file:
```
# Binaries for programs and plugins
*.exe
*.dll
*.so
*.dylib

# Test binary, build with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Project-local glide cache, RE: https://github.com/Masterminds/glide/issues/736
.glide/
# Object file
*.o

# Ada Library Information
*.ali
composer.phar
/vendor/

# Commit your application's lock file http://getcomposer.org/doc/01-basic-usage.md#composer-lock-the-lock-file
# You may choose to ignore a library lock file http://getcomposer.org/doc/02-libraries.md#lock-file
# composer.lock
```