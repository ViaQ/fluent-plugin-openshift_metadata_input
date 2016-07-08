# fluent-plugin-openshift_metadata_input
based on [fluent-plugin-kubernetes_metadata_input](https://github.com/viaq/fluent-plugin-kubernetes_metadata_input)
Plugin watches for OpenShift resource updates and ingests them as nested JSON.
Untested, use at your own risk.

## Installation

    gem install fluent-plugin-openshift_metadata_input

## Configuration

Configuration options for fluent.conf are:

* `kubernetes_url` - URL to the API server. Set this to retrieve further kubernetes metadata for logs from kubernetes API server
* `apiVersion` - API version to use (default: `v1`)
* `ca_file` - path to CA file for Kubernetes server certificate validation
* `verify_ssl` - validate SSL certificates (default: `true`)
* `client_cert` - path to a client cert file to authenticate to the API server
* `client_key` - path to a client key file to authenticate to the API server
* `bearer_token_file` - path to a file containing the bearer token to use for authentication
* `resource` - OpenShift resource type. f.e. Projects, Routes, ClusterRoleBindings, Builds, BuildConfigs, Images, ImageStreams

### Sample configuration:
The following configuration watches for Kubernetes events and pod changes and sends them to stdout.
```
<source>
  @type openshift_metadata
  kubernetes_url https://127.0.0.1:8443
  verify_ssl false
  bearer_token_file /Users/asherkho-osx/src/fluent-plugin-kubernetes_metadata_input/bearer_token
  resource ImageStreams
</source>
<source>
  @type openshift_metadata
  kubernetes_url https://127.0.0.1:8443
  verify_ssl false
  bearer_token_file /Users/asherkho-osx/src/fluent-plugin-kubernetes_metadata_input/bearer_token
  resource Images
</source>

<match **>
  type stdout
</match>
```
### Tag
The tag is constructed as following:
```
openshift.<resource_type>.<namespace_name>.<resource_name>
```

If a resource doesn't have a namespace, namespace ```openshift-infra``` is added.

### Kubernetes labels and annotations
Labels and annotations are converted to an array of strings.
```
"labels":{
  "kubernetes.io/hostname":"origin",
  "logging-infra-fluentd":"true"
}
```
will be converted to
```
"labels": [
  "kubernetes.io/hostname=origin",
  "logging-infra-fluentd=true"
]
```
