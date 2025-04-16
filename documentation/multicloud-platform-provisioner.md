# Multicloud Platform Provisioner

The **Multicloud Platform Provisioner** is a tool designed to simplify the provisioning of infrastructure, platforms, and services across multiple cloud providers (Azure, AWS, and OCI). It is built with modular components to ensure flexibility, scalability, and adaptability to changes in cloud service catalogs.

## Components

### 1. Executor
- **Purpose**: Provisions infrastructure, platforms, and services across Azure, AWS, and OCI.
- **Key Features**:
  - Supports all services offered by hyperscalers without hardcoding.
  - Agnostic to changes in service catalogs or parameter updates.
  - Leverages Python SDK libraries for each cloud provider.

### 2. Legislator
- **Purpose**: Provides security guidelines and ensures compliance.
- **Key Features**:
  - Stores security rules and FinOps rules in a dedicated file system server.
  - Ensures adherence to organizational and regulatory standards.

### 3. Regulator
- **Purpose**: Captures execution information for analysis and repeatability.
- **Key Features**:
  - Logs execution details for auditing and troubleshooting.
  - Enables repeatable provisioning workflows.

## Building Blocks

The **Provisioner** is built on the following foundational servers:

1. **MCP Servers**:
   - Self-built MCP servers for Azure, AWS, and OCI.
   - Leverage Python SDK libraries to interact with hyperscalers.
   - Fully agnostic to changes in service catalogs or parameters.

2. **MCP SSH Server**:
   - Facilitates secure communication and execution.

3. **File System Server**:
   - Base for storing security rules and FinOps rules.
   - Used by the Legislator component.

4. **Graph Server**:
   - Stores the Infrastructure-as-Code (IaC) representations of hyperscaler resources.
   - Enables visualization and management of provisioned resources.

5. **Memory Server**:
   - Stores conversation context for prompt-based provisioning.

## Target Users

The **Multicloud Platform Provisioner** is designed for:
- **Infrastructure/Cloud Architects**: To design and provision complex multicloud architectures.
- **DevOps Engineers**: To automate and streamline resource provisioning across hyperscalers.

## Key Benefits

- **Prompt-Based Provisioning**: Users can provision resources across Azure, AWS, and OCI using simple prompts.
- **Flexibility**: Adapts to changes in cloud service catalogs without requiring code changes.
- **Compliance**: Ensures security and financial compliance through Legislator rules.
- **Repeatability**: Captures execution details for consistent and repeatable workflows.

---
**SyntropAI**: Simplifying multicloud provisioning through innovation and systemic thinking.
