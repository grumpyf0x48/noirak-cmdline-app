# java-command-line-quickstart

[![Build](https://github.com/grumpyf0x48/java-command-line-quickstart/actions/workflows/build.yml/badge.svg)](https://github.com/grumpyf0x48/java-command-line-quickstart/actions/workflows/build.yml)
[![Native Build](https://github.com/grumpyf0x48/java-command-line-quickstart/actions/workflows/native_build.yml/badge.svg)](https://github.com/grumpyf0x48/java-command-line-quickstart/actions/workflows/native_build.yml)

**java-command-line-quickstart** is a template repository to bootstrap a new command line application using:

- Java 17
- Gradle 8 with Kotlin DSL for build
- GraalVM for native build
- Picocli for command line parsing
- Picocli Code Generation for Bash completion script generation
- Maven Central for dependencies
- JUnit 5 for tests
- EditorConfig for code formatting
- GitHub workflow for running tests and uploading artifacts
- Renovate for dependencies update

## Rename application

By default, this template creates an application named `command_line_quickstart`.

To rename it, for example to `brand-new-app`, start the following command:

```shell
APPLICATION_NAME=brand-new-app make update-application
```

## Run application

```shell
./gradlew run "--args=--help"

> Task :run
Usage: Command [-hV]
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
```

```shell
./build/native/nativeCompile/command_line_quickstart --help
Usage: Command [-hV]
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
```
