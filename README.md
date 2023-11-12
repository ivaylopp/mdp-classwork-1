# Classwork Assignment

A sample python project with a GitHub Actions pipeline.

## Pipeline Features

- Dockerize and push to dockerhub
- Vulnerability scanning of the docker image with Trivy
- Run various linters:
  - flake8
  - editorconfig-checker
  - markdownlint
- Check for leaked secrets with GitLeaks
