# Neo4j Graph Visualization Guide
**Deployment ID:** MulticloudDeployment-2025-05-06  
**Date:** May 6, 2025

## Visualization Overview

This document provides guidance on visualizing the multicloud deployment graph in Neo4j's browser interface. The graph structure follows the hierarchical models specified in the owner rule-book and contains valuable information about the AWS, OCI, and Azure resources deployed.

## Graph Visualization Queries

### Complete Deployment View
To visualize the entire deployment graph:

```cypher
MATCH (d:Deployment {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH path = (d)-[:DEPLOYED_TO*1..10]->()
RETURN path
```

### AWS Resources Hierarchical View
To visualize the AWS resources and their hierarchy:

```cypher
MATCH (acct:AWSAccount {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH path = (acct)-[:CONTAINS*1..5]->()
RETURN path
```

### OCI Resources Hierarchical View
To visualize the OCI resources and their hierarchy:

```cypher
MATCH (tenant:OCITenant {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH path = (tenant)-[:CONTAINS*1..5]->()
RETURN path
```

### Azure Resources Hierarchical View
To visualize the Azure resources and their hierarchy:

```cypher
MATCH (tenant:AzureTenant {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH path = (tenant)-[:CONTAINS*1..5]->()
RETURN path
```

### Cross-Cloud Application Relationships
To visualize the application relationships between VMs and databases across clouds:

```cypher
MATCH (vm)-[r:CONNECTS_TO]->(db)
WHERE vm.deployment_id = "MulticloudDeployment-2025-05-06"
RETURN vm, r, db
```

### Compliance Verification View
To visualize resources with their compliance tags and metadata:

```cypher
MATCH (n {deployment_id: "MulticloudDeployment-2025-05-06"})
WHERE n.environment IS NOT NULL
RETURN n
```

### Execution Context View
To visualize the execution context and its relationship to the deployment:

```cypher
MATCH (e:ExecutionSession {deployment_id: "MulticloudDeployment-2025-05-06"})
MATCH path = (e)-[:EXECUTED]->(d:Deployment)
RETURN path
```

## Styling Recommendations for Visualization

When working with the Neo4j Browser visualization, apply the following styling to improve readability:

1. **Node Colors by Cloud Provider**:
   ```
   MATCH (n)
   WHERE n:AWSAccount OR n:AWSRegion OR n:AWSVPC OR n:AWSSubnet OR n:AWSEC2 OR n:AWSDynamoDB
   SET n.color = "#FF9900"  // AWS Orange
   ```
   ```
   MATCH (n)
   WHERE n:OCITenant OR n:OCICompartment OR n:OCIRegion OR n:OCIVCN OR n:OCISubnet OR n:OCIComputeInstance OR n:OCIMySQL
   SET n.color = "#C74634"  // OCI Red
   ```
   ```
   MATCH (n)
   WHERE n:AzureTenant OR n:AzureSubscription OR n:AzureResourceGroup OR n:AzureRegion OR n:AzureVNet OR n:AzureVM OR n:AzureSQLServer OR n:AzureSQLDatabase
   SET n.color = "#0078D4"  // Azure Blue
   ```

2. **Node Sizes by Resource Type**:
   ```
   MATCH (n)
   WHERE n:Deployment OR n:ExecutionSession
   SET n.size = 30
   ```
   ```
   MATCH (n)
   WHERE n:AWSAccount OR n:OCITenant OR n:AzureTenant
   SET n.size = 25
   ```
   ```
   MATCH (n)
   WHERE n:AWSEC2 OR n:OCIComputeInstance OR n:AzureVM OR n:AWSDynamoDB OR n:OCIMySQL OR n:AzureSQLDatabase
   SET n.size = 15
   ```

## Recommended Layout

For the best visualization in Neo4j Browser:

1. Select the "Force" layout for hierarchical relationships
2. Use "Organic" layout for application relationship views
3. Enable the "Captions" option to show node names
4. Enable the "Properties" panel to view detailed resource information

## Exporting Graph Visualizations

To export visualizations for reporting:

1. Use the camera icon in Neo4j Browser to take a snapshot
2. For high-quality exports, use the Neo4j Bloom tool with the same Cypher queries
3. For programmatic access to graph images, use the Neo4j GraphQL API with visualization extensions

## Compliance Analysis Queries

### Region Compliance Check
```cypher
MATCH (reg:AWSRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN reg.name = "eu-central-1" as IsCompliant, "AWS Region Compliance" as Check
UNION
MATCH (reg:OCIRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN reg.name = "eu-frankfurt-1" as IsCompliant, "OCI Region Compliance" as Check
UNION
MATCH (reg:AzureRegion {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN reg.name = "eastus" as IsCompliant, "Azure Region Compliance" as Check
```

### VM Size Compliance Check
```cypher
MATCH (vm:AWSEC2 {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN vm.type = "t2.micro" as IsCompliant, "AWS VM Size Compliance" as Check
UNION
MATCH (vm:OCIComputeInstance {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN vm.shape = "VM.Standard.A1.Flex" AND vm.ocpus = 1 AND vm.memory_gb = 6 as IsCompliant, "OCI VM Size Compliance" as Check
UNION
MATCH (vm:AzureVM {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN vm.size = "Standard_B1ls" as IsCompliant, "Azure VM Size Compliance" as Check
```

### OCI Private Subnet Compliance Check
```cypher
MATCH (subnet:OCISubnet {deployment_id: "MulticloudDeployment-2025-05-06"})
RETURN subnet.is_public = false as IsCompliant, "OCI Private Subnet Compliance" as Check
```

## Conclusion

This visualization guide enables effective exploration and analysis of the multicloud deployment graph in Neo4j. By using these queries and styling recommendations, you can gain valuable insights into the infrastructure deployment, verify compliance with legislative rules, and document the execution model for future reference.