# Table of contents

1. [Terraform Structure Template](#terraform-structure-template-)
2. [Repo Description](#repo-description)
3. [Get Started](#get-started-)
   1. [Environments](#Environments-)
   2. [Groups](#Groups-)
   3. [Modules](#Modules-)

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
|- organization
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

The repo is divided into 3 important folders - environments, modules, and organization.

### Environments 👍

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

### Organization 👀️

There is an organization folder that contains a groups folder. This is created as a template to create google groups using terraform. As groups are not part of any project and are resources that are linked to organization. You can find the environment related terraform scripts for the groups creation in different folders under groups like dev, prod, etc.

This organization folder should contain all the resources that are created on an organization level.

### Modules 🔥

The modules folder contains different modules prepared as part of the template. The project and resources per environment should use these modules to create google cloud infra.

The list of modules -


| Module                                       | Description                                                                                                                                                                                                                                                                                                                            |
| ---------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Alerting](./modules/alerting)               | This module is for creating user metrics, notification channel, and alerting<br /> policy                                                                                                                                                                                                                                              |
| [Bigquery](./modules/bigquery)               | To create bigquery dataset, tables, views, and external tables                                                                                                                                                                                                                                                                         |
| [Cloud Build](./modules/cloud_build)         | This module creates pull request trigger and push trigger. In addition to that, it has a submodule to create a cloud build private pool.                                                                                                                                                                                               |
| Cloud IAM                                    | This is cloud IAM module that provides specific permission on the following cloud resource objects -<br />-[folder_iam](./modules/cloud_iam/folder_iam)<br />-[project_iam](./modules/cloud_iam/project_iam)<br />-[service_account_iam](./modules/cloud_iam/service_account_iam)<br />-[storage_iam](./modules/cloud_iam/storage_iam) |
| [Cloud Storage](./modules/cloud_storage)     | This module create a google cloud storage bucket in a project                                                                                                                                                                                                                                                                          |
| [Composer](./modules/composer)               | This module is responsible for create a composer environment v2                                                                                                                                                                                                                                                                        |
| [Compute Engine](./modules/compute_engine)   | This module has two submodules - instance_template module creates a compute instance template, compute_instance module create the compute instance using the instance template                                                                                                                                                         |
| [Custom Role](./modules/custom_role)         | It creates a custom role on either organization level or project level as per the parameters specified.                                                                                                                                                                                                                                |
| [Data Catalog](./modules/data_catalog)       | This module has two submodules i.e. tag_template and taxonomy_policy_tags. tag_template module can be used to create data catalog tag template, and taxonomy_policy_tags module can be used to create policy tags.                                                                                                                     |
| [Dataflow](./modules/dataflow)               | This module is meant for only enabling dataflow api in the project. Ideally, dataflow jobs should be created by any other pipeline rather than using terraform like, cloud build.                                                                                                                                                      |
| [DNS](./modules/dns)                         | It creates DNS private zones in a given project.                                                                                                                                                                                                                                                                                       |
| [Folder Factory](./modules/folder_factory)   | The folder factory module does three things - It creates a working folder inside a root folder, secondly it creates environment folders under the working folder.                                                                                                                                                                      |
| [Groups](./modules/groups)                   | This module creates google identity groups.                                                                                                                                                                                                                                                                                            |
| [Logging](./modules/logging)                 | This module is used for creating logging project with logging sinks. More details can be find in the module's own readme.                                                                                                                                                                                                              |
| [NAT](./modules/nat)                         | It is used to create cloud NAT resource in a given project.                                                                                                                                                                                                                                                                            |
| [Org Policy](./modules/org_policy)           | This module can be used to create organization policy rules for an organization.                                                                                                                                                                                                                                                       |
| [Project Factory](./modules/project)         | This module can be used to create every part of a new google project. It creates a project, deactivates the default service account, create TF state bucket, creates a new TF service acount, and adds permission to the new service account.                                                                                          |
| [Pubsub](./modules/pubsub)                   | It can be used to create pubsub topics and subscriptions.                                                                                                                                                                                                                                                                              |
| [Router](./modules/router)                   | This is a google cloud router module.                                                                                                                                                                                                                                                                                                  |
| [Service Account](./modules/service_account) | It creates service account inside a project with defined permission and roles.                                                                                                                                                                                                                                                         |
| [VPC Network](./modules/vpc-network)         | This module creates a new VPC network, reserves private IP ranges (if required), and creates VPC peering (if needed)                                                                                                                                                                                                                   |
