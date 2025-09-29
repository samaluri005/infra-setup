# Infra Repo

## One-time setup
1. Enable OIDC between GitHub and Azure:
	az ad app federated-credential create \
	  --id <APP_ID> \
	  --parameters '{"name":"github-oidc","issuer":"https://token.actions.githubusercontent.com","subject":"repo:<your_org>/<your_repo>:ref:refs/heads/main"}'

2. Add GitHub secrets:
	- AZURE_CLIENT_ID
	- AZURE_TENANT_ID
	- AZURE_SUBSCRIPTION_ID

## Developer workflow
- Open PR → `infra-plan.yml` runs → shows what-if diff
- Merge PR → `infra-apply.yml` runs → deploys to Dev environment
