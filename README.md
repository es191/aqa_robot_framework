# aqa_robot_framework

This repository contains an Automated Quality Assurance (AQA) testing framework built using Robot Framework.

- Features
- Installation
- Project Structure
- How to Run Tests
- Continuous Integration

## Features

- Web Automation using Selenium.
- Modular Test Organization for efficient test management.
- Cross-browser Testing capabilities.
- HTML Reports after test execution.
- Integration-ready for CI/CD pipelines.

## Installation

### Prerequisites

- Python 3.x
- pip
- Robot Framework
- Selenium Library

### Setup

- Clone the repository: git clone https://github.com/es191/aqa_robot_framework.git
- Install dependencies: pip install -r requirements.txt
- Download and install the appropriate WebDriver (e.g., ChromeDriver).

## How to Run Tests

- To run all tests: robot Tests/
- To run specific test files: robot Tests/test_file_name.robot

## Continuous Integration

This project can be integrated into CI/CD tools like Jenkins or GitLab CI. Use the following command in your CI pipeline to execute tests: robot --outputdir reports Tests/
