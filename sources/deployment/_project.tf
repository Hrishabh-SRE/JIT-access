    terraform {
      backend "gcs" {
        bucket   = "$PROJECT_ID-state"
        prefix   = "terraform"
      }
    }

    locals {
      project_id = "$PROJECT_ID"
      primary_domain = "$PRIMARY_DOMAIN"
      organization_id = "$(gcloud organizations list --filter "displayName=$PRIMARY_DOMAIN" --format "value(name)")"
      customer_id = "$(gcloud organizations list --filter "displayName=$PRIMARY_DOMAIN" --format "value(owner.directoryCustomerId)")"
    }

    provider "google" {
      project    = local.project_id
    }