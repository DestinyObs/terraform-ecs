# Secrets Manager Module

## Overview

This module creates a secret in AWS Secrets Manager.

## Inputs

* `secret_name`: The name of the secret.
* `secret_description`: A short description of the secret.
* `secret_string`: The secret string (usually JSON-encoded).

## Outputs

* `secret_arn`: ARN of the created secret.
* `secret_id`: ID of the created secret.
