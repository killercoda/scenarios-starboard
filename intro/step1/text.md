> Starboard attempts to integrate heterogeneous security tools by incorporating their outputs into Kubernetes CRDs (Custom Resource Definitions) and from there, making security reports accessible through the Kubernetes API.
> <br><br>
> This way users can find and view the risks that relate to different resources in what we call a Kubernetes-native way. ([source](https://aquasecurity.github.io/starboard))

<br>

### Verify Installation
Starboard has been installed like described [here](https://aquasecurity.github.io/starboard/latest/operator/installation/kubectl), wait till all commands finish.

To confirm that the operator is running, check that the starboard-operator Deployment in the starboard-system namespace is available and all its containers are ready:

```plain
kubectl -n starboard-system get deployment
```{{exec}}


<br>

### Workloads scanning
Let's create the nginx Deployment that we know is vulnerable:

```plain
kubectl create deployment nginx --image nginx:1.16
```{{exec}}

If everything goes fine, the operator saves scan reports as VulnerabilityReport and ConfigAuditReport resources in the default namespace.

```plain
kubectl get vulnerabilityreports -o wide
```{{exec}}

```plain
kubectl get configauditreports -o wide
```{{exec}}


<br>

### Starboard CLI
Install the CLI:

```plain
wget https://github.com/aquasecurity/starboard/releases/download/v0.15.8/starboard_linux_x86_64.tar.gz
tar xzf starboard_linux_x86_64.tar.gz
cp ./starboard /usr/local/bin/kubectl-starboard
mv ./starboard /usr/local/bin/starboard
```{{exec}}

We can now run `starboard`{{exec}} or `kubectl starboard`{{exec}}

Use the CLI:

```plain
kubectl starboard scan configauditreports deployment/nginx
kubectl starboard get configauditreports deployment/nginx -o yaml
```{{exec}}

<br>

### More
[Getting Started](https://aquasecurity.github.io/starboard/latest)
