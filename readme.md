A basic extension of the [MS Azure DevOps build agent](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops) extended to include Terraform, PowerShell Core and the AZ PS Modules.

Required Environment variables 

*AZP_URL*	The URL of the Azure DevOps or Azure DevOps Server instance.
*AZP_TOKEN*	Personal Access Token (PAT) with Agent Pools (read, manage) scope, created by a user who has permission to configure agents, at AZP_URL.
*AZP_AGENT_NAME*	Agent name (default value: the container hostname).
*AZP_POOL*	Agent pool name (default value: Default).
*AZP_WORK*	Work directory (default value: _work).
