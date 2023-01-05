# Table of contents

1. [Terraform Structure Template](#terraform-structure-template-)
2. [Repo Description](#repo-description)
3. [Get Started](#get-started-)
   1. [Environments](#Environments)
   2. [Modules](#Modules)

# Terraform Structure Template 📝

This repository hosts a terraform template for all the google cloud projects. Every project should
follow some or all of the structure in order for Terraform COE review. This structure/template
follows most of the terraform best practices recommened by Google.
You can find the terraform COE review checklist [here](https://docs.google.com/spreadsheets/d/1Qi-b9GAB1_hKpj1e5ByvlnZKqTq4HO0SArh7otNqqhU/edit?usp=sharing).

# Repo Description

This repository is built for all the teams that are involved in google cloud development.
All the TPM's for any google cloud project needs this repository to be shared across the development team.
The TPM's/Tech Lead should fork this repository and start using this as their base template for all their infrastructure development.

## Get Started 🚀

The following sections will describe the usage of this repository. As explained above, one needs to fork this repository and start using it as a base for their own projects.

The structure of the repo and their usage are described below -

```
|- environments
  |- project
    |- dev
    |- prod
    |- uat
    |- modules
  |- resources
    |- dev
    |- prod
    |- uat
    |- modules
|- groups
  |- dev
  |- prod
  |- uat
  |- modules
|- modules
  |- alerting 
  |- app_engine_firewall 
  |- bigquery 
  |- cloud_build 
  |- cloud_iam 
  |- cloud_storage 
  |- composer 
  |- compute_engine 
  |- custom_role 
  |- data_catalog 
  |- dataflow 
  |- dns 
  |- folder_factory 
  |- groups 
  |- logging 
  |- nat 
  |- org_policy 
  |- project 
  |- pubsub 
  |- router 
  |- service_account 
  |- vpc-network
```

The repo is divided into 3 important folders - environments, modules, and groups.

### Environments

The environments folder should contain the projects and resources that you want to build. In this template the assumption is we want to create one project for different environments i.e. dev, prod, and uat. The idea of this structure is to separate the creation of projects with the creation of it's resources.

Therefore, you can find the respective environment specific folders inside *environments/project* and *environments/resources*. In addition to that, there is a modules folder inside project and resources sub-directory. The purpose of this modules folder is to maintain consistency of resources across different environments. All the resources that needs to be created should be created inside modules folder by calling the root modules. For ex. if I want to create a gcs bucket resource, I will create the following module block inside *environments/resources/modules* 

```
module "buckets" {
  source = "../../../modules/cloud_storage"
  ...
}
```

Similarly, if I want to create a project, I will use the following module block inside *environments/project/modules*

```
module "project" {
  source = "../../../modules/project"
  ...
}
```

The reason behind separating projects and resources into two different folders is to create segregation between creation of projects and it's resources. This reduces the blast radius if something goes wrong in the creation of resources doesn't affect the project resources. In addition to that, the state of project creation should be stored in a different bucket in a bootstrap project. Similarly, while creation of resources for a project the project's bucket should be used as state bucket.

In the module section, we will see what modules are currently present to use and how one can use these models.

### Modules 🔥
