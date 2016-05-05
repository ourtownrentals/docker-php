# PHP-FPM Docker Image

[![GitHub license](https://img.shields.io/github/license/ourtownrentals/docker-php.svg)](./LICENSE.txt)

## Description

Custom docker image for PHP-FPM.
Based on the [official php image](https://hub.docker.com/_/php/).

### Modifications

#### PHP Modules

- curl
- gd
- mysqli
- ionCube loader

## Usage

### Requirements

- [Docker].

The images are built and hosted automatically on Docker Hub
at [ourtownrentals/php].

Pull with

```
$ docker pull ourtownrentals/php
```

[Docker]: https://www.docker.com/
[ourtownrentals/php]: https://hub.docker.com/r/ourtownrentals/php/

## Development and Testing

### Source Code

The [php source] is hosted on GitHub.
Clone the project with

```
$ git clone https://github.com/ourtownrentals/docker-php.git
```

[php source]: https://github.com/ourtownrentals/docker-php

### Testing Locally

Build and run the container with

```
$ docker build -t php .
$ docker run php
```

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/ourtownrentals/docker-php/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This app is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
