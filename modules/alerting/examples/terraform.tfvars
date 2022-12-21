#Enter the desired GCP project ID
project_id = "bionic-client-345012"

#Configure the required fields for your alerting policy
log_metric_config = {
  #Alerting policy name
  proj-ownership-alert = {
    filter = <<-EOT
        (protoPayload.serviceName="cloudresourcemanager.googleapis.com")
        AND (ProjectOwnership OR projectOwnerInvitee)
        OR (protoPayload.serviceData.policyDelta.bindingDeltas.action="REMOVE"
        AND protoPayload.serviceData.policyDelta.bindingDeltas.role="roles/owner")
        OR (protoPayload.serviceData.policyDelta.bindingDeltas.action="ADD"
        AND protoPayload.serviceData.policyDelta.bindingDeltas.role="roles/owner")
        EOT
  },
  auditconfig-changes-alert = {
    filter = <<-EOT
        protoPayload.methodName="SetIamPolicy" AND
        protoPayload.serviceData.policyDelta.auditConfigDeltas:*
        EOT
  },
  customrole-changes-alert = {
    filter = <<-EOT
        resource.type="iam_role"
        AND protoPayload.methodName = "google.iam.admin.v1.CreateRole"
        OR protoPayload.methodName="google.iam.admin.v1.DeleteRole"
        OR protoPayload.methodName="google.iam.admin.v1.UpdateRole"
        EOT
  },
  firewall-changes-alert = {
    filter = <<-EOT
        resource.type="gce_firewall_rule"
        AND protoPayload.methodName:"compute.firewalls.patch"
        OR protoPayload.methodName:"compute.firewalls.insert"
        OR protoPayload.methodName:"compute.firewalls.delete"
        EOT
  },
  routes-changes-alert = {
    filter = <<-EOT
        resource.type="gce_route"
        AND (protoPayload.methodName:"compute.routes.delete"
        OR protoPayload.methodName:"compute.routes.insert")
        EOT
  },
  vpcnetwork-changes-alert = {
    filter = <<-EOT
        resource.type=gce_network
        AND (protoPayload.methodName:"compute.networks.insert"
        OR protoPayload.methodName:"compute.networks.patch"
        OR protoPayload.methodName:"compute.networks.delete"
        OR protoPayload.methodName:"compute.networks.removePeering"
        OR protoPayload.methodName:"compute.networks.addPeering")
        EOT
  },
  gcs-iam-changes-alert = {
    filter = <<-EOT
        resource.type=gcs_bucket
        AND protoPayload.methodName="storage.setIamPermissions"
        EOT
  },
  sql-config-changes-alert = {
    filter = <<-EOT
        protoPayload.methodName="cloudsql.instances.update"
        EOT
  }

}

#Configure required fields for your notification channel
notif_channel_name = "Email Notification Channel"
notif_channel_type = "email"
notif_channel_labels = {
  email_address = "fake_email@blahblah.com"
}
notif_channel_force_delete = false

#Configure the required fields for your alerting policy
alert_policy_config = {
  #Alerting policy name
  proj-ownership-alert = {
    display_name       = "Alerting policy for Project Ownership Assignments/Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  auditconfig-changes-alert = {
    display_name       = "Alerting policy for Audit Configuration Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  customrole-changes-alert = {
    display_name       = "Alerting policy for Custom Role Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  firewall-changes-alert = {
    display_name       = "Alerting policy for VPC Firewall Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  routes-changes-alert = {
    display_name       = "Alerting policy for VPC Routes Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  vpcnetwork-changes-alert = {
    display_name       = "Alerting policy for VPC Network Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  gcs-iam-changes-alert = {
    display_name       = "Alerting policy for Cloud Storage IAM role Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  },
  sql-config-changes-alert = {
    display_name       = "Alerting policy for Cloud SQL Instance config Changes"
    combiner           = "OR"
    condition_name     = "test condition"
    condition_duration = "0s"
    alerting_message   = "API has exceeded its quota limit. The systems load has increased beyond capacity, consider increasing your Global and Regional quotas. If this is unexpected behaviour, validate that this is not a bug within your platform."
    labels = {
      foo = "bar"
    }
  }

}