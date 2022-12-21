gcs = {
  all_logs = {
    bucket_name           = "gold-atlas-330414-logs"
    exclusions            = []
    filter                = ""
    folder_id             = 368837092707
    include_children      = false
    kms_key_name          = "" // "projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    location              = "US"
    log_sink_name         = "gcs_sandbox_logs"
    logging_project       = "gold-atlas-330414"
    retention_period_days = 1
  }
  all_logs2 = {
    bucket_name           = "gold-atlas-330414-logs2"
    exclusions            = []
    filter                = ""
    folder_id             = 368837092707
    include_children      = false
    kms_key_name          = ""
    location              = "US"
    log_sink_name         = "gcs_sandbox_logs2"
    logging_project       = "gold-atlas-330414"
    retention_period_days = 1
  }
}

logging_bucket = {
  all_logs = {
    bucket_name      = "gold-atlas-330414-logging-folder3"
    exclusions       = []
    filter           = ""
    folder_id        = 368837092707
    include_children = false
    location         = "global"
    log_sink_name    = "gcs_sandbox_logging_bucket"
    logging_project  = "gold-atlas-330414"
    retention_days   = 1
  }
}

pubsub = {
  qradar = {
    exclusions       = []
    filter           = "(protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog)"
    folder_id        = 368837092707
    include_children = false
    kms_key_name     = "" //"projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    log_sink_name    = "sink-1"
    logging_project  = "gold-atlas-330414"
    topic_name       = "topic-1"
    pull_subscriptions = [
      {
        name                         = "qradar-sub-1"
        topic                        = "topic-1"                                            // must match value of topic_name
        ack_deadline_seconds         = 20                                                   // optional
        dead_letter_topic            = "projects/my-pubsub-project/topics/example-dl-topic" // optional
        max_delivery_attempts        = 5                                                    // optional
        maximum_backoff              = "600s"                                               // optional
        minimum_backoff              = "300s"                                               // optional
        filter                       = "attributes.domain = \"com\""                        // optional
        enable_message_ordering      = false                                                // optional
        service_account              = "service2@project2.iam.gserviceaccount.com"          // optional
        enable_exactly_once_delivery = true                                                 // optional
      }
    ]
  },
  splunk = {
    exclusions       = []
    filter           = "(protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog)"
    folder_id        = 368837092707
    include_children = false
    kms_key_name     = "" //"projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    log_sink_name    = "sink-2"
    logging_project  = "gold-atlas-330414"
    topic_name       = "topic-2"
    pull_subscriptions = [
      {
        name  = "splunk-sub-1"
        topic = "topic-2" // must match value of topic_name
      }
    ]
  }
}

billing_gcs = {
  1 = {
    bucket_name     = "gold-atlas-330414-logs"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-gcs"
    logging_project = "gold-atlas-330414"
  }
}

billing_pubsub = {
  1 = {
    topic_name      = "topic-1"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-pubsub-1"
    logging_project = "gold-atlas-330414"
  }
  2 = {
    topic_name      = "topic-2"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-pubsub-2"
    logging_project = "gold-atlas-330414"
  }
}

billing_logging_bucket = {
  1 = {
    bucket_name     = "gold-atlas-330414-logging-folder3"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-logging-bucket"
    location        = "global"
    logging_project = "gold-atlas-330414"
  }
}