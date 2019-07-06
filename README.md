# Terraform Landing Zone

## List of acronyms

* LZ - Landing Zone
* CLZ - Cloud Landing Zone
* AWS - Amazon Web Services

## General Definitions

### What is code for

Deploy a CLZ using Terraform.

### What is a Landing zone

I'll quote [Wikipedia](https://en.wikipedia.org/wiki/Landing_zone) here, when they define a LZ as:

```text
A landing zone (LZ) is an area where aircraft can land.
```

If we translate this to the IT we could rewrite it as:

```text
A landing zone is IT infrastructure to deploy applications.
```

### Why using a Cloud Landing Zone

A CLZ helps users to setup an initial secure and scalable baseline environment using cloud providers design best practices. That environment allow user to quickly get started with a multi-account architecture, identity and access management, governance, data security, network design, and logging.

## Solution Design

### Overview

This solution was designed with simplicity and code cleanliness in mind. Because of that is good to have some knowledge on how is the code structured and what is the content code files type.

Is also very important to mention that this LZ approach is opinionated and is enforcing all CLZ deployed with it to follow those best practices, governance and security. Nevertheless at the end code is just code and everybody should feel free to customise it :)

### Structure

![Code structure](images/clz.png)

Code is structured around two concepts `Module` and `Composition`:

#### Module
A module is a group of connected resources inherently related to the CLZ. Each Module:

1. Glue different Terraform resources (could be one or multiple)
2. Abstract complexity
3. Do one single task
4. Is not executed by Terraform commands but called from a Composition

#### Composition

Composition is a collection of modules that describes a logical part of the CLZ product. Each composition:

1. Is either global or region specific
2. Is executed once in case of the global or multiple times in case of regional
3. Requires at least a persistent variables file in case of global based compositions and an additional region specific variables for regional compositions

#### File content

Below there is a brief description of common files content separated by domain:

* Environments
  * prod
  * stg
  * dev

* Composition
  * `data.tf`:
  * `main.tf`
  * `provider.tf`
  * `variables.tf`

* Module
  * `main.tf`
  * `outputs.tf`
  * `variables.tf`
