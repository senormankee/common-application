# common-application

This repo holds the code for the common application Terraform and reusable workflows

This code will create the following 

ECS Task definition

Terraform code can be found in the .tf folder in the root of the repo

Pre-Req

You must of already of deployed the common-infrastructure repo as this will create the services that are required to deploy this code.

The purpose of this code is to create a Task Definition, Build a Docker Container, Push the container to ECR and then to update the ecs service so that the updated Task Definition is applied.

Create a new repo and a folder called .github/workflows - in there copy the template workflow actions from the root of the repo.

Create secrets in the new repo called AWS_ACCOUNT_ID, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, TF_VAR_region (if different from eu-west-1) and TF_VAR_cluster_bucket_suffix

For the pipeline to run, you also need to supply a Personal Access Token what allows read/write to the repo you have created, it also needs access to Workflows if its a new style token

The above Token needs to be added to Github actions secrets as GIT_TOKEN.

*Triggers*

The Workflows trigger on branch based actions.

A terraform Plan triggers on a push action of any branch

A terraform Apply triggers on a merge of any branch to main

A terraform Destroy triggers on a push of a branch called "destroy" (Do not merge this branch just delete once destroy is complete)

A Docker Build runs on a push action from any branch

A Docker Push (to ecr) is performed on a merge of any branch to main

An update to the ECS service runs once all of the above steps are complete.

Tech Debt

The remaining tasks are required

Add code for ELB creation and point to the new service.
Move the Docker build location to a variable
Add a variable for a git tag rather than using the latest version of a build
