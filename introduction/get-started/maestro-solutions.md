---
description: >-
  Explore Maestro's ecosystem: Studio, CLI, Cloud, and Flows, plus how they fit
  into local automation and CI/CD workflows.
---

# Maestro solutions

* **Maestro Cloud**: Hosted platform for consistent, parallel Maestro execution

### **Maestro Studio (The IDE)**

Maestro Studio is a visual interface built on top of the CLI, designed for rapid test creation and 
real-time element inspection
* By mirroring your device screen and allowing you to build [Flows](../../flows/README.md) through simple point-and-click interactions,
it serves as the primary tool for zero-code authoring and interactive debugging.

You can start building your first Flows today by visiting the [Maestro Studio](../../maestro-studio/README.md) documentation.

### **Maestro CLI**

The CLI is the open-source heart of Maestro and the core engine that powers both Maestro Studio and Maestro Cloud
* It serves as the workhorse for developers and DevOps engineers, interpreting your YAML files
to orchestrate test execution
* Because everything else is built on top of the CLI, it acts as the foundational backbone 
for all local automation and CI/CD integration.

To learn more about its technical capabilities and orchestration features,
check out the [Maestro CLI](../../maestro-cli/README.md) documentation.

### **Maestro Cloud**

Maestro Cloud is a managed execution solution designed to scale your testing infrastructure
without the overhead of managing local device farms
* It leverages the Maestro CLI to run your tests on a distributed cloud of virtual devices, 
enabling massive parallelization and providing fast and reliable feedback loops for production-ready reliability.

Explore how to scale your regression suites in the [Maestro Cloud](../../cloud/README.md) documentation.

### Which solution should I use?

Use the table below to determine which tool fits your current workflow:

| **Feature**     | **Maestro Studio**      | **Maestro CLI**         | **Maestro Cloud**                                                   |
| --------------- | ----------------------- | ----------------------- | ------------------------------------------------------------------- |
| **Best For**    | Authoring & Debugging   | Local execution & CI/CD | Reliable & scalable parallel test execution                         |
| **Interface**   | Visual (GUI)            | Terminal (Command Line) | Upload via CLI, see runs via web, notifications via Slack + Webhook |
| **Execution**   | Real-time / Interactive | Sequential (Local)      | Parallel (Simultaneous)                                             |
| **Target User** | Testers & Developers    | Engineers & DevOps      | Growth & Professional Teams                                         |
| **Environment** | Local Device/Emulator   | Local Device/Emulator   | Hosted Virtual Devices                                              |

### The typical learning path

Most teams follow a three-stage journey to automation success:

1. **Creation**: Start with [Maestro Studio](../../maestro-studio/README.md) to visually build and debug your first [Flows](../../flows/README.md).
2. **Automation**: Use the[ Maestro CLI](../../maestro-cli/README.md) to run those Flows locally and integrate them into your basic development workflow.
3. **Scaling**: Once your test suite grows, transition to [Maestro Cloud](../../cloud/README.md) to run those same tests in parallel for instant feedback on every Pull Request.

### Next steps

If you already know the Maestro solution you are going to use, access the desired documentation:

* [Maestro Studio](../../maestro-studio/README.md)
* [Maestro CLI](../../maestro-cli/README.md)
* [Maestro Cloud](../../cloud/README.md)

If you don't know how to create tests with Maestro, access the [QuickStart](quickstart.md) guide to get up and running in minutes.
